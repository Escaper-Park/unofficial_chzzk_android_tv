import 'dart:async';
import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';

/// Keeps a bounded set of decoded image streams alive for one time bucket.
///
/// The retained completers are independent from Flutter's global [ImageCache],
/// so temporarily clearing or evicting that cache does not reload images that
/// are still needed in the current bucket.
final class BucketedImageStreamRetainer extends ChangeNotifier {
  BucketedImageStreamRetainer({
    required this.bucketDuration,
    this.maximumSize = 16,
    DateTime Function()? now,
  }) : assert(bucketDuration > Duration.zero),
       assert(maximumSize > 0),
       _now = now ?? DateTime.now {
    _setBucket(_bucketStartFor(_now()));
    _scheduleNextBoundary();
  }

  final Duration bucketDuration;
  final int maximumSize;
  final DateTime Function() _now;

  final LinkedHashMap<_BucketedImageKey, _RetainedImageStream> _streams =
      LinkedHashMap<_BucketedImageKey, _RetainedImageStream>();

  Timer? _boundaryTimer;
  late int _bucketStartMilliseconds;
  late DateTime Function() _bucketNow;
  bool _disposed = false;

  /// A stable clock function for the current bucket.
  ///
  /// Its identity changes only when the bucket changes, which lets callers use
  /// it as a memoization key when constructing cache-busted thumbnail URLs.
  DateTime Function() get bucketNow {
    _synchronizeBucket(notify: false);
    return _bucketNow;
  }

  /// Wraps [provider] so equal image keys resolve to a retained completer.
  ImageProvider<Object> retain(ImageProvider<Object> provider) {
    _synchronizeBucket(notify: false);
    return BucketedImageProvider(
      provider: provider,
      retainer: this,
      bucketStartMilliseconds: _bucketStartMilliseconds,
    );
  }

  @visibleForTesting
  int get debugRetainedStreamCount => _streams.length;

  void _synchronizeBucket({required bool notify}) {
    final bucketStartMilliseconds = _bucketStartFor(_now());
    if (bucketStartMilliseconds == _bucketStartMilliseconds) {
      return;
    }

    _clearStreams();
    _setBucket(bucketStartMilliseconds);
    _scheduleNextBoundary();
    if (notify && !_disposed) {
      notifyListeners();
    }
  }

  int _bucketStartFor(DateTime value) {
    final bucketMilliseconds = bucketDuration.inMilliseconds;
    return value.millisecondsSinceEpoch -
        value.millisecondsSinceEpoch % bucketMilliseconds;
  }

  void _setBucket(int bucketStartMilliseconds) {
    _bucketStartMilliseconds = bucketStartMilliseconds;
    final value = DateTime.fromMillisecondsSinceEpoch(bucketStartMilliseconds);
    _bucketNow = () => value;
  }

  void _scheduleNextBoundary() {
    _boundaryTimer?.cancel();
    if (_disposed) {
      return;
    }

    final nowMilliseconds = _now().millisecondsSinceEpoch;
    final nextBoundaryMilliseconds =
        _bucketStartMilliseconds + bucketDuration.inMilliseconds;
    final delayMilliseconds = nextBoundaryMilliseconds - nowMilliseconds;
    _boundaryTimer = Timer(
      Duration(milliseconds: delayMilliseconds > 0 ? delayMilliseconds : 1),
      _handleBoundary,
    );
  }

  void _handleBoundary() {
    if (_disposed) {
      return;
    }

    _synchronizeBucket(notify: true);
  }

  ImageStreamCompleter? _retainedCompleterFor(_BucketedImageKey key) {
    _synchronizeBucket(notify: false);
    if (key.bucketStartMilliseconds != _bucketStartMilliseconds) {
      return null;
    }

    final retained = _streams.remove(key);
    if (retained == null) {
      return null;
    }

    // Reinsertion makes this a small LRU rather than a first-loaded cache.
    _streams[key] = retained;
    return retained.completer;
  }

  ImageStreamCompleter _retainCompleter(
    _BucketedImageKey key,
    ImageStreamCompleter completer,
  ) {
    _synchronizeBucket(notify: false);
    if (_disposed || key.bucketStartMilliseconds != _bucketStartMilliseconds) {
      return completer;
    }

    final existing = _streams.remove(key);
    if (existing != null) {
      _streams[key] = existing;
      return existing.completer;
    }

    final retained = _RetainedImageStream(
      completer: completer,
      handle: completer.keepAlive(),
    );
    _streams[key] = retained;

    while (_streams.length > maximumSize) {
      final oldestKey = _streams.keys.first;
      _streams.remove(oldestKey)?.dispose();
    }
    return completer;
  }

  void _clearStreams() {
    final streams = _streams.values.toList(growable: false);
    _streams.clear();
    for (final stream in streams) {
      stream.dispose();
    }
  }

  @override
  void dispose() {
    if (_disposed) {
      return;
    }

    _disposed = true;
    _boundaryTimer?.cancel();
    _boundaryTimer = null;
    _clearStreams();
    super.dispose();
  }
}

final class BucketedImageProvider extends ImageProvider<Object> {
  const BucketedImageProvider({
    required this.provider,
    required this.retainer,
    required this.bucketStartMilliseconds,
  });

  final ImageProvider<Object> provider;
  final BucketedImageStreamRetainer retainer;
  final int bucketStartMilliseconds;

  @override
  Future<Object> obtainKey(ImageConfiguration configuration) {
    return provider
        .obtainKey(configuration)
        .then<Object>(
          (providerKey) => _BucketedImageKey(
            retainer: retainer,
            bucketStartMilliseconds: bucketStartMilliseconds,
            providerKey: providerKey,
          ),
        );
  }

  @override
  void resolveStreamForKey(
    ImageConfiguration configuration,
    ImageStream stream,
    Object key,
    ImageErrorListener handleError,
  ) {
    final bucketedKey = key as _BucketedImageKey;
    final retained = retainer._retainedCompleterFor(bucketedKey);
    if (retained != null) {
      stream.setCompleter(retained);
      return;
    }

    final providerStream = provider.resolve(configuration);
    final completer = providerStream.completer;
    if (completer == null) {
      throw StateError(
        'The wrapped image provider must synchronously create its completer.',
      );
    }

    stream.setCompleter(retainer._retainCompleter(bucketedKey, completer));
  }
}

@immutable
final class _BucketedImageKey {
  const _BucketedImageKey({
    required this.retainer,
    required this.bucketStartMilliseconds,
    required this.providerKey,
  });

  final BucketedImageStreamRetainer retainer;
  final int bucketStartMilliseconds;
  final Object providerKey;

  @override
  bool operator ==(Object other) {
    return other is _BucketedImageKey &&
        identical(other.retainer, retainer) &&
        other.bucketStartMilliseconds == bucketStartMilliseconds &&
        other.providerKey == providerKey;
  }

  @override
  int get hashCode => Object.hash(
    identityHashCode(retainer),
    bucketStartMilliseconds,
    providerKey,
  );
}

final class _RetainedImageStream {
  const _RetainedImageStream({
    required this.completer,
    required this.handle,
  });

  final ImageStreamCompleter completer;
  final ImageStreamCompleterHandle handle;

  void dispose() => handle.dispose();
}
