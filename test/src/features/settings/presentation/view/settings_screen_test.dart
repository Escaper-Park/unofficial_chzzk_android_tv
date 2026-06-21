import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/ui.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_update_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_preferences_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_update_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/models/settings_preference_groups.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/settings_screen.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/view/layout/settings_layout.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/view/sections/details/settings_editor_panel.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/view/sections/menu/settings_menu_section.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/widgets/settings_position_icon.dart';

void main() {
  testWidgets('renders menu and home details', (tester) async {
    await tester.pumpWidget(const _SettingsHarness());
    await tester.pump();
    await tester.pump();

    expect(find.text('설정'), findsOneWidget);
    expect(find.text('일반'), findsWidgets);
    expect(find.text('라이브'), findsOneWidget);
    expect(find.text('멀티뷰'), findsOneWidget);
    expect(find.text('인기 VOD'), findsOneWidget);
    expect(find.text('기본값으로 되돌리기'), findsOneWidget);

    expect(
      tester
          .getTopLeft(find.byKey(const Key('settings-menu-liveStreaming')))
          .dy,
      lessThan(
        tester.getTopLeft(find.byKey(const Key('settings-menu-multiview'))).dy,
      ),
    );
    expect(
      tester.getTopLeft(find.byKey(const Key('settings-menu-multiview'))).dy,
      lessThan(
        tester
            .getTopLeft(find.byKey(const Key('settings-menu-vodStreaming')))
            .dy,
      ),
    );
  });

  testWidgets('toggle row saves immediately', (tester) async {
    final repository = _FakeSettingsPreferencesRepository();

    await tester.pumpWidget(_SettingsHarness(repository: repository));
    await tester.pump();
    await tester.pump();

    await tester.tap(find.text('인기 VOD'));
    await tester.pump();
    await tester.pump();

    expect(
      repository.savedPreferences.last.generalSetting.showPopularVod,
      1,
    );
  });

  testWidgets('select row opens a right-side option panel and saves', (
    tester,
  ) async {
    final repository = _FakeSettingsPreferencesRepository();

    await tester.pumpWidget(_SettingsHarness(repository: repository));
    await tester.pump();
    await tester.pump();

    await tester.ensureVisible(find.text('미리보기 대기 시간'));
    await tester.pump();

    await tester.tap(find.text('미리보기 대기 시간'));
    await tester.pump();
    await tester.pump();

    final panel15Seconds = find.descendant(
      of: find.byType(SettingsEditorPanel),
      matching: find.text('15초'),
    );

    expect(find.text('1초'), findsOneWidget);
    expect(panel15Seconds, findsOneWidget);

    await tester.ensureVisible(panel15Seconds);
    await tester.pump();

    await tester.tap(
      find.ancestor(
        of: panel15Seconds,
        matching: find.byType(GestureDetector),
      ),
    );
    await tester.pump();
    await tester.pump();

    expect(
      repository.savedPreferences.last.generalSetting.streamingPreviewSeconds,
      15,
    );
  });

  testWidgets('slider editor centers the value label', (tester) async {
    final repository = _FakeSettingsPreferencesRepository();
    final bloc = SettingsBloc(
      preferencesRepository: repository,
      updateRepository: const _FakeSettingsUpdateRepository(),
    );
    final panelNode = FocusScopeNode(debugLabel: 'test settings panel');
    addTearDown(panelNode.dispose);
    addTearDown(bloc.close);

    final item = SettingsPreferenceItem(
      title: 'Slider',
      description: 'Slider setting',
      optionSet: settingsRangeOptionSet(min: 0, max: 100),
      read: (_) => 50,
      write: (preferences, _) => preferences,
      label: (value) => '$value%',
    );

    await tester.pumpWidget(
      BlocProvider.value(
        value: bloc,
        child: MaterialApp(
          home: Material(
            child: SizedBox(
              width: 400,
              height: 320,
              child: SettingsEditorPanel(
                ref: const SettingsPreferenceRef(
                  category: SettingsCategoryId.chat,
                  index: 0,
                ),
                item: item,
                panelNode: panelNode,
                openerNode: null,
              ),
            ),
          ),
        ),
      ),
    );

    final labelCenter = tester.getCenter(find.text('50%'));
    final sliderCenter = tester.getCenter(find.byType(Slider));

    expect(labelCenter.dx, closeTo(sliderCenter.dx, 0.1));
  });

  testWidgets('quick chat position slider shows a direction icon', (
    tester,
  ) async {
    final repository = _FakeSettingsPreferencesRepository();
    final bloc = SettingsBloc(
      preferencesRepository: repository,
      updateRepository: const _FakeSettingsUpdateRepository(),
    );
    final panelNode = FocusScopeNode(debugLabel: 'test settings panel');
    final ref = _refFor(SettingsCategoryId.chat, '오버레이 채팅 빠른 위치');
    final item = settingsPreferencesFor(ref.category)[ref.index];
    addTearDown(panelNode.dispose);
    addTearDown(bloc.close);

    await tester.pumpWidget(
      BlocProvider.value(
        value: bloc,
        child: MaterialApp(
          home: Material(
            child: SizedBox(
              width: 400,
              height: 320,
              child: SettingsEditorPanel(
                ref: ref,
                item: item,
                panelNode: panelNode,
                openerNode: null,
              ),
            ),
          ),
        ),
      ),
    );

    expect(find.byIcon(Icons.east), findsOneWidget);
    expect(find.text('우측 중단'), findsOneWidget);

    final iconRect = tester.getRect(find.byIcon(Icons.east));
    final previewRect = tester.getRect(find.byType(SettingsPositionIcon));
    expect(iconRect.center.dx, greaterThan(previewRect.center.dx));
  });

  test('chat settings keep side position before side width', () {
    final preferences = settingsPreferencesFor(SettingsCategoryId.chat);

    final sidePositionIndex = preferences.indexWhere(
      (preference) => preference.title == '사이드 채팅 위치',
    );
    final sideWidthIndex = preferences.indexWhere(
      (preference) => preference.title == '사이드 채팅 너비',
    );

    expect(sidePositionIndex, greaterThanOrEqualTo(0));
    expect(sideWidthIndex, greaterThanOrEqualTo(0));
    expect(sidePositionIndex, lessThan(sideWidthIndex));
  });

  test('quick chat position writes the matching overlay coordinates', () {
    final ref = _refFor(SettingsCategoryId.chat, '오버레이 채팅 빠른 위치');
    final item = settingsPreferencesFor(ref.category)[ref.index];

    final preferences = item.writeNormalized(defaultSettingsPreferences, 6);

    expect(preferences.chatSettings.overlayChatQuickPositionIndex, 6);
    expect(preferences.chatSettings.overlayChatPositionX, 0);
    expect(preferences.chatSettings.overlayChatPositionY, 100);
  });

  test('manual overlay coordinates update quick position display index', () {
    final ref = _refFor(SettingsCategoryId.chat, '오버레이 채팅 가로 위치');
    final item = settingsPreferencesFor(ref.category)[ref.index];

    final preferences = item.writeNormalized(defaultSettingsPreferences, 0);

    expect(preferences.chatSettings.overlayChatPositionX, 0);
    expect(preferences.chatSettings.overlayChatPositionY, 50);
    expect(preferences.chatSettings.overlayChatQuickPositionIndex, 3);
  });

  test('streaming preview duration uses indexed duration options', () {
    final ref = _refFor(SettingsCategoryId.general, '미리보기 지속 시간');
    final item = settingsPreferencesFor(ref.category)[ref.index];

    expect(
      defaultSettingsPreferences.generalSetting.streamingPreviewDurationIndex,
      2,
    );
    expect(item.label(0), '10초');
    expect(item.label(1), '15초');
    expect(item.label(2), '30초');
    expect(item.label(3), '60초');
    expect(item.label(4), '계속보기');

    final preferences = item.writeNormalized(defaultSettingsPreferences, 4);

    expect(preferences.generalSetting.streamingPreviewDurationIndex, 4);
  });

  test('multiview PIP size uses a 50 percent maximum', () {
    final ref = _refFor(SettingsCategoryId.multiview, '멀티뷰 PIP 크기');
    final item = settingsPreferencesFor(ref.category)[ref.index];

    expect(item.optionSet.values.first, 20);
    expect(item.optionSet.values.last, 50);

    final preferences = item.writeNormalized(defaultSettingsPreferences, 50);

    expect(preferences.liveSettings.multiviewPipSize, 50);
  });

  test('multiview PIP layout defaults to vertical', () {
    final ref = _refFor(SettingsCategoryId.multiview, '멀티뷰 PIP 배치');
    final item = settingsPreferencesFor(ref.category)[ref.index];

    expect(defaultSettingsPreferences.liveSettings.multiviewPipLayoutIndex, 1);
    expect(item.optionSet.values, [0, 1]);
    expect(item.label(0), '가로');
    expect(item.label(1), '세로');

    final preferences = item.writeNormalized(defaultSettingsPreferences, 0);

    expect(preferences.liveSettings.multiviewPipLayoutIndex, 0);
  });

  test('multiview screen mode defaults to PBP', () {
    final ref = _refFor(SettingsCategoryId.multiview, '멀티뷰 화면 모드');
    final item = settingsPreferencesFor(ref.category)[ref.index];

    expect(defaultSettingsPreferences.liveSettings.multiviewScreenModeIndex, 0);
    expect(item.optionSet.values, [0, 1, 2]);
    expect(item.label(0), 'PBP');
    expect(item.label(1), 'PIP');
    expect(item.label(2), '포커스');

    final preferences = item.writeNormalized(defaultSettingsPreferences, 2);

    expect(preferences.liveSettings.multiviewScreenModeIndex, 2);
  });

  test('multiview chat window uses live chat option order', () {
    final ref = _refFor(SettingsCategoryId.multiview, '멀티뷰 채팅창');
    final item = settingsPreferencesFor(ref.category)[ref.index];

    expect(item.optionSet.values, [0, 1, 2]);
    expect(item.label(0), '끄기');
    expect(item.label(1), '오버레이');
    expect(item.label(2), '사이드');
  });

  test('multiview maximum count and chat positions use requested defaults', () {
    final maxRef = _refFor(SettingsCategoryId.multiview, '멀티뷰 최대 개수');
    final maxItem = settingsPreferencesFor(maxRef.category)[maxRef.index];
    final xRef = _refFor(SettingsCategoryId.multiview, '멀티뷰 채팅 가로 위치');
    final xItem = settingsPreferencesFor(xRef.category)[xRef.index];
    final yRef = _refFor(SettingsCategoryId.multiview, '멀티뷰 채팅 세로 위치');
    final yItem = settingsPreferencesFor(yRef.category)[yRef.index];

    expect(defaultSettingsPreferences.liveSettings.multiviewMaxCount, 2);
    expect(defaultSettingsPreferences.liveSettings.multiviewChatPositionX, 0);
    expect(defaultSettingsPreferences.liveSettings.multiviewChatPositionY, 50);
    expect(maxItem.optionSet.values, [2, 3, 4]);
    expect(maxItem.label(2), '2');

    var preferences = maxItem.writeNormalized(defaultSettingsPreferences, 4);
    preferences = xItem.writeNormalized(preferences, 100);
    preferences = yItem.writeNormalized(preferences, 0);

    expect(preferences.liveSettings.multiviewMaxCount, 4);
    expect(preferences.liveSettings.multiviewChatPositionX, 100);
    expect(preferences.liveSettings.multiviewChatPositionY, 0);
  });

  testWidgets('slider editor saves on key up only', (tester) async {
    final repository = _FakeSettingsPreferencesRepository();
    final bloc = SettingsBloc(
      preferencesRepository: repository,
      updateRepository: const _FakeSettingsUpdateRepository(),
    );
    final panelNode = FocusScopeNode(debugLabel: 'test settings panel');
    final ref = _sliderRefFor(SettingsCategoryId.general);
    final item = settingsPreferencesFor(ref.category)[ref.index];
    addTearDown(panelNode.dispose);
    addTearDown(bloc.close);

    await tester.pumpWidget(
      BlocProvider.value(
        value: bloc,
        child: MaterialApp(
          home: Material(
            child: SizedBox(
              width: 400,
              height: 320,
              child: BlocBuilder<SettingsBloc, SettingsState>(
                bloc: bloc,
                builder: (context, state) {
                  return SettingsEditorPanel(
                    ref: ref,
                    item: item,
                    panelNode: panelNode,
                    openerNode: null,
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.sendKeyDownEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump();

    expect(
      bloc.state.preferences.generalSetting.overlayControlsDisplayTime,
      16,
    );
    expect(repository.savedPreferences, isEmpty);
    await tester.pump(const Duration(milliseconds: 600));
    expect(repository.savedPreferences, isEmpty);

    await tester.sendKeyUpEvent(LogicalKeyboardKey.arrowRight);
    await tester.pump(const Duration(milliseconds: 600));

    expect(
      repository
          .savedPreferences
          .last
          .generalSetting
          .overlayControlsDisplayTime,
      16,
    );
  });

  testWidgets('slider value changes do not rebuild the full settings layout', (
    tester,
  ) async {
    await tester.pumpWidget(const _SettingsHarness());
    await tester.pump();
    await tester.pump();

    final context = tester.element(find.byType(SettingsLayout));
    final bloc = context.read<SettingsBloc>();
    final ref = _sliderRefFor(SettingsCategoryId.general);
    final layoutBefore = tester.widget<SettingsLayout>(
      find.byType(SettingsLayout),
    );

    bloc.add(SettingsEvent.sliderChanged(ref: ref, value: 20));
    await tester.pump();

    expect(
      tester.widget<SettingsLayout>(find.byType(SettingsLayout)),
      same(layoutBefore),
    );
    expect(
      bloc.state.preferences.generalSetting.overlayControlsDisplayTime,
      20,
    );
  });

  testWidgets('select editor uses rounded checkboxes', (tester) async {
    final repository = _FakeSettingsPreferencesRepository();
    final bloc = SettingsBloc(
      preferencesRepository: repository,
      updateRepository: const _FakeSettingsUpdateRepository(),
    );
    final panelNode = FocusScopeNode(debugLabel: 'test settings panel');
    addTearDown(panelNode.dispose);
    addTearDown(bloc.close);

    final item = SettingsPreferenceItem(
      title: 'Select',
      description: 'Select setting',
      optionSet: settingsResolutionOptionSet,
      read: (_) => 2,
      write: (preferences, _) => preferences,
      label: (value) => 'Option $value',
    );

    await tester.pumpWidget(
      BlocProvider.value(
        value: bloc,
        child: MaterialApp(
          home: Material(
            child: SizedBox(
              width: 400,
              height: 320,
              child: SettingsEditorPanel(
                ref: const SettingsPreferenceRef(
                  category: SettingsCategoryId.liveStreaming,
                  index: 0,
                ),
                item: item,
                panelNode: panelNode,
                openerNode: null,
              ),
            ),
          ),
        ),
      ),
    );

    final checkboxes = tester.widgetList<TvCheckbox>(find.byType(TvCheckbox));

    expect(checkboxes, isNotEmpty);
    expect(
      checkboxes.every((checkbox) {
        return checkbox.shape == TvCheckboxShape.rounded;
      }),
      isTrue,
    );
  });

  testWidgets('select editor scrolls focused option into view', (
    tester,
  ) async {
    final repository = _FakeSettingsPreferencesRepository();
    final bloc = SettingsBloc(
      preferencesRepository: repository,
      updateRepository: const _FakeSettingsUpdateRepository(),
    );
    final panelNode = FocusScopeNode(debugLabel: 'test settings panel');
    addTearDown(panelNode.dispose);
    addTearDown(bloc.close);

    final item = SettingsPreferenceItem(
      title: 'Long select',
      description: 'Long select setting',
      optionSet: SettingsPreferenceOptionSet(
        values: List<int>.generate(12, (index) => index),
        controlType: SettingsPreferenceControlType.select,
      ),
      read: (_) => 0,
      write: (preferences, _) => preferences,
      label: (value) => 'Option $value',
    );
    const ref = SettingsPreferenceRef(
      category: SettingsCategoryId.liveStreaming,
      index: 0,
    );
    final lastOptionKey = ValueKey(
      'settings-option-${ref.category.name}-${ref.index}-11',
    );

    await tester.pumpWidget(
      BlocProvider.value(
        value: bloc,
        child: MaterialApp(
          home: Material(
            child: SizedBox(
              width: 400,
              height: 320,
              child: SettingsEditorPanel(
                ref: ref,
                item: item,
                panelNode: panelNode,
                openerNode: null,
              ),
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    final scrollable = find.descendant(
      of: find.byType(SettingsEditorPanel),
      matching: find.byType(Scrollable),
    );
    expect(scrollable, findsOneWidget);
    expect(
      tester.getRect(find.byKey(lastOptionKey)).top,
      greaterThan(tester.getRect(scrollable).bottom),
    );

    final lastOptionFocus = tester
        .widgetList<Focus>(
          find.descendant(
            of: find.byKey(lastOptionKey),
            matching: find.byType(Focus),
          ),
        )
        .where((focus) => focus.focusNode?.canRequestFocus ?? false)
        .single;
    lastOptionFocus.focusNode!.requestFocus();
    await tester.pump();
    for (var frame = 0; frame < 5; frame += 1) {
      await tester.pump(const Duration(milliseconds: 50));
    }

    final optionRect = tester.getRect(find.byKey(lastOptionKey));
    final viewportRect = tester.getRect(scrollable);
    expect(optionRect.top, greaterThanOrEqualTo(viewportRect.top));
    expect(optionRect.bottom, lessThanOrEqualTo(viewportRect.bottom + 0.1));
  });

  testWidgets('selected menu item does not trigger selection', (tester) async {
    final firstFocusNode = FocusNode(debugLabel: 'test settings menu first');
    final selectedCategories = <SettingsCategoryId>[];
    addTearDown(firstFocusNode.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Material(
          child: SizedBox(
            width: 480,
            height: 640,
            child: SettingsMenuSection(
              selectedCategory: SettingsCategoryId.general,
              firstFocusNode: firstFocusNode,
              onSelected: selectedCategories.add,
            ),
          ),
        ),
      ),
    );

    await tester.tap(_menuButton(SettingsCategoryId.general));
    await tester.pump();

    expect(selectedCategories, isEmpty);

    await tester.tap(_menuButton(SettingsCategoryId.liveStreaming));
    await tester.pump();

    expect(selectedCategories, [SettingsCategoryId.liveStreaming]);
  });

  testWidgets('back from details restores focus to the selected menu item', (
    tester,
  ) async {
    await tester.pumpWidget(const _SettingsHarness());
    await tester.pump();
    await tester.pump();

    final multiviewMenuFocus = _menuFocusNode(
      tester,
      SettingsCategoryId.multiview,
    )..requestFocus();
    await tester.pump();

    await tester.tap(_menuButton(SettingsCategoryId.multiview));
    await tester.pump();
    await tester.pump();

    expect(
      FocusManager.instance.primaryFocus?.debugLabel,
      contains('settings details first item'),
    );

    await tester.binding.handlePopRoute();
    await tester.pump();

    expect(multiviewMenuFocus.hasFocus, isTrue);
  });

  testWidgets('release notes body renders outside the list item subtitle', (
    tester,
  ) async {
    const releaseBody = '''
변경 사항
- 업데이트 화면의 릴리스 노트 가독성 개선
- 긴 본문을 별도 영역에 표시
''';

    await tester.pumpWidget(
      const _SettingsHarness(
        updateRepository: _FakeSettingsUpdateRepository(
          latestRelease: _FakeSettingsUpdateInfo(
            tagName: 'v0.4.2',
            body: releaseBody,
          ),
        ),
      ),
    );
    await tester.pump();
    await tester.pump();

    await tester.tap(_menuButton(SettingsCategoryId.updates));
    await tester.pump();
    await tester.pump();

    await tester.tap(find.text('최신 버전 확인'));
    await tester.pump();
    await tester.pump();

    expect(
      find.byKey(const ValueKey('settings-release-notes')),
      findsOneWidget,
    );
    expect(
      find.byKey(const ValueKey('settings-release-notes-body')),
      findsOneWidget,
    );
    expect(find.text(releaseBody.trim()), findsOneWidget);
    expect(
      find.descendant(
        of: find.byKey(const ValueKey('settings-release-notes')),
        matching: find.text(releaseBody.trim()),
      ),
      findsNothing,
    );
  });
}

Finder _menuButton(SettingsCategoryId category) {
  return find.descendant(
    of: find.byKey(ValueKey('settings-menu-${category.name}')),
    matching: find.byType(GestureDetector),
  );
}

FocusNode _menuFocusNode(WidgetTester tester, SettingsCategoryId category) {
  return tester
      .widgetList<Focus>(
        find.descendant(
          of: find.byKey(ValueKey('settings-menu-${category.name}')),
          matching: find.byType(Focus),
        ),
      )
      .where((focus) => focus.focusNode?.canRequestFocus ?? false)
      .single
      .focusNode!;
}

SettingsPreferenceRef _sliderRefFor(SettingsCategoryId category) {
  final items = settingsPreferencesFor(category);
  final index = items.indexWhere((item) {
    return item.optionSet.controlType == SettingsPreferenceControlType.slider;
  });
  if (index < 0) {
    fail('Missing slider settings preference: $category');
  }

  return SettingsPreferenceRef(category: category, index: index);
}

SettingsPreferenceRef _refFor(SettingsCategoryId category, String title) {
  final items = settingsPreferencesFor(category);
  final index = items.indexWhere((item) => item.title == title);
  if (index < 0) {
    fail('Missing settings preference: $title');
  }

  return SettingsPreferenceRef(category: category, index: index);
}

class _SettingsHarness extends StatelessWidget {
  const _SettingsHarness({
    this.repository,
    this.updateRepository,
  });

  final SettingsPreferencesRepository? repository;
  final SettingsUpdateRepository? updateRepository;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<SettingsPreferencesRepository>.value(
          value: repository ?? _FakeSettingsPreferencesRepository(),
        ),
        RepositoryProvider<SettingsUpdateRepository>.value(
          value: updateRepository ?? const _FakeSettingsUpdateRepository(),
        ),
      ],
      child: const MaterialApp(
        home: Material(
          child: SettingsScreen(),
        ),
      ),
    );
  }
}

final class _FakeSettingsPreferencesRepository
    implements SettingsPreferencesRepository {
  _FakeSettingsPreferencesRepository();

  SettingsPreferences preferences = defaultSettingsPreferences;
  final savedPreferences = <SettingsPreferences>[];

  @override
  Future<SettingsPreferences> read() async {
    return preferences;
  }

  @override
  Future<void> save(SettingsPreferences preferences) async {
    this.preferences = preferences;
    savedPreferences.add(preferences);
  }
}

final class _FakeSettingsUpdateRepository implements SettingsUpdateRepository {
  const _FakeSettingsUpdateRepository({
    this.latestRelease = const _FakeSettingsUpdateInfo(
      tagName: 'v0.4.1+1',
      body: '',
    ),
  });

  final SettingsUpdateInfo latestRelease;

  @override
  Future<SettingsUpdateInfo> fetchLatestRelease() async {
    return latestRelease;
  }
}

final class _FakeSettingsUpdateInfo implements SettingsUpdateInfo {
  const _FakeSettingsUpdateInfo({
    required this.tagName,
    required this.body,
  });

  @override
  final String tagName;

  @override
  final String body;
}
