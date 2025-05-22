import '../../../utils/shared_preferences/shared_prefs.dart';
import '../model/stream_settings.dart';
import '../../../utils/shared_preferences/shared_prefs_repository.dart';

class StreamSettingsRepository extends SharedPrefsRepository<StreamSettings> {
  StreamSettingsRepository({
    required super.prefs,
    super.dbKey = SharedPrefsDBKey.streamSettings,
  });

  @override
  StreamSettings initValue() {
    StreamSettings settings = StreamSettings(
      resolutionIndex: 3, // 1080p
      multiviewResolutionIndex: 2, // 720p
      vodResolutionIndex: 1, // 1080p
      liveChatWindowIndex: 0, // 0: off, 1: overlay, 2: side
      vodChatWindowIndex: 0, // 0: off, 1: overlay, 2: side
      overlayControlsDisplayTime: 10,
      latencyIndex: 1, // LLHLS
      vodPlaybackIntervalIndex: 1, // 10s
      showGroupInVideoPlayer: 0, // false
    );

    return settings;
  }

  @override
  Map<String, dynamic> toJson(StreamSettings item) {
    return item.toJson();
  }

  @override
  StreamSettings fromJson(Map<String, dynamic> json) {
    return StreamSettings.fromJson(json);
  }
}
