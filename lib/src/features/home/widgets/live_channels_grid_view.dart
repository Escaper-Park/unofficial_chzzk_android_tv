import 'package:flutter/material.dart';

import '../../live/model/live.dart';
import './home_live_container.dart';

class LiveChannelsGridView extends StatelessWidget {
  const LiveChannelsGridView({
    super.key,
    required this.lives,
    required this.onPressed,
  });

  final List<LiveDetail> lives;
  final Function(LiveDetail liveDetail) onPressed;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        mainAxisExtent: 160.0,
      ),
      // padding: EdgeInsets.zero,
      itemCount: lives.length,
      itemBuilder: (context, index) {
        final liveDetail = lives[index];

        return MaterialButton(
          key: UniqueKey(),
          padding: EdgeInsets.zero,
          onPressed: () => onPressed(liveDetail),
          child: LiveContainer(
            liveDetail: liveDetail,
          ),
        );
      },
    );
  }
}
