part of 'tv_vod_overlay_playback_info.dart';

class _TvVodSeekPreviewLabel extends StatelessWidget {
  const _TvVodSeekPreviewLabel({
    required this.backgroundKey,
    required this.text,
    required this.maxLines,
    required this.style,
  });

  final Key backgroundKey;
  final String text;
  final int maxLines;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Align(
        alignment: Alignment.center,
        child: DecoratedBox(
          key: backgroundKey,
          decoration: BoxDecoration(
            color: TvPlayerOverlayControlsDesign
                .vodSeekPreviewLabelBackgroundColor,
            borderRadius: BorderRadius.circular(
              TvPlayerOverlayControlsDesign.vodSeekPreviewLabelRadius,
            ),
          ),
          child: Padding(
            padding: TvPlayerOverlayControlsDesign.vodSeekPreviewLabelPadding,
            child: Text(
              text,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: style,
            ),
          ),
        ),
      ),
    );
  }
}
