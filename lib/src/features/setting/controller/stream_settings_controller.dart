import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/shared_preferences/shared_prefs.dart';
import '../model/stream_settings.dart';
import '../repository/stream_settings_repository.dart';

part 'stream_settings_controller.g.dart';

@riverpod
class StreamSettingsController extends _$StreamSettingsController {
  late StreamSettingsRepository _repository;

  @override
  StreamSettings build() {
    final prefs = ref.watch(sharedPrefsProvider);
    _repository = StreamSettingsRepository(prefs: prefs);

    return _repository.getSettings();
  }

  Future<void> setResolutionIndex(int value) async {
    final settings = state.copyWith(resolutionIndex: value);
    await _updateInt(value, 0, 4, settings);
  }

  Future<void> setMultiviewResolutionIndex(int value) async {
    final settings = state.copyWith(multiviewResolutionIndex: value);
    await _updateInt(value, 0, 4, settings);
  }

  Future<void> setVodResolutionIndex(int value) async {
    final settings = state.copyWith(vodResolutionIndex: value);
    await _updateInt(value, 0, 2, settings);
  }

  Future<void> setLiveChatWindowStateIndex(int value) async {
    final settings = state.copyWith(liveChatWindowStateIndex: value);
    await _updateInt(value, 0, 2, settings);
  }

  Future<void> setVodChatWindowStateIndex(int value) async {
    final settings = state.copyWith(vodChatWindowStateIndex: value);
    await _updateInt(value, 0, 2, settings);
  }

  Future<void> setLatencyIndex(int value) async {
    final settings = state.copyWith(latencyIndex: value);
    await _updateInt(value, 0, 1, settings);
  }

  Future<void> setOverlayControlsDisplayTime(int value) async {
    final settings = state.copyWith(overlayControlsDisplayTime: value);
    await _updateInt(value, 5, 30, settings);
  }

  Future<void> setVodPlaybackIntervalIndex(int value) async {
    final settings = state.copyWith(vodPlaybackIntervalIndex: value);
    await _updateInt(value, 0, 2, settings);
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
      await _repository.updateSettings(settings);
    }
  }
}
