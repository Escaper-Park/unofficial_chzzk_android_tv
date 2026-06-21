part of 'tv_tab.dart';

class _TvTabContent extends StatelessWidget {
  const _TvTabContent({
    required this.design,
    required this.colorScheme,
    required this.label,
    required this.icon,
    required this.showLabel,
    required this.showIcon,
    required this.focused,
    required this.selected,
    required this.enabled,
  });

  final TvTabDesign design;
  final ColorScheme colorScheme;
  final String? label;
  final IconData? icon;
  final bool showLabel;
  final bool showIcon;
  final bool focused;
  final bool selected;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: design.padding,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: design.iconTextGap,
        children: [
          if (showIcon) Icon(icon, size: design.iconSize),
          if (showLabel)
            Text(
              label!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
        ],
      ),
    );

    if (design.variant == TvTabVariant.primary) {
      return content;
    }

    return SizedBox(
      height: design.height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          content,
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: _TvTabUnderline(
              design: design,
              colorScheme: colorScheme,
              focused: focused,
              selected: selected,
              enabled: enabled,
            ),
          ),
        ],
      ),
    );
  }
}
