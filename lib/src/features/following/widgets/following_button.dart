import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/constants/enums.dart' show DialogButtonType;
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/ui/ui_widgets.dart'
    show
        FocusedOutlinedButton,
        IconElement,
        PaddingElement,
        RichIconText,
        RoundedContainer,
        TextElement;
import '../../../utils/popup/popup_utils.dart';

class FollowingButtonWithAsyncValue<T> extends HookWidget {
  /// Following button with generic list of AsyncValue to check current
  /// following state.
  ///
  /// Available generic types: [Following], [Category]
  const FollowingButtonWithAsyncValue({
    super.key,
    required this.focusNode,
    required this.asyncFollowingList,
    required this.containsFollowing,
    required this.unFollowWarning,
    required this.onPressed,
  });

  final FocusNode focusNode;

  final AsyncValue<List<T>?> asyncFollowingList;

  /// Check already following.
  final bool Function(T object) containsFollowing;

  /// Display popup dialog to warn about unfollowing if current state is `follow`.
  final String unFollowWarning;

  /// If isFollowing is true, unfollow; otherwise, follow.
  final Future<void> Function(bool isFollowing) onPressed;

  @override
  Widget build(BuildContext context) {
    final isLoadingState = useState<bool>(false);

    return asyncFollowingList.when(
      data: (data) {
        // handle error.
        if (data == null) return const SizedBox.shrink();

        bool isFollowing = data.any(containsFollowing);

        return isLoadingState.value
            ? const SizedBox(
                width: Dimensions.followingButtonWidth,
                height: Dimensions.followingButtonHeight,
              )
            : FollowingButton(
                focusNode: focusNode,
                isFollowing: isFollowing,
                onPressed: () async {
                  // deactivate button to prevent multiple pressed.
                  isLoadingState.value = true;

                  if (isFollowing && context.mounted) {
                    // Unfollow Warning
                    await PopupUtils.showButtonDialog(
                      buttonType: DialogButtonType.doubleButton,
                      context: context,
                      titleText: '팔로우 취소',
                      confirmText: '팔로우 취소',
                      contentText: unFollowWarning,
                      cancelText: '닫기',
                      confirmCallback: () async {
                        // Do unFollow
                        await onPressed(isFollowing);
                      },
                    );
                  } else {
                    // Do Follow
                    await onPressed(isFollowing);
                  }

                  isLoadingState.value = false;
                },
              );
      },
      error: (_, __) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}

class FollowingButton extends StatelessWidget {
  const FollowingButton({
    super.key,
    this.buttonWidth = Dimensions.followingButtonWidth,
    this.buttonHeight = Dimensions.followingButtonHeight,
    this.iconSize = 20.0,
    this.fontSize = 14.0,
    this.verticalPadding = 10.0,
    this.horizontalPadding = 10.0,
    this.autofocus = false,
    required this.focusNode,
    required this.isFollowing,
    required this.onPressed,
  });

  final double buttonWidth;
  final double buttonHeight;
  final double iconSize;
  final double fontSize;
  final double verticalPadding;
  final double horizontalPadding;
  final bool autofocus;
  final FocusNode focusNode;
  final bool isFollowing;
  final Future<void> Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FocusedOutlinedButton(
      autofocus: autofocus,
      focusNode: focusNode,
      onPressed: () async {
        await onPressed();
      },
      child: RoundedContainer(
        width: buttonWidth,
        height: buttonHeight,
        padding: EdgeInsets.symmetric(
          vertical: verticalPadding,
          horizontal: horizontalPadding,
        ),
        backgroundColor: AppColors.greyContainerColor,
        child: RichIconText(
          elements: [
            IconElement(
              icon: isFollowing
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              iconSize: iconSize,
              iconColor: AppColors.chzzkColor,
            ),
            PaddingElement(),
            TextElement(
              text: '팔로잉',
              fontSize: fontSize,
              fontColor: AppColors.whiteColor,
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}
