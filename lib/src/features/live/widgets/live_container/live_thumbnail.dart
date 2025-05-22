part of '../live_container.dart';

class _LiveThumbnail extends StatelessWidget {
  const _LiveThumbnail(this.liveInfo);

  final LiveInfo liveInfo;

  @override
  Widget build(BuildContext context) {
    return LiveThumbnail(liveInfo: liveInfo);
  }
}
