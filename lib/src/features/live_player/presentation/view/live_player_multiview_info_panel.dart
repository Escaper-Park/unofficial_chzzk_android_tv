import 'package:flutter/material.dart';

import '../../../player_shared/presentation/overlay_controls/overlay_controls.dart';
import '../bloc/live_player_bloc.dart';
import 'live_player_controls_overlay_design.dart';
import 'live_player_multiview_info_cell.dart';

class LivePlayerMultiviewInfoPanel extends StatelessWidget {
  const LivePlayerMultiviewInfoPanel({
    super.key,
    required this.state,
    this.selectSlotsFromBloc = false,
  });

  final LivePlayerState state;
  final bool selectSlotsFromBloc;

  @override
  Widget build(BuildContext context) {
    final slots = [
      for (var index = 0; index < livePlayerMaxMultiviewSlotCount; index += 1)
        index < state.slots.length ? state.slots[index] : null,
    ];

    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        key: const ValueKey('live-player-overlay-multiview-info-panel'),
        width: double.infinity,
        height: TvPlayerOverlayControlsDesign.bandHeight,
        child: ColoredBox(
          color: TvPlayerOverlayControlsDesign.backgroundColor,
          child: Padding(
            padding: LivePlayerControlsOverlayDesign.multiviewInfoPadding,
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: LivePlayerMultiviewInfoCell(
                          slot: slots[0],
                          selectSlotFromBloc: selectSlotsFromBloc,
                        ),
                      ),
                      const SizedBox(
                        width: LivePlayerControlsOverlayDesign.multiviewInfoGap,
                      ),
                      Expanded(
                        child: LivePlayerMultiviewInfoCell(
                          slot: slots[1],
                          selectSlotFromBloc: selectSlotsFromBloc,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: LivePlayerControlsOverlayDesign.multiviewInfoGap,
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                        child: LivePlayerMultiviewInfoCell(
                          slot: slots[2],
                          selectSlotFromBloc: selectSlotsFromBloc,
                        ),
                      ),
                      const SizedBox(
                        width: LivePlayerControlsOverlayDesign.multiviewInfoGap,
                      ),
                      Expanded(
                        child: LivePlayerMultiviewInfoCell(
                          slot: slots[3],
                          selectSlotFromBloc: selectSlotsFromBloc,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
