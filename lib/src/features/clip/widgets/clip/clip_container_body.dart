part of '../clip_container.dart';

class _ClipContainerBody extends StatelessWidget {
  const _ClipContainerBody({
    required this.clipThumbnail,
    required this.clipInfo,
  });

  final Widget clipThumbnail;
  final Widget clipInfo;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        clipThumbnail,
        clipInfo,
      ],
    );
  }
}
