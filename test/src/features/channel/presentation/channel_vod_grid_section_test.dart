import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/bloc/channel_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/view/sections/vod/channel_vod_grid_section.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/domain/entities/vod_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/presentation/view/shared/vod_card.dart';

void main() {
  testWidgets('autofocuses first VOD grid item', (tester) async {
    final gridNode = FocusScopeNode(debugLabel: 'grid');
    final tabsNode = FocusScopeNode(debugLabel: 'tabs');

    addTearDown(gridNode.dispose);
    addTearDown(tabsNode.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ChannelVodGridSection(
            state:
                ChannelState.initial(
                  channelId: 'channel',
                  isSignedIn: true,
                ).copyWith(
                  selectedTab: ChannelTab.vod,
                  vod: channelPageReady<Vod>(
                    items: [_vod(1), _vod(2)],
                  ),
                ),
            gridNode: gridNode,
            tabsNode: tabsNode,
            onRetry: () {},
            onLoadMore: () {},
            onPressed: (_) {},
          ),
        ),
      ),
    );

    final cards = tester.widgetList<VodCard>(find.byType(VodCard)).toList();

    expect(cards[0].autofocus, true);
    expect(cards[1].autofocus, false);
  });
}

Vod _vod(int id) {
  return Vod(
    videoNo: id,
    title: 'Vod $id',
    videoType: 'REPLAY',
    publishDate: '2026-06-14',
    duration: 60,
    readCount: id,
    publishDateAt: id,
    adult: false,
    livePv: 0,
  );
}
