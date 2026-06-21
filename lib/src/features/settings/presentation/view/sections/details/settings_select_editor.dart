part of 'settings_editor_panel.dart';

class _SettingsSelectEditor extends StatelessWidget {
  const _SettingsSelectEditor({
    required this.ref,
    required this.item,
    required this.value,
    required this.openerNode,
  });

  final SettingsPreferenceRef ref;
  final SettingsPreferenceItem item;
  final int value;
  final FocusNode? openerNode;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: SettingsScreenDesign.modalOptionListMaxHeight,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: SettingsScreenDesign.rowGap,
          children: [
            for (final option in item.optionSet.values)
              _SettingsVisibleOnFocus(
                child: TvListItem(
                  key: ValueKey(
                    'settings-option-${ref.category.name}-${ref.index}-$option',
                  ),
                  title: item.label(option),
                  leading: _settingsPositionIcon(
                    item: item,
                    value: option,
                    size: 32,
                  ),
                  trailing: TvCheckbox(
                    selected: option == value,
                    shape: TvCheckboxShape.rounded,
                  ),
                  autofocus: option == value,
                  onPressed: () {
                    context.read<SettingsBloc>().add(
                      SettingsEvent.optionSelected(
                        ref: ref,
                        value: option,
                      ),
                    );
                    openerNode?.requestFocus();
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _SettingsVisibleOnFocus extends StatelessWidget {
  const _SettingsVisibleOnFocus({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onFocusChange: (focused) {
        if (focused) {
          _ensureOptionVisible(context);
        }
      },
      child: child,
    );
  }
}

void _ensureOptionVisible(BuildContext context) {
  final target = context.findRenderObject();
  if (target == null || !target.attached) {
    return;
  }

  final viewport = RenderAbstractViewport.maybeOf(target);
  if (viewport == null) {
    _scrollOptionIntoView(context, alignment: 0.5);
    return;
  }

  final viewportObject = viewport as RenderObject;
  if (!viewportObject.attached) {
    return;
  }

  final itemRect = MatrixUtils.transformRect(
    target.getTransformTo(viewportObject),
    target.paintBounds,
  );
  final viewportRect = viewportObject.paintBounds;
  if (itemRect.top >= viewportRect.top &&
      itemRect.bottom <= viewportRect.bottom) {
    return;
  }

  _scrollOptionIntoView(
    context,
    alignment: itemRect.top < viewportRect.top ? 0 : 1,
  );
}

void _scrollOptionIntoView(
  BuildContext context, {
  required double alignment,
}) {
  unawaited(
    Scrollable.ensureVisible(
      context,
      alignment: alignment,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
    ),
  );
}
