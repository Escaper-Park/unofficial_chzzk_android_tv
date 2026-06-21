sealed class ChatFailure implements Exception {
  const ChatFailure(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

final class ChatLoadFailure extends ChatFailure {
  const ChatLoadFailure() : super('Unable to load CHZZK chat data.');
}
