part of 'tv_list_item.dart';

class _FocusableTvListItem extends HookWidget {
  const _FocusableTvListItem({
    required this.title,
    required this.titleBuilder,
    required this.subtitle,
    required this.overline,
    required this.leading,
    required this.icon,
    required this.action,
    required this.trailing,
    required this.focusNode,
    required this.selected,
    required this.enabled,
    required this.autofocus,
    required this.design,
    required this.onPressed,
  });

  final String title;
  final TvListItemTitleBuilder? titleBuilder;
  final String? subtitle;
  final String? overline;
  final Widget? leading;
  final IconData? icon;
  final String? action;
  final Widget? trailing;
  final FocusNode? focusNode;
  final bool selected;
  final bool enabled;
  final bool autofocus;
  final TvListItemDesign design;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ownedFocusNode = useFocusNode();
    final focusNode = this.focusNode ?? ownedFocusNode;
    final activationGuard = useMemoized(TvActivationGuard.new);
    useListenable(focusNode);

    return _TvListItemSurface(
      title: title,
      titleBuilder: titleBuilder,
      subtitle: subtitle,
      overline: overline,
      leading: leading,
      icon: icon,
      action: action,
      trailing: trailing,
      selected: selected,
      enabled: enabled,
      autofocus: autofocus,
      focused: focusNode.hasFocus,
      focusNode: focusNode,
      design: design,
      onPressed: () => activationGuard.run(onPressed),
    );
  }
}

class _TvListItemSurface extends StatelessWidget {
  const _TvListItemSurface({
    required this.title,
    required this.titleBuilder,
    required this.subtitle,
    required this.overline,
    required this.leading,
    required this.icon,
    required this.action,
    required this.trailing,
    required this.selected,
    required this.enabled,
    required this.autofocus,
    required this.focused,
    required this.focusNode,
    required this.design,
    required this.onPressed,
  });

  final String title;
  final TvListItemTitleBuilder? titleBuilder;
  final String? subtitle;
  final String? overline;
  final Widget? leading;
  final IconData? icon;
  final String? action;
  final Widget? trailing;
  final bool selected;
  final bool enabled;
  final bool autofocus;
  final bool focused;
  final FocusNode focusNode;
  final TvListItemDesign design;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final palette = design.palette(
      colorScheme: colorScheme,
      focused: focused && enabled,
      selected: selected,
      enabled: enabled,
    );

    void activate() {
      if (enabled) {
        onPressed();
      }
    }

    final child = AnimatedScale(
      scale: focused && enabled ? design.focusedScale : 1,
      duration: const Duration(milliseconds: 120),
      child: Focus(
        autofocus: autofocus,
        focusNode: focusNode,
        canRequestFocus: enabled,
        child: Semantics(
          button: true,
          selected: selected,
          enabled: enabled,
          onTap: enabled ? onPressed : null,
          child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: enabled ? onPressed : null,
            child: SizedBox(
              height: design.height,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: design.backgroundColor(
                    colorScheme: colorScheme,
                    focused: focused && enabled,
                    selected: selected,
                    enabled: enabled,
                  ),
                  borderRadius: design.radius,
                ),
                child: Padding(
                  padding: design.padding,
                  child: Row(
                    spacing: design.slotGap,
                    children: [
                      if (leading != null || icon != null)
                        SizedBox.square(
                          dimension: design.iconSize,
                          child: Center(
                            child:
                                leading ??
                                Icon(
                                  icon,
                                  size: design.iconSize,
                                  color: palette.icon,
                                ),
                          ),
                        ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: _TvListItemTextBlock(
                            title: title,
                            titleBuilder: titleBuilder,
                            subtitle: subtitle,
                            overline: overline,
                            palette: palette,
                            textTheme: textTheme,
                          ),
                        ),
                      ),
                      if (action != null || trailing != null)
                        _TvListItemTrailing(
                          action: action,
                          trailing: trailing,
                          design: design,
                          palette: palette,
                          textTheme: textTheme,
                        ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    if (!enabled) {
      return child;
    }

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.select): activate,
        const SingleActivator(LogicalKeyboardKey.enter): activate,
        const SingleActivator(LogicalKeyboardKey.numpadEnter): activate,
      },
      child: child,
    );
  }
}
