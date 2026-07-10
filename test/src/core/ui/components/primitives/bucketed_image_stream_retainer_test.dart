import 'package:flutter/foundation.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/components/primitives/bucketed_image_stream_retainer.dart';

void main() {
  setUp(_clearGlobalImageCache);
  tearDown(_clearGlobalImageCache);

  test('global cache eviction still reuses the retained completer', () {
    final retainer = BucketedImageStreamRetainer(
      bucketDuration: const Duration(minutes: 3),
      now: () => DateTime.fromMillisecondsSinceEpoch(1000),
    );
    final provider = _CountingImageProvider('thumbnail');

    final first = _resolve(retainer, provider);
    _clearGlobalImageCache();
    final second = _resolve(retainer, provider);

    expect(second, same(first));
    expect(provider.loadCount, 1);
    expect(retainer.debugRetainedStreamCount, 1);

    _clearGlobalImageCache();
    retainer.dispose();
  });

  testWidgets('bucket expiry releases old streams before retaining new ones', (
    tester,
  ) async {
    var currentTime = DateTime.fromMillisecondsSinceEpoch(179999);
    final retainer = BucketedImageStreamRetainer(
      bucketDuration: const Duration(minutes: 3),
      now: () => currentTime,
    );
    final provider = _CountingImageProvider('thumbnail');

    final first = _resolve(retainer, provider);
    _clearGlobalImageCache();

    currentTime = DateTime.fromMillisecondsSinceEpoch(180001);
    await tester.pump(const Duration(milliseconds: 1));

    expect(retainer.debugRetainedStreamCount, 0);
    expect(first.disposed, isTrue);

    final second = _resolve(retainer, provider);
    expect(second, isNot(same(first)));
    expect(provider.loadCount, 2);
    expect(retainer.debugRetainedStreamCount, 1);

    _clearGlobalImageCache();
    retainer.dispose();
  });

  test('retained stream count is bounded with LRU eviction', () {
    final retainer = BucketedImageStreamRetainer(
      bucketDuration: const Duration(minutes: 3),
      maximumSize: 2,
      now: () => DateTime.fromMillisecondsSinceEpoch(1000),
    );
    final firstProvider = _CountingImageProvider('first');
    final secondProvider = _CountingImageProvider('second');
    final thirdProvider = _CountingImageProvider('third');

    final first = _resolve(retainer, firstProvider);
    _resolve(retainer, secondProvider);
    _resolve(retainer, thirdProvider);

    expect(retainer.debugRetainedStreamCount, 2);
    _clearGlobalImageCache();
    expect(first.disposed, isTrue);

    final reloadedFirst = _resolve(retainer, firstProvider);
    expect(reloadedFirst, isNot(same(first)));
    expect(firstProvider.loadCount, 2);
    expect(retainer.debugRetainedStreamCount, 2);

    _clearGlobalImageCache();
    retainer.dispose();
  });

  test('dispose releases every retained stream', () {
    final retainer = BucketedImageStreamRetainer(
      bucketDuration: const Duration(minutes: 3),
      now: () => DateTime.fromMillisecondsSinceEpoch(1000),
    );
    final completer = _resolve(
      retainer,
      _CountingImageProvider('thumbnail'),
    );
    _clearGlobalImageCache();

    retainer.dispose();

    expect(retainer.debugRetainedStreamCount, 0);
    expect(completer.disposed, isTrue);
  });
}

_TestImageStreamCompleter _resolve(
  BucketedImageStreamRetainer retainer,
  _CountingImageProvider provider,
) {
  final stream = retainer.retain(provider).resolve(ImageConfiguration.empty);
  expect(stream.completer, isA<_TestImageStreamCompleter>());
  return stream.completer! as _TestImageStreamCompleter;
}

void _clearGlobalImageCache() {
  PaintingBinding.instance.imageCache
    ..clear()
    ..clearLiveImages();
}

final class _CountingImageProvider extends ImageProvider<String> {
  _CountingImageProvider(this.cacheKey);

  final String cacheKey;
  int loadCount = 0;

  @override
  ImageStreamCompleter loadImage(String key, ImageDecoderCallback decode) {
    loadCount += 1;
    return _TestImageStreamCompleter();
  }

  @override
  Future<String> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture(cacheKey);
  }
}

final class _TestImageStreamCompleter extends ImageStreamCompleter {
  bool disposed = false;

  @override
  void onDisposed() {
    disposed = true;
    super.onDisposed();
  }
}
