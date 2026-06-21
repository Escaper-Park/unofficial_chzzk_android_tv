part of 'tv_list_item_design.dart';

final class TvListItemPalette {
  const TvListItemPalette({
    required this.overline,
    required this.title,
    required this.icon,
    required this.subtitle,
    required this.action,
    required this.trailing,
  });

  final Color overline;
  final Color title;
  final Color icon;
  final Color subtitle;
  final Color action;
  final Color trailing;
}

final class TvListItemColors {
  const TvListItemColors({
    this.standardBackground,
    this.focusedBackground,
    this.selectedBackground,
    this.disabledBackground,
  });

  final Color? standardBackground;
  final Color? focusedBackground;
  final Color? selectedBackground;
  final Color? disabledBackground;
}
