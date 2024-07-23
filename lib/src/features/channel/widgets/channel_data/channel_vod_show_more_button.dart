import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/dpad_widgets.dart';
import '../../../../common/widgets/focused_widget.dart';
import '../../../../common/widgets/header_text.dart';
import '../../../../utils/router/app_router.dart';
import '../../model/channel.dart';

class ChannelVodShowMoreButton extends HookWidget {
  const ChannelVodShowMoreButton({
    super.key,
    required this.autofocus,
    required this.channel,
    required this.showMoreButtonFSN,
    required this.channelListFSN,
    required this.aboveFSN,
    required this.vodListFSN,
  });

  final bool autofocus;
  final Channel channel;
  final FocusScopeNode showMoreButtonFSN;
  final FocusScopeNode channelListFSN;
  final FocusScopeNode aboveFSN;

  /// FocusScopeNode of vod list located below of this.
  final FocusScopeNode vodListFSN;

  @override
  Widget build(BuildContext context) {
    // Highlight button
    final showMoreFN = useFocusNode();

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const HeaderText(text: '동영상'),
        DpadFocusScopeNavigator(
          autofocus: autofocus,
          node: showMoreButtonFSN,
          dpadKeyFocusScopeNodeMap: {
            DpadAction.arrowLeft: channelListFSN,
            DpadAction.arrowUp: aboveFSN,
            DpadAction.arrowDown: vodListFSN,
          },
          onFocusChange: (value) {
            if (value) showMoreFN.requestFocus();
          },
          child: FocusedOutlinedButton(
            focusNode: showMoreFN,
            padding: const EdgeInsets.all(5.0),
            onPressed: () async {
              if (context.mounted) {
                context.pushNamed(
                  AppRoute.channelVods.routeName,
                  extra: {'channel': channel},
                );
              }
            },
            child: const Icon(
              Icons.arrow_forward_ios_rounded,
              color: AppColors.whiteColor,
            ),
          ),
        ),
      ],
    );
  }
}
