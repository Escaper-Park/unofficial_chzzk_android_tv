part of '../vod_container.dart';

class _VodStatusBadges extends StatelessWidget {
  const _VodStatusBadges({required this.vod});

  final Vod vod;

  @override
  Widget build(BuildContext context) {
    /* status badge text */
    final badgeText = switch (vod.videoType) {
      "UPLOAD" => "업로드",
      "REPLAY" => "다시보기",
      _ => "다시보기",
    };

    /* accumulated */
    final int? pv = vod.livePv;
    final String unitString = pv == null
        ? ' '
        : '${CustomFormatter.formatNumberToStringUnit(pv)} 시청된 라이브';

    /* publish date at */
    final DateTime now = DateTime.now().toUtc().add(const Duration(hours: 9));
    final int diff = now.millisecondsSinceEpoch - vod.publishDateAt;
    final int hours = (diff / (1000 * 60 * 60)).floor();
    final String timeAgo = hours > 24 ? '${hours ~/ 24}일 전' : '$hours시간 전';

    /* vod duration */
    final Duration durationInSeconds = Duration(seconds: vod.duration);
    final String paddedDuration = durationInSeconds.paddedDuration();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // '다시보기'
                _badge(
                  Alignment.topLeft,
                  badgeText,
                  AppColors.replayTagBackgroundColor,
                  AppColors.fullWhiteColor,
                ),
                const SizedBox(width: 5.0),
                // if live pv > 1000
                if (vod.livePv != null && vod.livePv! > 1000)
                  _badge(
                    Alignment.topLeft,
                    unitString,
                    AppColors.greyContainerColor,
                    AppColors.fullWhiteColor,
                  ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: _badge(
              Alignment.bottomLeft,
              paddedDuration,
              AppColors.greyContainerColor,
              AppColors.fullWhiteColor,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: _badge(
              Alignment.bottomRight,
              timeAgo,
              AppColors.greyContainerColor,
              AppColors.fullWhiteColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _badge(
    Alignment alignment,
    String text,
    Color backgroundColor,
    Color fontColor,
  ) {
    return CustomBadge(
      alignment: alignment,
      backgroundColor: backgroundColor,
      elements: [
        TextElement(text: text, fontColor: fontColor),
      ],
    );
  }
}
