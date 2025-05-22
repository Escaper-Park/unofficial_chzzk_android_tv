part of '../live_container.dart';

class _LiveTitle extends StatelessWidget {
  /// A live title with the newline removed.
  const _LiveTitle(this.liveTitle);

  final String? liveTitle;

  @override
  Widget build(BuildContext context) {
    final newlineRemovedTitle = liveTitle?.replaceAll('\n', ' ') ?? ' ';

    return Text(
      newlineRemovedTitle,
      maxLines: 2, // max title lines is 2.
      style: const TextStyle(
        fontSize: 12.0,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
