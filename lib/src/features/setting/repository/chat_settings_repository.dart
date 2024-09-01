import '../../../utils/shared_preferences/shared_prefs.dart';
import '../model/chat_settings.dart';
import 'settings_repository.dart';

class ChatSettingsRepository extends SettingsRepository<ChatSettings> {
  ChatSettingsRepository({
    required super.prefs,
    super.dbKey = SharedPrefsDBKey.chatSettings,
  });

  @override
  ChatSettings initSettings() {
    const ChatSettings settings = ChatSettings(
      chatPositionX: 0,
      chatPositionY: 0,
      chatContainerHeight: 60,
      chatContainerWidth: 25,
      chatFontSize: 12,
      entireChatContainerTransparency: 100,
      singleChatContainerTransparency: 60,
      chatContainerVerticalMargin: 5,
      showChatTime: 0,
      showNickname: 1,
      useBadgeCollector: 0,
      badgeCollectorHeight: 25,
    );

    return settings;
  }

  @override
  Map<String, dynamic> toJson(ChatSettings settings) {
    return settings.toJson();
  }

  @override
  ChatSettings fromJson(Map<String, dynamic> json) {
    return ChatSettings.fromJson(json);
  }
}
