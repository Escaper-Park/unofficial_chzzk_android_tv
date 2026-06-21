import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/bloc/channel_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/view/sections/group/channel_group_panel.dart';
import 'package:unofficial_chzzk_android_tv/src/features/group/domain/entities/group_collection.dart';

void main() {
  testWidgets('uses standard modal panel', (tester) async {
    final node = FocusScopeNode(debugLabel: 'group panel');
    addTearDown(node.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChannelGroupPanel(
            node: node,
            panel: const ChannelGroupPanelState(
              status: ChannelGroupPanelStatus.ready,
              groups: [
                GroupItem(id: 'group-1', groupName: 'Group 1'),
              ],
            ),
            onAddToGroup: (_) {},
            onDismiss: () {},
          ),
        ),
      ),
    );
    await tester.pump();

    final panel = tester.widget<TvModalPanel>(find.byType(TvModalPanel));

    expect(panel.type, TvModalPanelType.standard);
    expect(find.text('Group 1'), findsOneWidget);
    expect(find.byIcon(Icons.folder_rounded), findsNothing);
  });
}
