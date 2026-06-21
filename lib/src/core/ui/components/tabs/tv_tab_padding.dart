part of 'tv_tab_design.dart';

EdgeInsets _tvTabPadding({
  required bool showLabel,
  required bool showIcon,
}) {
  if (showLabel && showIcon) {
    return const EdgeInsets.fromLTRB(12, 6, 16, 6);
  }

  if (showIcon) {
    return const EdgeInsets.symmetric(horizontal: 15, vertical: 7);
  }

  return const EdgeInsets.symmetric(horizontal: 16, vertical: 6);
}
