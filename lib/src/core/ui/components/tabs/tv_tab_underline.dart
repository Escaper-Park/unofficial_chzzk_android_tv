part of 'tv_tab.dart';

class _TvTabUnderline extends StatelessWidget {
  const _TvTabUnderline({
    required this.design,
    required this.colorScheme,
    required this.focused,
    required this.selected,
    required this.enabled,
  });

  final TvTabDesign design;
  final ColorScheme colorScheme;
  final bool focused;
  final bool selected;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final width = design.underlineWidth(
      focused: focused,
      selected: selected,
    );
    if (width == null) {
      return const SizedBox.shrink();
    }

    final line = DecoratedBox(
      decoration: BoxDecoration(
        color: design.underlineColor(
          colorScheme: colorScheme,
          focused: focused,
          selected: selected,
          enabled: enabled,
        ),
      ),
      child: SizedBox(
        width: width.isInfinite ? double.infinity : width,
        height: design.underlineHeight,
      ),
    );

    return Align(
      alignment: Alignment.bottomCenter,
      child: line,
    );
  }
}
