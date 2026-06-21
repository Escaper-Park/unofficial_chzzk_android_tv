part of 'tv_button_design.dart';

TvButtonDesign _iconButtonDesign({
  required TvButtonType type,
  required TvIconButtonSize size,
}) {
  final values = switch (size) {
    TvIconButtonSize.small => (container: 28.0, padding: 6.0, icon: 16.0),
    TvIconButtonSize.medium => (container: 40.0, padding: 10.0, icon: 20.0),
    TvIconButtonSize.large => (container: 56.0, padding: 14.0, icon: 28.0),
  };

  return TvButtonDesign(
    height: values.container,
    width: values.container,
    padding: EdgeInsets.all(values.padding),
    radius: BorderRadius.all(Radius.circular(values.container / 2)),
    iconSize: values.icon,
    focusedScale: TvFocusedScale.lg.value,
    outlineWidth: switch (type) {
      TvButtonType.filled => 0,
      TvButtonType.outline => 1,
    },
  );
}
