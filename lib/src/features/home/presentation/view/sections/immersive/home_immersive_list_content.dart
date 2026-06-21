part of 'home_immersive_list.dart';

class _HomeImmersiveContent extends StatelessWidget {
  const _HomeImmersiveContent({
    required this.item,
    required this.itemIndex,
    required this.metadataTransitionDirection,
    required this.onActionPressed,
    required this.actionAutofocus,
    required this.actionFocusNode,
    required this.actionProgress,
  });

  final HomeImmersiveItem item;
  final int itemIndex;
  final int metadataTransitionDirection;
  final VoidCallback onActionPressed;
  final bool actionAutofocus;
  final FocusNode? actionFocusNode;
  final double? actionProgress;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: HomeImmersiveListDesign.metadataContentHeight,
          child: _HomeImmersiveMetadata(
            item: item,
            itemIndex: itemIndex,
            transitionDirection: metadataTransitionDirection,
          ),
        ),
        const SizedBox(height: HomeImmersiveListDesign.subtitleActionGap),
        SizedBox(
          height: HomeImmersiveListDesign.actionRowHeight,
          child: Row(
            spacing: HomeImmersiveListDesign.actionTagGap,
            children: [
              if (actionProgress case final progress?)
                _HomeImmersiveProgressAction(
                  text: item.actionLabel,
                  focusNode: actionFocusNode,
                  autofocus: actionAutofocus,
                  progress: progress,
                  onPressed: onActionPressed,
                )
              else
                TvButton.label(
                  text: item.actionLabel,
                  focusNode: actionFocusNode,
                  autofocus: actionAutofocus,
                  onPressed: onActionPressed,
                ),
              Flexible(
                child: _HomeImmersiveTags(
                  tags: item.contentTags,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
