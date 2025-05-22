part of '../clip_container.dart';

class _ClipInfo extends StatelessWidget {
  const _ClipInfo({
    required this.clip,
    required this.clipContainerWidth,
    required this.channelName,
  });

  final NaverClip clip;
  final double clipContainerWidth;
  final String channelName;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: SizedBox(
        width: clipContainerWidth,
        height: Dimensions.clipInfoCardHeight,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                // title
                child: _text(clip.clipTitle, 13.0, 2),
              ),
              // channel name
              _text(channelName, 11.0, 1),
              // readCount
              _iconText(clip.readCount.commaFormat()),
            ],
          ),
        ),
      ),
    );
  }

  Widget _text(String text, double fontSize, int maxLines) {
    return Text(
      text,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: fontSize,
        color: AppColors.whiteColor,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _iconText(String readCount) {
    return RichIconText(
      elements: [
        IconElement(icon: Icons.play_arrow_rounded),
        TextElement(text: readCount),
      ],
    );
  }
}
