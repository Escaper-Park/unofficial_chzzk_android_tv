part of 'home_rail_more_card.dart';

class _MoreLabel extends StatelessWidget {
  const _MoreLabel();

  @override
  Widget build(BuildContext context) {
    final style = HomeRailMoreCardDesign.labelStyle(
      Theme.of(context).textTheme,
    );

    return Padding(
      padding: HomeRailMoreCardDesign.contentPadding,
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.more_horiz_rounded,
              size: style?.fontSize,
              color: HomeRailMoreCardDesign.iconColor,
            ),
            const SizedBox(width: HomeRailMoreCardDesign.contentGap),
            Text(
              HomeScreenString.more,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: style,
            ),
          ],
        ),
      ),
    );
  }
}
