part of 'following_channel_modal.dart';

TvModalPanelPosition _positionFor(int index) {
  final column = index % 6;
  return column <= 2 ? TvModalPanelPosition.right : TvModalPanelPosition.left;
}

Offset _anchorOffsetFor({
  required BuildContext context,
  required int index,
  required FocusNode? openerNode,
}) {
  final column = index % 6;
  final y = _itemAlignedVisibleYOffset(
    context: context,
    openerNode: openerNode,
  );

  if (column <= 2) {
    return Offset(
      TvCardWidth.six.value + FollowingScreenDesign.channelModalGap,
      y,
    );
  }

  return Offset(
    -TvModalPanelDesign.standardWidth - FollowingScreenDesign.channelModalGap,
    y,
  );
}

double _itemAlignedVisibleYOffset({
  required BuildContext context,
  required FocusNode? openerNode,
}) {
  final openerContext = openerNode?.context;
  final openerBox = openerContext?.findRenderObject();

  if (openerBox is! RenderBox || !openerBox.hasSize) {
    return 0;
  }

  final openerTop = openerBox.localToGlobal(Offset.zero).dy;
  final screenHeight = MediaQuery.sizeOf(context).height;
  final edgeMargin = TvModalPanelDesign.standardOuterSpacing.vertical / 2;
  final maxModalTop = math.max(
    edgeMargin,
    screenHeight -
        FollowingScreenDesign.channelModalEstimatedHeight -
        edgeMargin,
  );
  final modalTop = openerTop.clamp(edgeMargin, maxModalTop).toDouble();

  return modalTop - openerTop;
}

TextStyle? _headerChannelNameStyle(BuildContext context) {
  final colorScheme = Theme.of(context).colorScheme;

  return Theme.of(context).textTheme.labelMedium?.copyWith(
    color: colorScheme.inverseSurface,
  );
}
