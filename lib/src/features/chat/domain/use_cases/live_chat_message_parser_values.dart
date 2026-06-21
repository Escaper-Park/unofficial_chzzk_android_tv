part of 'live_chat_message_parser.dart';

int? _readInt(Object? value) {
  if (value is int) {
    return value;
  }
  if (value is num) {
    return value.toInt();
  }
  if (value is String) {
    return int.tryParse(value);
  }

  return null;
}

String? _readString(Object? value) {
  return value is String ? value : null;
}

List<PlayerChatMessage> _chronological(
  List<PlayerChatMessage> messages, {
  bool newestFirst = false,
}) {
  final indexed =
      [
        for (var index = 0; index < messages.length; index += 1)
          MapEntry(index, messages[index]),
      ]..sort((left, right) {
        final timeCompare = left.value.messageTime.compareTo(
          right.value.messageTime,
        );
        if (timeCompare != 0) {
          return timeCompare;
        }

        return newestFirst
            ? right.key.compareTo(left.key)
            : left.key.compareTo(right.key);
      });

  return indexed.map((entry) => entry.value).toList(growable: false);
}
