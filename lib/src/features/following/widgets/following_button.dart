import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/constants/styles.dart';
import '../../../common/widgets/rounded_container.dart';
import '../../../common/widgets/focused_widget.dart';
import '../../../utils/popup/popup_utils.dart';

class FollowingButton<T> extends HookWidget {
  /// Following Button with Generic List of [AsyncValue].
  ///
  /// Available Generic Types: [Following], [Category]
  const FollowingButton({
    super.key,
    required this.focusNode,
    required this.asyncValue,
    required this.checkIsFollowing,
    required this.unfollowWarning,
    required this.onPressed,
  });

  final FocusNode focusNode;

  /// To check already follow this channel or category in List<T>.
  final AsyncValue<List<T>?> asyncValue;

  /// Check current following state.
  final bool Function(T object) checkIsFollowing;

  /// Show popup dialog to warn about unfollowing.
  final String unfollowWarning;

  /// If isFollowing is true, unfollow; otherwise, follow.
  final void Function(bool isFollowing) onPressed;

  @override
  Widget build(BuildContext context) {
    // Prevent the button from beging pressed multiple times.
    final isLoading = useState<bool>(false);

    return asyncValue.when(
      data: (data) {
        // If the user is not logged in, show nothing.
        if (data == null) return const SizedBox.shrink();

        bool isFollowing = data.any(checkIsFollowing);

        return isLoading.value
            ? SizedBox(
                height: Dimensions.followingButtonSize.height,
                width: Dimensions.followingButtonSize.width,
              )
            : _FollowingButtonContainer(
                focusNode,
                isFollowing,
                () async {
                  // deactivate button to prevent multiple pressed.
                  isLoading.value = true;

                  // warning and do unfollow.
                  if (isFollowing && context.mounted) {
                    await PopupUtils.showButtonDialog(
                      context: context,
                      buttonType: DialogButtonType.doubleButton,
                      titleText: '팔로우 취소',
                      contentText: unfollowWarning,
                      confirmCallback: () {
                        onPressed(isFollowing);
                      },
                    );
                  }
                  // Do follow
                  else {
                    onPressed(isFollowing);
                  }

                  // activate button
                  isLoading.value = false;
                },
              );
      },
      error: (_, __) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}

class _FollowingButtonContainer extends HookWidget {
  const _FollowingButtonContainer(
    this.focusNode,
    this.isFollowing,
    this.onPressed,
  );

  final FocusNode focusNode;
  final bool isFollowing;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Dimensions.followingButtonSize.height,
      width: Dimensions.followingButtonSize.width,
      child: FocusedOutlinedButton(
        focusNode: focusNode,
        onPressed: onPressed,
        child: RoundedContainer(
          backgroundColor: AppColors.greyContainerColor,
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(
                isFollowing
                    ? Icons.favorite_rounded
                    : Icons.favorite_border_rounded,
                size: 20.0,
                color: AppColors.chzzkColor,
              ),
              const SizedBox(width: 10.0),
              const Expanded(
                child: Center(
                  child: Text(
                    '팔로잉',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
