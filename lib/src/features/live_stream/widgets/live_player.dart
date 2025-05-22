import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/extensions/custom_extensions.dart';
import '../live_stream_state.dart';
import 'single_live_player.dart';

class LivePlayer extends ConsumerWidget with LiveStreamState {
  const LivePlayer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final livePlaylist = getLivePlaylist(ref);
    final liveCount = livePlaylist.length;
    final screenHeight = context.screenHeight;

    return GridView.builder(
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: false,
      addSemanticIndexes: false,
      shrinkWrap: false,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: liveCount == 1 ? 1 : 2,
        mainAxisExtent: liveCount <= 2 ? screenHeight : screenHeight / 2,
        mainAxisSpacing: 0.0,
        crossAxisSpacing: 0.0,
      ),
      itemCount: liveCount,
      itemBuilder: (context, index) {
        // !!magical constraint: wrap the player with center!!.
        return Center(
          child: SingleLivePlayer(index: index),
        );
      },
    );
  }
}
