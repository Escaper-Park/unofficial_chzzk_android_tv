import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../domain/entities/settings_preferences.dart';
import '../../../settings_screen_design.dart';
import '../../../settings_screen_string.dart';
import '../shared/settings_pane.dart';
import 'settings_category_items.dart';

class SettingsMenuSection extends StatelessWidget {
  const SettingsMenuSection({
    super.key,
    required this.selectedCategory,
    required this.firstFocusNode,
    required this.onSelected,
  });

  final SettingsCategoryId selectedCategory;
  final FocusNode firstFocusNode;
  final ValueChanged<SettingsCategoryId> onSelected;

  @override
  Widget build(BuildContext context) {
    return SettingsPane(
      header: const _SettingsMenuHeader(),
      panePadding: SettingsScreenDesign.menuPanePadding,
      content: Column(
        spacing: SettingsScreenDesign.rowGap,
        children: [
          for (var index = 0; index < settingsCategoryItems.length; index += 1)
            _SettingsMenuRow(
              item: settingsCategoryItems[index],
              selected:
                  selectedCategory == settingsCategoryItems[index].category,
              focusNode: index == 0 ? firstFocusNode : null,
              autofocus: index == 0,
              onSelected: onSelected,
            ),
        ],
      ),
    );
  }
}

class _SettingsMenuHeader extends StatelessWidget {
  const _SettingsMenuHeader();

  @override
  Widget build(BuildContext context) {
    return const TvListHeader(
      text: SettingsScreenString.title,
    );
  }
}

class _SettingsMenuRow extends StatelessWidget {
  const _SettingsMenuRow({
    required this.item,
    required this.selected,
    required this.focusNode,
    required this.autofocus,
    required this.onSelected,
  });

  final SettingsCategoryItem item;
  final bool selected;
  final FocusNode? focusNode;
  final bool autofocus;
  final ValueChanged<SettingsCategoryId> onSelected;

  @override
  Widget build(BuildContext context) {
    final category = item.category;

    return TvListItem(
      key: ValueKey('settings-menu-${category.name}'),
      title: SettingsScreenString.categoryTitle(category),
      subtitle: SettingsScreenString.categorySummary(category),
      icon: item.icon,
      selected: selected,
      focusNode: focusNode,
      autofocus: autofocus,
      onPressed: selected ? _noop : () => onSelected(category),
    );
  }
}

void _noop() {}
