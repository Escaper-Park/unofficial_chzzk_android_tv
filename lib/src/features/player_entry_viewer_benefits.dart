import 'channel/domain/repositories/channel_repository.dart';

typedef PlayerEntryViewerBenefits = ({bool cheatKey, bool naverMembership});

const noPlayerEntryViewerBenefits = (
  cheatKey: false,
  naverMembership: false,
);

Future<PlayerEntryViewerBenefits> loadPlayerEntryViewerBenefits(
  ChannelRepository repository, {
  required String channelId,
}) async {
  try {
    final myInfo = await repository.getMyInfo(channelId: channelId);
    return (
      cheatKey: myInfo.cheatKey,
      naverMembership: myInfo.naverMembership,
    );
  } catch (_) {
    return noPlayerEntryViewerBenefits;
  }
}

String? playerEntryTextOrNull(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty || trimmed.toLowerCase() == 'null') {
    return null;
  }

  return trimmed;
}
