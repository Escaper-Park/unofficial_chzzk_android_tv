import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/settings_licenses_screen.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/settings_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/settings_screen_string.dart';

void main() {
  testWidgets('renders grouped package license notices', (tester) async {
    _addTestLicense(
      packageName: '000_test_license_package 1.2.3',
      paragraph: 'Test license paragraph.',
    );

    await _pumpLicensesScreen(tester);

    expect(
      find.text(SettingsScreenString.appInfoOpenSourceLicensesTitle),
      findsOneWidget,
    );
    expect(find.text('000_test_license_package'), findsWidgets);
    expect(find.text('Test license paragraph.'), findsOneWidget);
  });

  testWidgets('places package list directly below the title gap', (
    tester,
  ) async {
    _addTestLicense(
      packageName: '001_test_license_package 1.0.0',
      paragraph: 'Another test license paragraph.',
    );

    await _pumpLicensesScreen(tester);

    final headerFinder = find.byType(TvListHeader);
    final listFinder = find.byKey(
      const ValueKey('settings-license-package-list'),
    );

    expect(
      tester.getTopLeft(listFinder).dy,
      tester.getBottomLeft(headerFinder).dy +
          SettingsScreenDesign.licensesContentTopGap,
    );
  });

  testWidgets('clips package list to its viewport while scrolling', (
    tester,
  ) async {
    _addTestLicense(
      packageName: '002_test_license_package 1.0.0',
      paragraph: 'Scrollable test license paragraph.',
    );

    await _pumpLicensesScreen(tester);

    final packageList = tester.widget<ListView>(
      find.byKey(const ValueKey('settings-license-package-list')),
    );

    expect(packageList.clipBehavior, Clip.hardEdge);
  });
}

void _addTestLicense({
  required String packageName,
  required String paragraph,
}) {
  LicenseRegistry.addLicense(() async* {
    yield LicenseEntryWithLineBreaks(<String>[packageName], paragraph);
  });
}

Future<void> _pumpLicensesScreen(WidgetTester tester) async {
  tester.view.physicalSize = const Size(960, 540);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);

  await tester.pumpWidget(
    const MaterialApp(
      home: SettingsLicensesScreen(),
    ),
  );
  await tester.pump();
  await tester.pump();
}
