sealed class ChannelFailure implements Exception {
  const ChannelFailure(this.message);

  final String message;

  @override
  String toString() {
    return message;
  }
}

final class ChannelLoadFailure extends ChannelFailure {
  const ChannelLoadFailure() : super('Unable to load CHZZK channel data.');
}

final class ChannelMutationFailure extends ChannelFailure {
  const ChannelMutationFailure()
    : super('Unable to update CHZZK channel state.');
}
