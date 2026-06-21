import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../app/router/app_routes.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../settings_screen_design.dart';
import 'settings_info_items.dart';
import 'settings_info_text_item.dart';

class SettingsInfoSection extends StatelessWidget {
  const SettingsInfoSection({
    super.key,
    required this.items,
    required this.firstFocusNode,
  });

  final List<SettingsInfoItem> items;
  final FocusNode firstFocusNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: SettingsScreenDesign.rowGap,
      children: [
        for (var index = 0; index < items.length; index += 1)
          if (items[index].plainText)
            SettingsInfoTextItem(
              key: ValueKey('settings-info-$index'),
              title: items[index].title,
              description: items[index].description,
              focusNode: index == 0 ? firstFocusNode : null,
              autofocus: index == 0,
            )
          else
            TvListItem(
              key: ValueKey('settings-info-$index'),
              title: items[index].title,
              subtitle: items[index].description,
              action: items[index].action,
              icon: items[index].icon,
              focusNode: index == 0 ? firstFocusNode : null,
              autofocus: index == 0,
              onPressed: () {
                _handleInfoItemPressed(context, items[index]);
              },
            ),
      ],
    );
  }

  void _handleInfoItemPressed(BuildContext context, SettingsInfoItem item) {
    switch (item.pressAction) {
      case SettingsInfoItemAction.openSourceLicenses:
        unawaited(context.push(AppRoute.settingsLicenses.path));
      case null:
        break;
    }
  }
}
