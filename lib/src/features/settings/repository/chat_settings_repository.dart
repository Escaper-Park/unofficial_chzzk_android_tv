import '../../../utils/shared_preferences/shared_prefs.dart';
import '../../../utils/shared_preferences/shared_prefs_repository.dart';
import '../model/chat_settings.dart';

class ChatSettingsRepository extends SharedPrefsRepository<ChatSettings> {
  ChatSettingsRepository({
    required super.prefs,
    super.dbKey = SharedPrefsDBKey.chatSettings,
  });

  @override
  ChatSettings initValue() {
    ChatSettings settings = ChatSettings(
      chatPositionX: 0,
      chatPositionY: 0,
      chatContainerHeight: 60,
      chatContainerWidth: 25,
      chatFontSize: 12,
      entireChatContainerTransparency: 100,
      singleChatContainerTransparency: 60,
      chatContainerHorizontalMargin: 5,
      chatContainerVerticalMargin: 5,
      showChatTime: 0,
      showNickname: 1,
      showDonation: 1,
      useBadgeCollector: 0,
      badgeCollectorHeight: 25,
    );

    return settings;
  }

  @override
  Map<String, dynamic> toJson(ChatSettings item) {
    return item.toJson();
  }

  @override
  ChatSettings fromJson(Map<String, dynamic> json) {
    return ChatSettings.fromJson(json);
  }
}
