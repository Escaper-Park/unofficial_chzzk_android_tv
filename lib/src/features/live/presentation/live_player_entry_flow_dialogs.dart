part of 'live_player_entry_flow.dart';

Future<void> _showBlockedDialog(
  BuildContext context,
  LivePlayerEntryBlockReason reason,
) async {
  await showTvDialog(
    context: context,
    type: TvDialogType.confirm,
    title: LivePlayerEntryString.dialogTitle,
    content: LivePlayerEntryString.blockedContent(reason),
    primaryLabel: LivePlayerEntryString.confirm,
    icon: Icons.block_rounded,
  );
}
