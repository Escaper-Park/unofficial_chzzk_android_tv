import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_settings.freezed.dart';
part 'chat_settings.g.dart';

@freezed
@JsonSerializable()
class ChatSettings with _$ChatSettings {
  /// The X value of the overlay chat position as a ratio of the entire screen.
  ///
  /// MediaQuery.of(context).size.width * chatPositionX * 0.01.
  final int chatPositionX;

  /// The Y value of the overlay chat position as a ratio of the entire screen.
  ///
  /// MediaQuery.of(context).size.height * chatPositionY * 0.01.
  final int chatPositionY;

  /// The height of entire overlay chat container as a ratio of the entire screen.
  final int chatContainerHeight;

  /// The width of entire overlay chat container as a ratio of the entire screen.
  final int chatContainerWidth;

  /// The font size of the chat.
  final int chatFontSize;

  /// The transparency of the container that wraps the entire chat.
  ///
  /// Used with the opacity function. Opacity = (100 - Transparency) * 0.01.
  /// The max value of opacity  is 1.
  final int entireChatContainerTransparency;

  /// The transparency of the container that wraps a single chat.
  ///
  /// Used with the opacity function. Opacity = (100 - Transparency) * 0.01.
  /// The max value of opacity is 1.
  final int singleChatContainerTransparency;

  /// The horizontal spacing outside the chat container.
  final int chatContainerHorizontalMargin;

  /// The vertical spacing between each chat.
  final int chatContainerVerticalMargin;

  /// Show chat created time
  ///
  /// 0: false, 1: true
  final int showChatTime;

  /// Show user's nick name in chat.
  ///
  /// 0: false, 1: true
  final int showNickname;

  /// Show donation in chat
  /// 
  /// 0: false, 1: true
  final int showDonation;

  /// The height of badge collector as a ratio of the entire chat container.
  final int badgeCollectorHeight;

  /// Show the badge collector.
  ///
  /// 0: false, 1: true
  final int useBadgeCollector;

  ChatSettings({
    required this.chatPositionX,
    required this.chatPositionY,
    required this.chatContainerHeight,
    required this.chatContainerWidth,
    required this.chatFontSize,
    required this.entireChatContainerTransparency,
    required this.singleChatContainerTransparency,
    required this.chatContainerHorizontalMargin,
    required this.chatContainerVerticalMargin,
    required this.showChatTime,
    required this.showNickname,
    required this.showDonation,
    required this.badgeCollectorHeight,
    required this.useBadgeCollector,
  });

  factory ChatSettings.fromJson(Map<String, dynamic> json) =>
      _$ChatSettingsFromJson(json);

  Map<String, Object?> toJson() => _$ChatSettingsToJson(this);
}
