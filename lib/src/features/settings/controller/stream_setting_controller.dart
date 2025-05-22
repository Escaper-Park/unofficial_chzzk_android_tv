import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/shared_preferences/shared_prefs.dart';
import '../model/stream_settings.dart';
import '../repository/stream_settings_repository.dart';

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
