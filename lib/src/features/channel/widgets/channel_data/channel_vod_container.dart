import 'package:flutter/material.dart';

import '../../../vod/model/vod.dart';
import '../../../vod/widgets/vod_container/vod_container.dart';
import '../../../vod/widgets/vod_container/vod_info.dart';

class ChannelVodContainer extends StatelessWidget {
  const ChannelVodContainer({
    super.key,
    required this.autofocus,
    required this.focusNode,
    required this.vod,
  });

  final bool autofocus;
  final FocusNode focusNode;
  final Vod vod;

  @override
  Widget build(BuildContext context) {
    return VodContainer(
      vod: vod,
      autofocus: autofocus,
      infoWidget: (hasFocus) => ChannelVodInfo(vod: vod),
    );
  }
}

class ChannelVodInfo extends StatelessWidget {
  const ChannelVodInfo({super.key, required this.vod});

  final Vod vod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: VodInfo(vod: vod),
    );
  }
}
