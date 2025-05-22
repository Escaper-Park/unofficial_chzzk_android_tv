part of '../../channel_screen.dart';

class _ChannelAddGroupButton extends HookWidget {
  /// Following button of a channel.
  const _ChannelAddGroupButton({
    required this.focusNode,
    required this.channel,
    required this.addMemberToGroup,
  });

  final FocusNode focusNode;
  final Channel channel;
  final void Function(Channel channel) addMemberToGroup;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: FocusedOutlinedButton(
        autofocus: false,
        focusNode: focusNode,
        onPressed: () => addMemberToGroup(channel),
        child: RoundedContainer(
          width: Dimensions.followingButtonWidth + 25.0,
          height: Dimensions.followingButtonHeight,
          padding: const EdgeInsets.all(10.0),
          backgroundColor: AppColors.greyContainerColor,
          child: RichIconText(
            elements: [
              IconElement(
                icon: Icons.group_add_rounded,
                iconSize: 20.0,
                iconColor: AppColors.chzzkColor,
              ),
              PaddingElement(),
              TextElement(
                text: '그룹에 추가',
                fontSize: 14.0,
                fontColor: AppColors.whiteColor,
                fontWeight: FontWeight.w700,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
