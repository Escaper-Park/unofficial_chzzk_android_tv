part of 'tv_card.dart';

class _TvCardBody extends StatelessWidget {
  const _TvCardBody({
    required this.type,
    required this.image,
    required this.width,
    required this.thumbnailRatio,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.extras,
    required this.content,
    required this.design,
  });

  final TvCardType type;
  final Widget image;
  final TvCardWidth width;
  final TvCardThumbnailRatio thumbnailRatio;
  final String? title;
  final String? subtitle;
  final String? description;
  final Widget? extras;
  final Widget? content;
  final TvCardDesign design;

  @override
  Widget build(BuildContext context) {
    final contentBlock =
        content ??
        _TvCardContentBlock(
          title: title,
          subtitle: subtitle,
          description: description,
          extras: extras,
          design: design,
          alignment: type == TvCardType.standard
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
        );

    return switch (type) {
      TvCardType.standard => Column(
        mainAxisSize: MainAxisSize.min,
        spacing: design.imageContentGap,
        children: [_thumbnail, contentBlock],
      ),
      TvCardType.classic => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _thumbnail,
          ColoredBox(
            color: Theme.of(context).colorScheme.surfaceContainerHighest,
            child: Padding(
              padding: design.classicContentPadding,
              child: contentBlock,
            ),
          ),
        ],
      ),
      TvCardType.wideClassic => SizedBox(
        height: TvCardDesign.wideClassicHeight(width, thumbnailRatio),
        child: Row(
          children: [
            SizedBox(
              width: TvCardDesign.wideClassicThumbnailWidth(width),
              child: _image,
            ),
            Expanded(
              child: SizedBox.expand(
                child: _wideClassicContent(context, contentBlock),
              ),
            ),
          ],
        ),
      ),
      TvCardType.compact => AspectRatio(
        aspectRatio: thumbnailRatio.value,
        child: Stack(
          children: [
            Positioned.fill(child: _image),
            const Positioned.fill(
              child: ColoredBox(color: Color(0x66000000)),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Padding(
                padding: design.compactPadding,
                child: contentBlock,
              ),
            ),
          ],
        ),
      ),
    };
  }

  Widget get _thumbnail {
    return AspectRatio(aspectRatio: thumbnailRatio.value, child: _image);
  }

  Widget get _image {
    return SizedBox.expand(child: image);
  }

  Widget _wideClassicContent(BuildContext context, Widget contentBlock) {
    if (content != null) {
      return contentBlock;
    }

    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: design.classicContentPadding,
        child: contentBlock,
      ),
    );
  }
}
