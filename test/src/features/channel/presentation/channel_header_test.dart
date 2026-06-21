import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/bloc/channel_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/channel_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/view/sections/header/channel_header.dart';

void main() {
  test('header and tab row keep the requested vertical spacing', () {
    expect(ChannelScreenDesign.headerHeight, 120);
    expect(ChannelScreenDesign.tabRowPadding.top, 24);
  });

  testWidgets('does not render channel name while profile is absent', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        ChannelHeader(
          state: ChannelState.initial(
            channelId: 'channel',
            isSignedIn: false,
          ).copyWith(profileStatus: ChannelLoadStatus.loading),
        ),
      ),
    );

    expect(find.byType(TvMediaChannelName), findsNothing);
  });

  testWidgets('renders channel description as trimmed two-line text', (
    tester,
  ) async {
    const description = ' first line\nsecond line\tthird line ';

    await tester.pumpWidget(
      _wrap(
        ChannelHeader(
          state:
              ChannelState.initial(
                channelId: 'channel',
                isSignedIn: true,
              ).copyWith(
                profileStatus: ChannelLoadStatus.ready,
                profile: _channelDetail(description: description),
              ),
        ),
      ),
    );

    final descriptionText = tester.widget<Text>(
      find.text('first line second line third line'),
    );

    expect(
      descriptionText.maxLines,
      ChannelScreenDesign.headerDescriptionMaxLines,
    );

    final context = tester.element(
      find.text('first line second line third line'),
    );
    expect(
      descriptionText.style?.fontSize,
      Theme.of(context).textTheme.labelSmall?.fontSize,
    );
  });

  testWidgets('does not render empty channel description placeholder', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        ChannelHeader(
          state:
              ChannelState.initial(
                channelId: 'channel',
                isSignedIn: true,
              ).copyWith(
                profileStatus: ChannelLoadStatus.ready,
                profile: _channelDetail(description: '  '),
              ),
        ),
      ),
    );
  });
}

Widget _wrap(Widget child) {
  return MaterialApp(
    home: Scaffold(body: child),
  );
}

ChannelDetail _channelDetail({
  required String description,
}) {
  return ChannelDetail(
    channelId: 'channel',
    channelName: 'Streamer',
    verifiedMark: false,
    followerCount: 12000,
    description: description,
    openLive: false,
  );
}
