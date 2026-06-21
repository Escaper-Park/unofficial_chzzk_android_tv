import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_update_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_preferences_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_update_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/settings_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/view/layout/settings_layout.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/view/sections/details/settings_details_section.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/view/sections/menu/settings_menu_section.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/view/shared/settings_focus_registry.dart';

void main() {
  testWidgets('uses 4 and 8 pane spans with 7-column details content', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final nodes = _SettingsTestNodes();
    addTearDown(nodes.dispose);

    await tester.pumpWidget(
      _SettingsBlocScope(
        child: MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 960,
              height: 540,
              child: SettingsLayout(
                state: const SettingsState(
                  loadStatus: SettingsLoadStatus.ready,
                ),
                menuNode: nodes.menuNode,
                detailsNode: nodes.detailsNode,
                panelNode: nodes.panelNode,
                menuFirstNode: nodes.menuFirstNode,
                detailsFirstNode: nodes.detailsFirstNode,
                focusRegistry: nodes.focusRegistry,
                openerNode: null,
                onMenuSelected: (_) {},
              ),
            ),
          ),
        ),
      ),
    );

    const screenWidth = 960.0;
    final contentWidth = SettingsScreenDesign.gridContentWidth(screenWidth);
    final expectedMenuContentWidth = SettingsScreenDesign.menuContentWidth(
      screenWidth,
    );
    final expectedDetailsContentWidth =
        SettingsScreenDesign.detailsContentWidth(screenWidth);
    final expectedDetailsPaneContentWidth =
        SettingsScreenDesign.detailsPaneContentWidth(screenWidth);
    final expectedMenuPaneWidth = SettingsScreenDesign.menuPaneWidth(
      screenWidth,
    );
    final expectedDetailsPaneWidth = SettingsScreenDesign.detailsPaneWidth(
      screenWidth,
    );
    final expectedDetailsPanePadding = SettingsScreenDesign.detailsPanePadding(
      screenWidth,
    );

    final menuFinder = find.byType(SettingsMenuSection);
    final detailsFinder = find.byType(SettingsDetailsSection);
    final menuSize = tester.getSize(menuFinder);
    final detailsSize = tester.getSize(detailsFinder);
    final menuLeft = tester.getTopLeft(menuFinder);
    final menuRight = tester.getTopRight(menuFinder);
    final detailsLeft = tester.getTopLeft(detailsFinder);
    final menuHeaderFinder = find
        .descendant(
          of: menuFinder,
          matching: find.byType(TvListHeader),
        )
        .first;
    final detailsHeaderFinder = find
        .descendant(
          of: detailsFinder,
          matching: find.byType(TvListHeader),
        )
        .first;
    final firstMenuRowFinder = find.byKey(const Key('settings-menu-general'));
    final firstDetailsRowFinder = find.byKey(
      const Key('settings-preference-general-0'),
    );
    final menuScrollFinder = find.descendant(
      of: menuFinder,
      matching: find.byType(SingleChildScrollView),
    );
    final detailsScrollFinder = find.descendant(
      of: detailsFinder,
      matching: find.byType(SingleChildScrollView),
    );
    final menuScroll = tester.widget<SingleChildScrollView>(
      menuScrollFinder,
    );
    final detailsScroll = tester.widget<SingleChildScrollView>(
      detailsScrollFinder,
    );

    expect(SettingsScreenDesign.gridColumnCount, 12);
    expect(SettingsScreenDesign.gridColumnWidth(contentWidth), 52);
    expect(SettingsScreenDesign.columnGap, 20);
    expect(SettingsScreenDesign.menuColumnSpan, 4);
    expect(SettingsScreenDesign.detailsColumnSpan, 8);
    expect(SettingsScreenDesign.detailsContentColumnSpan, 7);
    expect(expectedMenuContentWidth, 268);
    expect(expectedDetailsPaneContentWidth, 556);
    expect(expectedDetailsContentWidth, 484);
    expect(expectedDetailsPanePadding.left, 36);
    expect(expectedDetailsPanePadding.right, 94);
    expect(expectedMenuPaneWidth, 326);
    expect(expectedDetailsPaneWidth, 614);
    expect(menuLeft.dx, 0);
    expect(menuLeft.dy, 0);
    expect(menuSize.width, expectedMenuPaneWidth);
    expect(menuSize.height, 540);
    expect(detailsLeft.dx - menuRight.dx, SettingsScreenDesign.columnGap);
    expect(detailsLeft.dy, 0);
    expect(detailsSize.width, expectedDetailsPaneWidth);
    expect(detailsSize.height, 540);
    expect(
      tester.getTopLeft(menuHeaderFinder).dx,
      menuLeft.dx + SettingsScreenDesign.menuPanePadding.left,
    );
    expect(
      tester.getTopLeft(detailsHeaderFinder).dx,
      detailsLeft.dx + expectedDetailsPanePadding.left,
    );
    expect(
      tester.getTopLeft(menuHeaderFinder).dy,
      SettingsScreenDesign.headerTopPadding,
    );
    expect(
      tester.getTopLeft(detailsHeaderFinder).dy,
      SettingsScreenDesign.headerTopPadding,
    );
    expect(
      tester.getTopLeft(firstMenuRowFinder).dy,
      tester.getBottomLeft(menuHeaderFinder).dy +
          SettingsScreenDesign.listViewportPadding.top +
          SettingsScreenDesign.listContentPadding.top,
    );
    expect(
      tester.getTopLeft(firstDetailsRowFinder).dy,
      tester.getBottomLeft(detailsHeaderFinder).dy +
          SettingsScreenDesign.listViewportPadding.top +
          SettingsScreenDesign.listContentPadding.top,
    );
    expect(
      tester.getTopLeft(menuScrollFinder).dy,
      tester.getBottomLeft(menuHeaderFinder).dy +
          SettingsScreenDesign.listViewportPadding.top,
    );
    expect(
      tester.getBottomLeft(menuScrollFinder).dy,
      tester.getBottomLeft(menuFinder).dy -
          SettingsScreenDesign.listViewportPadding.bottom,
    );
    expect(
      tester.getTopLeft(detailsScrollFinder).dy,
      tester.getBottomLeft(detailsHeaderFinder).dy +
          SettingsScreenDesign.listViewportPadding.top,
    );
    expect(
      tester.getBottomLeft(detailsScrollFinder).dy,
      tester.getBottomLeft(detailsFinder).dy -
          SettingsScreenDesign.listViewportPadding.bottom,
    );
    expect(
      tester.getTopLeft(menuScrollFinder).dx,
      menuLeft.dx +
          SettingsScreenDesign.menuPanePadding.left -
          SettingsScreenDesign.listHorizontalFocusBleed,
    );
    expect(
      tester.getSize(menuScrollFinder).width,
      expectedMenuContentWidth +
          SettingsScreenDesign.listHorizontalFocusBleed * 2,
    );
    expect(
      tester.getTopLeft(detailsScrollFinder).dx,
      detailsLeft.dx +
          expectedDetailsPanePadding.left -
          SettingsScreenDesign.listHorizontalFocusBleed,
    );
    expect(
      tester.getSize(detailsScrollFinder).width,
      expectedDetailsContentWidth +
          SettingsScreenDesign.listHorizontalFocusBleed * 2,
    );
    expect(
      tester.getTopLeft(firstMenuRowFinder).dx,
      menuLeft.dx + SettingsScreenDesign.menuPanePadding.left,
    );
    expect(tester.getSize(firstMenuRowFinder).width, expectedMenuContentWidth);
    expect(
      tester.getTopLeft(firstDetailsRowFinder).dx,
      detailsLeft.dx + expectedDetailsPanePadding.left,
    );
    expect(
      tester.getSize(firstDetailsRowFinder).width,
      expectedDetailsContentWidth,
    );
    expect(menuScroll.padding, SettingsScreenDesign.listContentPadding);
    expect(
      detailsScroll.padding,
      SettingsScreenDesign.listContentPadding,
    );
    expect(menuScroll.clipBehavior, Clip.hardEdge);
    expect(detailsScroll.clipBehavior, Clip.hardEdge);
  });

  testWidgets('recreates details section when selected category changes', (
    tester,
  ) async {
    final nodes = _SettingsTestNodes();
    addTearDown(nodes.dispose);

    Widget buildLayout(SettingsCategoryId category) {
      return _SettingsBlocScope(
        child: MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 960,
              height: 540,
              child: SettingsLayout(
                state: SettingsState(
                  loadStatus: SettingsLoadStatus.ready,
                  selectedCategory: category,
                ),
                menuNode: nodes.menuNode,
                detailsNode: nodes.detailsNode,
                panelNode: nodes.panelNode,
                menuFirstNode: nodes.menuFirstNode,
                detailsFirstNode: nodes.detailsFirstNode,
                focusRegistry: nodes.focusRegistry,
                openerNode: null,
                onMenuSelected: (_) {},
              ),
            ),
          ),
        ),
      );
    }

    await tester.pumpWidget(buildLayout(SettingsCategoryId.general));

    final generalDetailsFinder = find.byKey(
      const Key('settings-details-general'),
    );
    expect(generalDetailsFinder, findsOneWidget);
    final generalDetailsElement = tester.element(generalDetailsFinder);

    await tester.pumpWidget(buildLayout(SettingsCategoryId.liveStreaming));
    await tester.pump();

    final liveDetailsFinder = find.byKey(
      const Key('settings-details-liveStreaming'),
    );
    expect(find.byKey(const Key('settings-details-general')), findsNothing);
    expect(liveDetailsFinder, findsOneWidget);
    expect(
      tester.element(liveDetailsFinder),
      isNot(same(generalDetailsElement)),
    );
    expect(
      find.byKey(const Key('settings-preference-liveStreaming-0')),
      findsOneWidget,
    );
  });

  testWidgets('places details section header directly below the header', (
    tester,
  ) async {
    final nodes = _SettingsTestNodes();
    addTearDown(nodes.dispose);

    await tester.pumpWidget(
      _SettingsBlocScope(
        child: MaterialApp(
          home: Scaffold(
            body: SizedBox(
              width: 960,
              height: 540,
              child: SettingsLayout(
                state: const SettingsState(
                  loadStatus: SettingsLoadStatus.ready,
                  saveStatus: SettingsSaveStatus.failure,
                ),
                menuNode: nodes.menuNode,
                detailsNode: nodes.detailsNode,
                panelNode: nodes.panelNode,
                menuFirstNode: nodes.menuFirstNode,
                detailsFirstNode: nodes.detailsFirstNode,
                focusRegistry: nodes.focusRegistry,
                openerNode: null,
                onMenuSelected: (_) {},
              ),
            ),
          ),
        ),
      ),
    );

    final detailsFinder = find.byType(SettingsDetailsSection);
    final headerFinder = find
        .descendant(
          of: detailsFinder,
          matching: find.byType(TvListHeader),
        )
        .first;
    final sectionHeaderFinder = find.descendant(
      of: detailsFinder,
      matching: find.byType(TvListSectionHeader),
    );

    expect(
      tester.getTopLeft(sectionHeaderFinder).dy,
      tester.getBottomLeft(headerFinder).dy,
    );
    expect(
      find.descendant(of: detailsFinder, matching: find.byType(Divider)),
      findsNothing,
    );
  });
}

