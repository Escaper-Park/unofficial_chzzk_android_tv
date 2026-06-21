import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_category.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/models/settings_preference_models.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/view/shared/settings_focus_registry.dart';

void main() {
  testWidgets('opener lookup falls back instead of creating a stale node', (
    tester,
  ) async {
    final registry = SettingsFocusRegistry();
    final detailsFirstNode = FocusNode(debugLabel: 'details first');
    const mountedRef = SettingsPreferenceRef(
      category: SettingsCategoryId.general,
      index: 1,
    );
    final mountedNode = registry.nodeFor(mountedRef);

    addTearDown(registry.dispose);
    addTearDown(detailsFirstNode.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Column(
          children: [
            Focus(focusNode: detailsFirstNode, child: const Text('First')),
            Focus(focusNode: mountedNode, child: const Text('Mounted')),
          ],
        ),
      ),
    );

    expect(
      registry.openerNodeFor(
        activeRef: mountedRef,
        detailsFirstNode: detailsFirstNode,
      ),
      same(mountedNode),
    );

    expect(
      registry.openerNodeFor(
        activeRef: const SettingsPreferenceRef(
          category: SettingsCategoryId.chat,
          index: 7,
        ),
        detailsFirstNode: detailsFirstNode,
      ),
      same(detailsFirstNode),
    );
  });

  test('opener lookup returns null when no restore target is mounted', () {
    final registry = SettingsFocusRegistry();
    final detailsFirstNode = FocusNode(debugLabel: 'details first');

    addTearDown(registry.dispose);
    addTearDown(detailsFirstNode.dispose);

    expect(
      registry.openerNodeFor(
        activeRef: const SettingsPreferenceRef(
          category: SettingsCategoryId.chat,
          index: 7,
        ),
        detailsFirstNode: detailsFirstNode,
      ),
      isNull,
    );
  });
}
