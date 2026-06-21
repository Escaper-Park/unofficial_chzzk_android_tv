import '../../../../core/utils/utils.dart';
import '../../domain/entities/chat.dart';

String playerChatTimeLabel(PlayerChatMessage message) {
  final playerMessageTime = message.playerMessageTime;
  if (playerMessageTime != null) {
    return _formatElapsed(Duration(milliseconds: playerMessageTime));
  }

  final kst = DateTime.fromMillisecondsSinceEpoch(
    message.messageTime,
    isUtc: true,
  ).toUtc().add(const Duration(hours: 9));

  final hour = kst.hour.toString().padLeft(2, '0');
  final minute = kst.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

String formatPlayerChatDonationAmount(int amount) {
  return formatKoDecimal(amount);
}

String _formatElapsed(Duration duration) {
  final totalSeconds = duration.inSeconds;
  final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
  final minutes = (totalSeconds ~/ 60 % 60).toString().padLeft(2, '0');
  final hours = totalSeconds ~/ 3600;
  if (hours > 0) {
    return '$hours:$minutes:$seconds';
  }

  return '$minutes:$seconds';
}
