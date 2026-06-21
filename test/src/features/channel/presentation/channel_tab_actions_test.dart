import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_detail.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/domain/entities/channel_my_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/bloc/channel_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/channel/presentation/view/sections/tabs/channel_tab_actions.dart';

void main() {
  testWidgets('follow action shows following state without selected color', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        ChannelFollowAction(
          state: _state(following: true),
          onPressed: () {},
        ),
      ),
    );

    final action = tester.widget<TvTabActionButton>(
      find.byType(TvTabActionButton),
    );

    expect(find.text('팔로잉'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_rounded), findsOneWidget);
    expect(action.selected, false);
  });

  testWidgets('follow action shows empty heart when not following', (
    tester,
  ) async {
    await tester.pumpWidget(
      _wrap(
        ChannelFollowAction(
          state: _state(following: false),
          onPressed: () {},
        ),
      ),
    );

    final action = tester.widget<TvTabActionButton>(
      find.byType(TvTabActionButton),
    );

    expect(find.text('팔로우'), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border_rounded), findsOneWidget);
    expect(action.selected, false);
  });
}

Widget _wrap(Widget child) {
  return MaterialApp(
    home: Scaffold(body: Center(child: child)),
  );
}

ChannelState _state({
  required bool following,
}) {
  return ChannelState.initial(
    channelId: 'channel',
    isSignedIn: true,
  ).copyWith(
    profileStatus: ChannelLoadStatus.ready,
    profile: const ChannelDetail(
      channelId: 'channel',
      channelName: 'Streamer',
      verifiedMark: false,
      followerCount: 1,
      description: '',
      openLive: false,
    ),
    myInfo: ChannelMyInfo(
      channelId: 'channel',
      following: ChannelPersonalFollowing(
        following: following,
        notification: false,
      ),
      cheatKey: false,
      naverMembership: false,
    ),
  );
}
