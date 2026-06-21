part of 'home_immersive_background.dart';

final class _PendingImageLoad {
  const _PendingImageLoad({
    required this.stream,
    required this.listener,
    required this.completer,
  });

  final ImageStream stream;
  final ImageStreamListener listener;
  final Completer<bool> completer;

  void cancel() {
    stream.removeListener(listener);
    if (!completer.isCompleted) {
      completer.complete(false);
    }
  }
}
