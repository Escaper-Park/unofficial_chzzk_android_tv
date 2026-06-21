import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/focus/focus.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/player_shared/presentation/player_browse/player_browse.dart';

void main() {
  test('browse overlay design uses TvCardWidth.four frame', () {
    expect(
      TvPlayerBrowseOverlayDesign.bandHeight(TvCardWidth.six),
      153.75,
    );
    expect(
      TvPlayerBrowseOverlayDesign.bandHeight(TvCardWidth.four),
      194.25,
    );
    expect(TvCardWidth.four.value, 196);
    expect(TvCardWidth.six.value, 124);
    expect(TvPlayerBrowseOverlayDesign.headerCardGap, 12);
    expect(
      TvPlayerBrowseOverlayDesign.bottomMargin(TvCardWidth.four),
      24,
    );
    expect(
      TvPlayerBrowseOverlayDesign.topMargin(TvCardWidth.four),
      24,
    );
    expect(
      TvPlayerBrowseOverlayDesign.cardHeight(
        TvCardWidth.four,
      ),
      110.25,
    );
    expect(
      TvPlayerBrowseOverlayDesign.headerHeight(
        TvCardWidth.four,
      ),
      24,
    );
    expect(
      TvPlayerBrowseOverlayDesign.headerHeight(
            TvCardWidth.four,
          ) +
          TvPlayerBrowseOverlayDesign.headerCardGap +
          TvPlayerBrowseOverlayDesign.cardHeight(
            TvCardWidth.four,
          ) +
          TvPlayerBrowseOverlayDesign.topMargin(TvCardWidth.four) +
          TvPlayerBrowseOverlayDesign.bottomMargin(
            TvCardWidth.four,
          ),
      TvPlayerBrowseOverlayDesign.bandHeight(TvCardWidth.four),
    );
  });

  testWidgets('browse overlay renders a rail inside browse band', (
    tester,
  ) async {
    final node = FocusScopeNode();
    addTearDown(node.dispose);

    await tester.pumpWidget(
      _BrowseHarness(
        child: TvPlayerBrowseOverlay(
          node: node,
          title: 'Related lives',
          itemCount: 2,
          itemBuilder: (context, index) {
            return TvPlayerBrowseCard(
              title: 'Live $index',
              imageUrl: null,
              channelName: 'Channel $index',
              liveBadgeLabel: '1,234 - Game',
              autofocus: index == 0,
              onPressed: () {},
            );
          },
        ),
      ),
    );

    expect(find.text('Related lives'), findsOneWidget);
    final header = tester.widget<Text>(find.text('Related lives'));
    final expectedStyle = Theme.of(
      tester.element(find.text('Related lives')),
    ).textTheme.titleMedium;
    expect(header.style?.fontSize, expectedStyle?.fontSize);
    expect(find.text('Channel 0'), findsOneWidget);
    expect(find.text('Live 0'), findsOneWidget);
    expect(find.byType(TvRail), findsOneWidget);

    final rail = tester.widget<TvRail>(find.byType(TvRail));
    expect(rail.itemExtent, TvCardWidth.four.value);

    expect(
      find.byWidgetPredicate(
        (widget) =>
            widget is SizedBox &&
            widget.width == double.infinity &&
            widget.height ==
                TvPlayerBrowseOverlayDesign.bandHeight(
                  TvCardWidth.four,
                ),
      ),
      findsOneWidget,
    );
  });

  testWidgets('browse overlay renders focusable placeholder without a rail', (
    tester,
  ) async {
    final node = FocusScopeNode();
    addTearDown(node.dispose);

    await tester.pumpWidget(
      _BrowseHarness(
        child: TvPlayerBrowseOverlay(
          node: node,
          title: 'Related videos',
          itemCount: 0,
          placeholder: const TvPlayerBrowseMessage(label: 'No videos'),
          itemBuilder: (context, index) {
            return const SizedBox.shrink();
          },
        ),
      ),
    );

    expect(find.text('No videos'), findsOneWidget);
    expect(find.byType(TvRail), findsNothing);
    expect(find.byType(TvFocusSection), findsOneWidget);
  });

  testWidgets('browse overlay handles up and down callbacks', (tester) async {
    final node = FocusScopeNode();
    addTearDown(node.dispose);
    var upCount = 0;
    var downCount = 0;

    await tester.pumpWidget(
      _BrowseHarness(
        child: TvPlayerBrowseOverlay(
          node: node,
          title: 'Related lives',
          itemCount: 1,
          onUp: () => upCount += 1,
          onDown: () => downCount += 1,
          itemBuilder: (context, index) {
            return TvPlayerBrowseCard(
              title: 'Live $index',
              imageUrl: null,
              channelName: 'Channel $index',
              autofocus: true,
              onPressed: () {},
            );
          },
        ),
      ),
    );
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.arrowUp);
    await tester.sendKeyEvent(LogicalKeyboardKey.arrowDown);

    expect(upCount, 1);
    expect(downCount, 1);
  });

  testWidgets('browse card uses live and vod info variants over thumbnail', (
    tester,
  ) async {
    await tester.pumpWidget(
      _BrowseHarness(
        child: Row(
          children: [
            TvPlayerBrowseCard(
              title: 'Live title',
              imageUrl: null,
              channelName: 'Live channel',
              channelVerified: true,
              liveBadgeLabel: '12,345 - Talk',
              onPressed: () {},
            ),
            const SizedBox(width: 20),
            TvPlayerBrowseCard(
              variant: TvPlayerBrowseCardVariant.vod,
              title: 'VOD title',
              imageUrl: null,
              vodPublishDateLabel: '2026.06.17',
              vodDurationLabel: '12:34',
              progress: 0.5,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );

    expect(find.text('Live channel'), findsOneWidget);
    expect(find.text('Live title'), findsOneWidget);
    expect(find.text('12,345 - Talk'), findsOneWidget);
    expect(find.text('VOD title'), findsOneWidget);
    expect(find.text('2026.06.17'), findsOneWidget);
    expect(find.text('•'), findsOneWidget);
    expect(find.text('12:34'), findsOneWidget);
    expect(find.byIcon(Icons.calendar_month_rounded), findsOneWidget);
    expect(find.byIcon(Icons.schedule_rounded), findsOneWidget);
    expect(find.byType(LinearProgressIndicator), findsOneWidget);
  });
}

class _BrowseHarness extends StatelessWidget {
  const _BrowseHarness({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColorTokens.brandColor,
          brightness: Brightness.dark,
        ),
      ),
      home: Scaffold(
        body: SizedBox(
          width: 960,
          height: 540,
          child: child,
        ),
      ),
    );
  }
}
