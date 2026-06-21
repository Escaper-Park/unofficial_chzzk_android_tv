part of 'vod_player_entry_flow.dart';

Future<void> _showBlockedDialog(
  BuildContext context,
  VodPlayerEntryBlockReason reason,
) async {
  await showTvDialog(
    context: context,
    type: TvDialogType.confirm,
    title: VodPlayerEntryString.dialogTitle,
    content: VodPlayerEntryString.blockedContent(reason),
    primaryLabel: VodPlayerEntryString.confirm,
    icon: Icons.block_rounded,
  );
}

Future<int?> _resolveStartPositionSeconds({
  required BuildContext context,
  required int? watchProgressSeconds,
}) async {
  if (watchProgressSeconds == null || watchProgressSeconds <= 0) {
    return 0;
  }

  final result = await showTvDialog(
    context: context,
    type: TvDialogType.alert,
    title: VodPlayerEntryString.resumeTitle,
    content: VodPlayerEntryString.resumeBody(
      formatVodCardElapsed(Duration(seconds: watchProgressSeconds)),
    ),
    primaryLabel: VodPlayerEntryString.resumeContinue,
    secondaryLabel: VodPlayerEntryString.resumeStartOver,
    icon: Icons.play_circle_outline_rounded,
  );

  return switch (result) {
    TvDialogResult.primary => watchProgressSeconds,
    TvDialogResult.secondary => 0,
    null => null,
  };
}
