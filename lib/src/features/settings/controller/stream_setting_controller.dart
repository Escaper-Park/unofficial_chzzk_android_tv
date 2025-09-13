import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart';
import '../../../utils/popup/popup_utils.dart';
import '../../../utils/shared_preferences/shared_prefs.dart';
import '../../watching_history/controller/local_watching_history_controller.dart';
import '../model/stream_settings.dart';
import '../repository/stream_settings_repository.dart';
import '../../../common/constants/playback_speed.dart';

part 'stream_setting_controller.g.dart';

@riverpod
class StreamSettingsController extends _$StreamSettingsController {
  late StreamSettingsRepository _repository;

  @override
  StreamSettings build() {
    final prefs = ref.watch(sharedPrefsProvider);
    _repository = StreamSettingsRepository(prefs: prefs);

    return _repository.getValues();
  }

  Future<void> setResolutionIndex(int value) async {
    await _updateInt(value, 0, 4, state.copyWith(resolutionIndex: value));
  }

  Future<void> setMultiviewResolutionIndex(int value) async {
    await _updateInt(
      value,
      0,
      4,
      state.copyWith(multiviewResolutionIndex: value),
    );
  }

  Future<void> setVodResolutionIndex(int value) async {
    await _updateInt(value, 0, 2, state.copyWith(vodResolutionIndex: value));
  }

  Future<void> setLiveChatWindowIndex(int value) async {
    await _updateInt(value, 0, 2, state.copyWith(liveChatWindowIndex: value));
  }

  Future<void> setVodChatWindowIndex(int value) async {
    await _updateInt(value, 0, 2, state.copyWith(vodChatWindowIndex: value));
  }

  Future<void> setLatencyIndex(int value) async {
    await _updateInt(value, 0, 1, state.copyWith(latencyIndex: value));
  }

  Future<void> setOverlayControlsDisplayTime(int value) async {
    await _updateInt(
      value,
      5,
      30,
      state.copyWith(overlayControlsDisplayTime: value),
    );
  }

  Future<void> setVodPlaybackIntervalIndex(int value) async {
    await _updateInt(
      value,
      0,
      2,
      state.copyWith(vodPlaybackIntervalIndex: value),
    );
  }

  Future<void> setShowGroupIndex(int value) async {
    await _updateInt(
      value,
      0,
      1,
      state.copyWith(showGroupInVideoPlayer: value),
    );
  }

  Future<void> setVodPlaybackSpeed(int value) async {
    await _updateInt(
      value,
      0,
      PlaybackSpeed.values.length - 1,
      state.copyWith(vodPlaybackSpeedIndex: value),
    );
  }

  Future<void> deleteAllWatchingHistory({required BuildContext context}) async {
    await PopupUtils.showButtonDialog(
      context: context,
      titleText: '기록 삭제',
      contentText: '정말로 모든 시청 기록을 삭제하시겠습니까?\n이 작업은 되돌릴 수 없습니다.',
      buttonType: DialogButtonType.doubleButton,
      confirmText: '삭제',
      cancelText: '취소',
      confirmCallback: () async {
        await ref
            .read(localWatchingHistoryControllerProvider.notifier)
            .removeAllWatchingHistory();

        if (context.mounted) {
          PopupUtils.showSnackBar(
            context: context,
            content: '모든 시청 기록이 삭제되었습니다.',
          );
        }
      },
    );
  }

  /// Update int fields
  Future<void> _updateInt(
    int value,
    int min,
    int max,
    StreamSettings settings,
  ) async {
    if (value >= min && value <= max) {
      state = settings;
      await _repository.updateValue(settings);
    }
  }
}
