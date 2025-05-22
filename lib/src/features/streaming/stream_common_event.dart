import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../channel/model/channel.dart';
import '../following/controller/following_controller.dart';
import '../settings/controller/chat_setting_controller.dart';

mixin class StreamCommonEvent {
  /* chat settings */
  Future<void> updateChatPositionX(
    WidgetRef ref, {
    required int value,
  }) async {
    await ref
        .read(chatSettingsControllerProvider.notifier)
        .setChatPositionX(value);
  }

  Future<void> updateChatPositionY(
    WidgetRef ref, {
    required int value,
  }) async {
    await ref
        .read(chatSettingsControllerProvider.notifier)
        .setChatPositionY(value);
  }

  Future<void> updateChatContainerHeight(
    WidgetRef ref, {
    required int value,
  }) async {
    await ref
        .read(chatSettingsControllerProvider.notifier)
        .setChatContainerHeight(value);
  }

  Future<void> updateChatContainerWidth(
    WidgetRef ref, {
    required int value,
  }) async {
    await ref
        .read(chatSettingsControllerProvider.notifier)
        .setChatContainerWidth(value);
  }

  Future<void> updateChatFontSize(
    WidgetRef ref, {
    required int value,
  }) async {
    await ref.read(chatSettingsControllerProvider.notifier).setFontSize(value);
  }

  Future<void> updateEntireChatContainerTransparency(
    WidgetRef ref, {
    required int value,
  }) async {
    await ref
        .read(chatSettingsControllerProvider.notifier)
        .setEntireChatContainerTransparency(value);
  }

  Future<void> updateSingleChatContainerTransparency(
    WidgetRef ref, {
    required int value,
  }) async {
    await ref
        .read(chatSettingsControllerProvider.notifier)
        .setSingleChatContainerTransparency(value);
  }

  Future<void> updateChatContainerVerticalMargin(
    WidgetRef ref, {
    required int value,
  }) async {
    await ref
        .read(chatSettingsControllerProvider.notifier)
        .setChatContainerVerticalMargin(value);
  }

  Future<void> updateChatContainerHorizontalMargin(
    WidgetRef ref, {
    required int value,
  }) async {
    await ref
        .read(chatSettingsControllerProvider.notifier)
        .setChatContainerHorizontalMargin(value);
  }

  Future<void> updateShowChatTime(
    WidgetRef ref, {
    required int value,
  }) async {
    await ref
        .read(chatSettingsControllerProvider.notifier)
        .setShowChatTime(value);
  }

  Future<void> updateShowNickname(
    WidgetRef ref, {
    required int value,
  }) async {
    await ref
        .read(chatSettingsControllerProvider.notifier)
        .setShowNickname(value);
  }

  Future<void> updateShowDonation(
    WidgetRef ref, {
    required int value,
  }) async {
    await ref
        .read(chatSettingsControllerProvider.notifier)
        .setShowDonation(value);
  }

  Future<void> updateUseBadgeCollector(
    WidgetRef ref, {
    required int value,
  }) async {
    await ref
        .read(chatSettingsControllerProvider.notifier)
        .setUseBadgeCollector(value);
  }

  Future<void> updateBadgeCollectorHeight(
    WidgetRef ref, {
    required int value,
  }) async {
    await ref
        .read(chatSettingsControllerProvider.notifier)
        .setBadgeCollectorHeight(value);
  }

  Future<void> updateChatPosition(
    WidgetRef ref, {
    required int x,
    required int y,
  }) async {
    await ref.read(chatSettingsControllerProvider.notifier).setChatPositionX(x);
    await ref.read(chatSettingsControllerProvider.notifier).setChatPositionY(y);
  }

  /* channel */
  /// Follow or unFollow
  Future<void> toggleFollow(
    WidgetRef ref, {
    required bool isFollowing,
    required Channel channel,
  }) async {
    await ref.read(followingControllerProvider.notifier).toggleFollow(
          isFollowing: isFollowing,
          channelId: channel.channelId,
        );
  }
}
