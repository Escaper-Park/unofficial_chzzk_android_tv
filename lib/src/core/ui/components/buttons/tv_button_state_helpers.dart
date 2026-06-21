part of 'tv_button_design.dart';

bool _isTvButtonSelectedOrPressed(Set<WidgetState> states, bool selected) {
  return selected || states.contains(WidgetState.pressed);
}

Set<WidgetState> _tvButtonStatesWithFocus(
  Set<WidgetState> states,
  bool focused,
) {
  if (!focused || states.contains(WidgetState.focused)) {
    return states;
  }

  return {
    ...states,
    WidgetState.focused,
  };
}
