import 'dart:io';

final class VodPlaybackCache {
  VodPlaybackCache._(this._directory);

  final Directory _directory;
  var _deleted = false;

  static Future<VodPlaybackCache> createTemp() async {
    return VodPlaybackCache._(
      await Directory.systemTemp.createTemp('chzzk_vod_player_'),
    );
  }

  Future<File> writeFile({
    required String fileName,
    required String text,
  }) async {
    final file = File(
      '${_directory.path}${Platform.pathSeparator}$fileName',
    );
    await file.writeAsString(text, flush: true);
    return file;
  }

  Future<void> delete() async {
    if (_deleted) {
      return;
    }

    _deleted = true;
    try {
      if (_directory.existsSync()) {
        await _directory.delete(recursive: true);
      }
    } on Object {
      // Playback cache cleanup is best-effort.
    }
  }

  @override
  String toString() => 'VodPlaybackCache';
}
