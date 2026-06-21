import '../../../vod/domain/entities/vod_detail.dart';
import '../bloc/vod_player_bloc.dart';

bool canUseVodChatShortcut(VodPlayerState state) {
  return state.overlayMode == VodPlayerOverlayMode.none &&
      isVodChatAvailable(state.activeSlot.detail);
}

int visibleVodChatWindowIndex(int index) {
  return index == vodChatWindowHiddenIndex ? vodChatWindowOverlayIndex : index;
}

bool isVodChatAvailable(VodDetail? detail) {
  final chatChannelId = detail?.videoChatChannelId?.trim();
  return detail?.videoChatEnabled == true &&
      chatChannelId != null &&
      chatChannelId.isNotEmpty;
}

const vodChatWindowHiddenIndex = 0;
const vodChatWindowOverlayIndex = 1;
