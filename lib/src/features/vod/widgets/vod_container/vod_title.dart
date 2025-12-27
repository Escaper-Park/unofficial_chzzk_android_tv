part of '../vod_container.dart';

class _VodTitle extends StatelessWidget {
  const _VodTitle({
    required this.title,
    this.maxLines = 1,
  });

  final String title;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final newlineRemovedTitle = title.replaceAll('\n', ' ');

    return Text(
      newlineRemovedTitle,
      maxLines: maxLines,
      style: TextStyle(
        fontSize: 13.0,
        color: AppColors.whiteColor,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
