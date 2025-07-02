import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_settings.freezed.dart';
part 'chat_settings.g.dart';

@freezed
class ChatSettings with _$ChatSettings {
  const factory ChatSettings({
    /// The X value of the overlay chat position as a ratio of the entire screen.
    ///
    /// MediaQuery.of(context).size.width * chatPositionX * 0.01.
    required int chatPositionX,

    /// The Y value of the overlay chat position as a ratio of the entire screen.
    ///
    /// MediaQuery.of(context).size.height * chatPositionY * 0.01.
    required int chatPositionY,

    /// The height of entire overlay chat container as a ratio of the entire screen.
    required int chatContainerHeight,

    /// The width of entire overlay chat container as a ratio of the entire screen.
    required int chatContainerWidth,

    /// The font size of the chat.
    required int chatFontSize,

    /// The transparency of the container that wraps the entire chat.
    ///
    /// Used with the opacity function. Opacity = (100 - Transparency) * 0.01.
    /// The max value of opacity  is 1.
    required int entireChatContainerTransparency,

    /// The transparency of the container that wraps a single chat.
    ///
    /// Used with the opacity function. Opacity = (100 - Transparency) * 0.01.
    /// The max value of opacity is 1.
    required int singleChatContainerTransparency,

    /// The horizontal spacing outside the chat container.
    required int chatContainerHorizontalMargin,

    /// The vertical spacing between each chat.
    required int chatContainerVerticalMargin,

    /// Show chat created time
    ///
    /// 0: false, 1: true
    required int showChatTime,

    /// Show user's nick name in chat.
    ///
    /// 0: false, 1: true
    required int showNickname,

    /// Show donation in chat
    /// 
    /// 0: false, 1: true
    required int showDonation,

    /// The height of badge collector as a ratio of the entire chat container.
    required int badgeCollectorHeight,

    /// Show the badge collector.
    ///
    /// 0: false, 1: true
    required int useBadgeCollector,
  }) = _ChatSettings;

  factory ChatSettings.fromJson(Map<String, dynamic> json) =>
      _$ChatSettingsFromJson(json);
}