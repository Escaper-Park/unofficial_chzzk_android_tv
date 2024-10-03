import '../../../utils/shared_preferences/shared_prefs.dart';
import '../model/stream_settings.dart';
import 'settings_repository.dart';

class StreamSettingsRepository extends SettingsRepository<StreamSettings> {
  StreamSettingsRepository({
    required super.prefs,
    super.dbKey = SharedPrefsDBKey.streamSettings,
  });

  @override
  StreamSettings initSettings() {
    const StreamSettings settings = StreamSettings(
      resolutionIndex: 4, // Auto
      multiviewResolutionIndex: 2, // 720p
      vodResolutionIndex: 2, // Auto
      liveChatWindowStateIndex: 0, // Full
      vodChatWindowStateIndex: 0, // Full
      overlayControlsDisplayTime: 10,
      latencyIndex: 1, // LLHLS
      vodPlaybackIntervalIndex: 1, // 10s
    );

    return settings;
  }

  @override
  Map<String, dynamic> toJson(StreamSettings settings) {
    return settings.toJson();
  }

  @override
  StreamSettings fromJson(Map<String, dynamic> json) {
    return StreamSettings.fromJson(json);
  }
}
