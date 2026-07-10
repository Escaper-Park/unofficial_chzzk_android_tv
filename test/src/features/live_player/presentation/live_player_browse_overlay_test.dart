import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/domain/entities/live_feed.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/bloc/live_player_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/view/live_player_browse_card.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live_player/presentation/view/live_player_browse_overlay.dart';

void main() {
  testWidgets('browse live card uses middle dot between viewer and category', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final browseNode = FocusScopeNode();
    addTearDown(browseNode.dispose);
    final thumbnailStreamRetainer = BucketedImageStreamRetainer(
      bucketDuration: livePlayerBrowseThumbnailRefreshInterval,
    );
    addTearDown(thumbnailStreamRetainer.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LivePlayerBrowseOverlay(
            state: LivePlayerState.initial().copyWith(
              browseStatus: LivePlayerBrowseLoadStatus.success,
              browseItems: const [
                Live(
                  liveId: 1,
                  title: 'Live title',
                  concurrentUserCount: 1234,
                  adult: false,
                  categoryValue: 'Game',
                  channel: LiveChannel(
                    channelId: 'channel-id',
                    channelName: 'Channel',
                    verifiedMark: false,
                  ),
                ),
              ],
            ),
            browseNode: browseNode,
            thumbnailStreamRetainer: thumbnailStreamRetainer,
            onInteraction: () {},
            onSectionUp: () {},
            onSectionDown: () {},
            onLoadMore: () {},
            onFallbackPressed: () {},
            onLiveSelected: (_) {},
            onReplacementClosed: () {},
            onReplacementSlotSelected: (_) {},
          ),
        ),
      ),
    );

    expect(find.text('1,234 · Game'), findsOneWidget);
    expect(find.text('1,234 - Game'), findsNothing);
  });

  testWidgets('browse card keeps its thumbnail cache key while mounted', (
    tester,
  ) async {
    var currentTime = DateTime.fromMillisecondsSinceEpoch(179999);
    DateTime thumbnailNow() => currentTime;

    Widget buildCard() {
      return MaterialApp(
        home: Scaffold(
          body: LivePlayerBrowseCard(
            key: const ValueKey('stable-live-card'),
            live: const Live(
              liveId: 1,
              title: 'Live title',
              thumbnailImageUrl: 'https://example.com/image_{type}.jpg',
              concurrentUserCount: 10,
              adult: false,
              channel: LiveChannel(
                channelId: 'channel-id',
                channelName: 'Channel',
                verifiedMark: false,
              ),
            ),
            autofocus: false,
            thumbnailNow: thumbnailNow,
            onPressed: () {},
          ),
        ),
      );
    }

    await tester.pumpWidget(buildCard());
    final initialUrl = _networkImageUrl(tester);

    currentTime = DateTime.fromMillisecondsSinceEpoch(360001);
    await tester.pumpWidget(buildCard());

    expect(Uri.parse(initialUrl).queryParameters['date'], '0');
    expect(_networkImageUrl(tester), initialUrl);
  });

  testWidgets('browse thumbnail cache key follows three-minute buckets', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final browseNode = FocusScopeNode();
    addTearDown(browseNode.dispose);
    var currentTime = DateTime.fromMillisecondsSinceEpoch(179999);
    final thumbnailStreamRetainer = BucketedImageStreamRetainer(
      bucketDuration: livePlayerBrowseThumbnailRefreshInterval,
      now: () => currentTime,
    );
    addTearDown(thumbnailStreamRetainer.dispose);

    Widget buildOverlay() {
      return MaterialApp(
        home: Scaffold(
          body: LivePlayerBrowseOverlay(
            state: LivePlayerState.initial().copyWith(
              browseStatus: LivePlayerBrowseLoadStatus.success,
              browseItems: const [
                Live(
                  liveId: 1,
                  title: 'Live title',
                  thumbnailImageUrl: 'https://example.com/image_{type}.jpg',
                  concurrentUserCount: 10,
                  adult: false,
                  channel: LiveChannel(
                    channelId: 'channel-id',
                    channelName: 'Channel',
                    verifiedMark: false,
                  ),
                ),
              ],
            ),
            browseNode: browseNode,
            thumbnailStreamRetainer: thumbnailStreamRetainer,
            onInteraction: () {},
            onSectionUp: () {},
            onSectionDown: () {},
            onLoadMore: () {},
            onFallbackPressed: () {},
            onLiveSelected: (_) {},
            onReplacementClosed: () {},
            onReplacementSlotSelected: (_) {},
          ),
        ),
      );
    }

    await tester.pumpWidget(buildOverlay());
    final initialUrl = _networkImageUrl(tester);
    await tester.pumpWidget(const SizedBox.shrink());

    currentTime = DateTime.fromMillisecondsSinceEpoch(170000);
    await tester.pumpWidget(buildOverlay());
    expect(_networkImageUrl(tester), initialUrl);

    await tester.pumpWidget(const SizedBox.shrink());
    currentTime = DateTime.fromMillisecondsSinceEpoch(360001);
    await tester.pumpWidget(buildOverlay());

    expect(Uri.parse(initialUrl).queryParameters['date'], '0');
    expect(
      Uri.parse(_networkImageUrl(tester)).queryParameters['date'],
      '360000',
    );
    expect(_networkImageUrl(tester), isNot(initialUrl));
  });

  testWidgets('open browse overlay refreshes once at the next bucket', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    final browseNode = FocusScopeNode();
    addTearDown(browseNode.dispose);
    var currentTime = DateTime.fromMillisecondsSinceEpoch(179999);
    final thumbnailStreamRetainer = BucketedImageStreamRetainer(
      bucketDuration: livePlayerBrowseThumbnailRefreshInterval,
      now: () => currentTime,
    );
    addTearDown(thumbnailStreamRetainer.dispose);

    Widget buildOverlay() {
      return MaterialApp(
        home: Scaffold(
          body: LivePlayerBrowseOverlay(
            state: LivePlayerState.initial().copyWith(
              browseStatus: LivePlayerBrowseLoadStatus.success,
              browseItems: const [
                Live(
                  liveId: 2,
                  title: 'Live title',
                  thumbnailImageUrl: 'https://example.com/image_{type}.jpg',
                  concurrentUserCount: 10,
                  adult: false,
                  channel: LiveChannel(
                    channelId: 'channel-id-2',
                    channelName: 'Channel',
                    verifiedMark: false,
                  ),
                ),
              ],
            ),
            browseNode: browseNode,
            thumbnailStreamRetainer: thumbnailStreamRetainer,
            onInteraction: () {},
            onSectionUp: () {},
            onSectionDown: () {},
            onLoadMore: () {},
            onFallbackPressed: () {},
            onLiveSelected: (_) {},
            onReplacementClosed: () {},
            onReplacementSlotSelected: (_) {},
          ),
        ),
      );
    }

    await tester.pumpWidget(buildOverlay());
    final initialUrl = _networkImageUrl(tester);
    expect(Uri.parse(initialUrl).queryParameters['date'], '0');

    currentTime = DateTime.fromMillisecondsSinceEpoch(180001);
    await tester.pump(const Duration(milliseconds: 1));

    final refreshedUrl = _networkImageUrl(tester);
    expect(Uri.parse(refreshedUrl).queryParameters['date'], '180000');
    expect(refreshedUrl, isNot(initialUrl));

    await tester.pump(const Duration(seconds: 1));
    expect(_networkImageUrl(tester), refreshedUrl);
  });

  testWidgets('replacement modal lists current slots by channel name', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final browseNode = FocusScopeNode();
    addTearDown(browseNode.dispose);
    final thumbnailStreamRetainer = BucketedImageStreamRetainer(
      bucketDuration: livePlayerBrowseThumbnailRefreshInterval,
    );
    addTearDown(thumbnailStreamRetainer.dispose);
    String? selectedSlotId;
    var closed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LivePlayerBrowseOverlay(
            state: LivePlayerState.initial().copyWith(
              viewMode: LivePlayerViewMode.multiview,
              overlayMode: LivePlayerOverlayMode.browse,
              activeSlotId: 'slot-b',
              slots: [
                _slot(
                  slotId: 'slot-a',
                  channelId: 'channel-a',
                  channelName: 'Channel A',
                ),
                _slot(
                  slotId: 'slot-b',
                  channelId: 'channel-b',
                  channelName: 'Channel B',
                ),
              ],
              browseStatus: LivePlayerBrowseLoadStatus.success,
              browseItems: const [_replacementLive],
              pendingReplacementLive: _replacementLive,
            ),
            browseNode: browseNode,
            thumbnailStreamRetainer: thumbnailStreamRetainer,
            onInteraction: () {},
            onSectionUp: () {},
            onSectionDown: () {},
            onLoadMore: () {},
            onFallbackPressed: () {},
            onLiveSelected: (_) {},
            onReplacementClosed: () => closed = true,
            onReplacementSlotSelected: (slotId) => selectedSlotId = slotId,
          ),
        ),
      ),
    );
    await tester.pump();

    expect(find.text('교체할 방송'), findsOneWidget);
    expect(find.text('Channel A'), findsOneWidget);
    expect(find.text('Channel B'), findsOneWidget);
    expect(
      find.descendant(
        of: find.byType(TvModalPanel),
        matching: find.byType(TvMediaChannelName),
      ),
      findsNWidgets(2),
    );

    await tester.tap(find.widgetWithText(TvListItem, 'Channel B'));
    await tester.pump();

    expect(selectedSlotId, 'slot-b');
    expect(closed, isFalse);

    await tester.pumpWidget(const SizedBox.shrink());
  });
}

