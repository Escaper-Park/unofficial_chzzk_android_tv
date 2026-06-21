import 'package:flutter/foundation.dart';

import '../../../settings_screen_string.dart';

class SettingsLicenseItem {
  const SettingsLicenseItem({
    required this.title,
    required this.paragraphs,
  });

  final String title;
  final List<String> paragraphs;
}

Future<List<SettingsLicenseItem>> loadSettingsLicenseItems() async {
  final entries = await LicenseRegistry.licenses.toList();
  final groupedItems = <String, _SettingsLicenseItemBuilder>{};

  for (final entry in entries) {
    final packageTitles = entry.packages.isEmpty
        ? const <String>[SettingsScreenString.unknownLicensePackage]
        : entry.packages
              .map(_packageTitleWithoutVersion)
              .toList(growable: false);
    final paragraphs = entry.paragraphs
        .map((paragraph) => paragraph.text.trim())
        .where((text) => text.isNotEmpty)
        .toList(growable: false);

    for (final title in packageTitles) {
      final key = title.toLowerCase();
      final builder = groupedItems.putIfAbsent(
        key,
        () => _SettingsLicenseItemBuilder(title),
      );

      builder.paragraphs.addAll(paragraphs);
    }
  }

  final items = <SettingsLicenseItem>[
    for (final builder in groupedItems.values)
      SettingsLicenseItem(
        title: builder.title,
        paragraphs: builder.paragraphs.toList(growable: false),
      ),
  ];

  return items..sort(
    (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()),
  );
}

String _packageTitleWithoutVersion(String packageName) {
  final trimmed = packageName.trim();
  final withoutParenthesizedVersion = trimmed.replaceFirst(
    RegExp(r'\s*\(?v?\d+(?:\.\d+)+(?:[-+][0-9A-Za-z_.-]+)?\)?$'),
    '',
  );

  return withoutParenthesizedVersion
      .replaceFirst(
        RegExp(r':v?\d+(?:\.\d+)+(?:[-+][0-9A-Za-z_.-]+)?$'),
        '',
      )
      .trim();
}

final class _SettingsLicenseItemBuilder {
  _SettingsLicenseItemBuilder(this.title);

  final String title;
  final Set<String> paragraphs = <String>{};
}
