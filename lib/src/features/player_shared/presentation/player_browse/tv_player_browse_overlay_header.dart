part of 'tv_player_browse_overlay.dart';

class _TvPlayerBrowseHeader extends StatelessWidget {
  const _TvPlayerBrowseHeader({
    required this.title,
    required this.height,
    required this.cardWidth,
  });

  final String title;
  final double height;
  final TvCardWidth cardWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: TvPlayerBrowseOverlayDesign.headerHorizontalInset,
      ),
      child: SizedBox(
        height: height,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TvPlayerBrowseOverlayDesign.headerTextStyle(
              context,
              cardWidth,
            ),
          ),
        ),
      ),
    );
  }
}
