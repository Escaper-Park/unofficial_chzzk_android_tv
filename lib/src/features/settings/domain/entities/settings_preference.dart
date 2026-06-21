import 'general_setting.dart';

enum SettingsPreferenceControlType {
  toggle,
  select,
  slider,
}

final class SettingsPreferenceOptionSet {
  const SettingsPreferenceOptionSet({
    required this.values,
    required this.controlType,
  });

  final List<int> values;
  final SettingsPreferenceControlType controlType;

  int normalize(int value) {
    return values.contains(value) ? value : values.first;
  }

  int next(int value) {
    final index = values.indexOf(value);
    if (index < 0 || index == values.length - 1) {
      return values.first;
    }

    return values[index + 1];
  }

  int previous(int value) {
    final index = values.indexOf(value);
    if (index <= 0) {
      return values.last;
    }

    return values[index - 1];
  }
}

const settingsToggleOptionSet = SettingsPreferenceOptionSet(
  values: [0, 1],
  controlType: SettingsPreferenceControlType.toggle,
);
const settingsResolutionOptionSet = SettingsPreferenceOptionSet(
  values: [0, 1, 2, 3, 4],
  controlType: SettingsPreferenceControlType.select,
);
const settingsLatencyOptionSet = SettingsPreferenceOptionSet(
  values: [0, 1],
  controlType: SettingsPreferenceControlType.select,
);
const settingsVideoViewTypeOptionSet = SettingsPreferenceOptionSet(
  values: [playerVideoViewTypeIndexMin, playerVideoViewTypeIndexMax],
  controlType: SettingsPreferenceControlType.select,
);
const settingsChatWindowOptionSet = SettingsPreferenceOptionSet(
  values: [0, 1, 2],
  controlType: SettingsPreferenceControlType.select,
);
const settingsMultiviewChatWindowOptionSet = SettingsPreferenceOptionSet(
  values: [0, 1, 2],
  controlType: SettingsPreferenceControlType.select,
);
const settingsMultiviewScreenModeOptionSet = SettingsPreferenceOptionSet(
  values: [0, 1, 2],
  controlType: SettingsPreferenceControlType.select,
);
const settingsMultiviewMaxCountOptionSet = SettingsPreferenceOptionSet(
  values: [2, 3, 4],
  controlType: SettingsPreferenceControlType.select,
);
const settingsMultiviewPipLayoutOptionSet = SettingsPreferenceOptionSet(
  values: [0, 1],
  controlType: SettingsPreferenceControlType.select,
);
const settingsVodPlaybackIntervalOptionSet = SettingsPreferenceOptionSet(
  values: [0, 1, 2],
  controlType: SettingsPreferenceControlType.select,
);
const settingsStreamingPreviewSecondsOptionSet = SettingsPreferenceOptionSet(
  values: [1, 3, 5, 10, 15],
  controlType: SettingsPreferenceControlType.select,
);
const settingsStreamingPreviewDurationOptionSet = SettingsPreferenceOptionSet(
  values: [0, 1, 2, 3, 4],
  controlType: SettingsPreferenceControlType.select,
);
const settingsBadgeCollectorDisplayOptionSet = SettingsPreferenceOptionSet(
  values: [0, 1, 2],
  controlType: SettingsPreferenceControlType.select,
);
const settingsSideChatPositionOptionSet = SettingsPreferenceOptionSet(
  values: [0, 1],
  controlType: SettingsPreferenceControlType.select,
);

final settingsOverlayControlsDisplayTimeOptionSet = settingsRangeOptionSet(
  min: 5,
  max: 30,
);
final settingsOverlayChatQuickPositionOptionSet = settingsRangeOptionSet(
  min: 0,
  max: 8,
);
final settingsPositionOptionSet = settingsRangeOptionSet(min: 0, max: 100);
final settingsMultiviewPipSizeOptionSet = settingsRangeOptionSet(
  min: 20,
  max: 50,
);
final settingsOverlayChatPanelHeightOptionSet = settingsRangeOptionSet(
  min: 5,
  max: 100,
);
final settingsOverlayChatPanelWidthOptionSet = settingsRangeOptionSet(
  min: 5,
  max: 50,
);
final settingsChatSidePanelWidthOptionSet = settingsRangeOptionSet(
  min: 15,
  max: 70,
);
final settingsChatMessageFontSizeOptionSet = settingsRangeOptionSet(
  min: 1,
  max: 32,
);
final settingsTransparencyOptionSet = settingsRangeOptionSet(min: 0, max: 100);
final settingsMarginOptionSet = settingsRangeOptionSet(min: 0, max: 15);
final settingsBadgeCollectorPanelHeightOptionSet = settingsRangeOptionSet(
  min: 0,
  max: 100,
);

SettingsPreferenceOptionSet settingsRangeOptionSet({
  required int min,
  required int max,
}) {
  return SettingsPreferenceOptionSet(
    values: List<int>.unmodifiable(
      List<int>.generate(max - min + 1, (index) => min + index),
    ),
    controlType: SettingsPreferenceControlType.slider,
  );
}