final class _SettingsTestNodes {
  final menuNode = FocusScopeNode();
  final detailsNode = FocusScopeNode();
  final panelNode = FocusScopeNode();
  final menuFirstNode = FocusNode();
  final detailsFirstNode = FocusNode();
  final focusRegistry = SettingsFocusRegistry();

  void dispose() {
    menuNode.dispose();
    detailsNode.dispose();
    panelNode.dispose();
    menuFirstNode.dispose();
    detailsFirstNode.dispose();
    focusRegistry.dispose();
  }
}

class _SettingsBlocScope extends StatefulWidget {
  const _SettingsBlocScope({
    required this.child,
  });

  final Widget child;

  @override
  State<_SettingsBlocScope> createState() => _SettingsBlocScopeState();
}

class _SettingsBlocScopeState extends State<_SettingsBlocScope> {
  late final SettingsBloc _bloc = SettingsBloc(
    preferencesRepository: const _FakeSettingsPreferencesRepository(),
    updateRepository: const _FakeSettingsUpdateRepository(),
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _bloc,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    unawaited(_bloc.close());
    super.dispose();
  }
}

final class _FakeSettingsPreferencesRepository
    implements SettingsPreferencesRepository {
  const _FakeSettingsPreferencesRepository();

  @override
  Future<SettingsPreferences> read() async {
    return defaultSettingsPreferences;
  }

  @override
  Future<void> save(SettingsPreferences preferences) async {}
}

final class _FakeSettingsUpdateRepository implements SettingsUpdateRepository {
  const _FakeSettingsUpdateRepository();

  @override
  Future<SettingsUpdateInfo> fetchLatestRelease() async {
    return const _FakeSettingsUpdateInfo(tagName: 'v0.0.0');
  }
}

final class _FakeSettingsUpdateInfo implements SettingsUpdateInfo {
  const _FakeSettingsUpdateInfo({
    required this.tagName,
  });

  @override
  final String tagName;

  @override
  String get body => '';
}