String _networkImageUrl(WidgetTester tester) {
  for (final image in tester.widgetList<Image>(find.byType(Image))) {
    final provider = _networkImageProvider(image.image);
    if (provider != null) {
      return provider.url;
    }
  }

  fail('Expected a network image provider.');
}

NetworkImage? _networkImageProvider(ImageProvider<Object> provider) {
  if (provider is BucketedImageProvider) {
    return _networkImageProvider(provider.provider);
  }

  if (provider is NetworkImage) {
    return provider;
  }

  if (provider is ResizeImage) {
    return _networkImageProvider(provider.imageProvider);
  }

  return null;
}

const _replacementLive = Live(
  liveId: 3,
  title: 'Replacement live',
  concurrentUserCount: 10,
  adult: false,
  channel: LiveChannel(
    channelId: 'channel-c',
    channelName: 'Channel C',
    verifiedMark: false,
  ),
);

LivePlayerSlotState _slot({
  required String slotId,
  required String channelId,
  required String channelName,
}) {
  return LivePlayerSlotState(
    slotId: slotId,
    status: LivePlayerSlotStatus.playing,
    channelId: channelId,
    liveId: 1,
    detail: LiveDetail(
      liveId: 1,
      title: '$channelName live',
      status: 'OPEN',
      concurrentUserCount: 10,
      adult: false,
      channel: LiveChannel(
        channelId: channelId,
        channelName: channelName,
        verifiedMark: false,
      ),
    ),
  );
}
