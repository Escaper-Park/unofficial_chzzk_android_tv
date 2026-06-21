import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/keyboard/keyboard.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/auth_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/auth_screen_string.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/bloc/auth_screen_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/view/sections/form/auth_form_section.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/view/sections/keyboard/auth_keyboard_overlay.dart';

void main() {
  testWidgets('renders auth form actions and masked password', (tester) async {
    final bloc = AuthScreenBloc();
    final nodes = _AuthFormNodes();
    addTearDown(bloc.close);
    addTearDown(nodes.dispose);

    await _pumpAuthForm(
      tester,
      bloc: bloc,
      nodes: nodes,
      state: const AuthScreenState(
        naverId: 'viewer',
        password: 'secret',
        activeInput: AuthInputField.password,
      ),
    );

    expect(find.text(AuthScreenString.title), findsOneWidget);
    expect(find.text(AuthScreenString.showPassword), findsOneWidget);
    expect(find.text(AuthScreenString.reloadPage), findsOneWidget);
    expect(find.text(AuthScreenString.login), findsOneWidget);
    expect(find.text('viewer'), findsOneWidget);
    expect(find.text('*****t'), findsOneWidget);
    expect(find.byKey(const Key('tv-text-field-cursor')), findsOneWidget);
    expect(find.text(AuthScreenString.passwordDescription), findsOneWidget);
    expect(find.text(AuthScreenString.idDescription), findsNothing);
    _expectInputsFillRow(
      tester,
      const [
        Key('auth-id-field'),
        Key('auth-password-field'),
      ],
    );

    await tester.tap(find.text(AuthScreenString.showPassword));
    await tester.pump();

    expect(bloc.state.isPasswordVisible, true);
  });

  testWidgets('renders full-width inputs with captcha', (
    tester,
  ) async {
    final bloc = AuthScreenBloc();
    final nodes = _AuthFormNodes();
    addTearDown(bloc.close);
    addTearDown(nodes.dispose);

    await _pumpAuthForm(
      tester,
      bloc: bloc,
      nodes: nodes,
      state: const AuthScreenState(
        isCaptchaRequired: true,
        activeInput: AuthInputField.captcha,
        captcha: '1234',
      ),
    );

    expect(find.byKey(const Key('auth-captcha-field')), findsOneWidget);
    expect(find.text(AuthScreenString.captchaSubject), findsOneWidget);
    expect(find.text(AuthScreenString.captchaDescription), findsOneWidget);
    expect(find.text(AuthScreenString.idDescription), findsNothing);
    expect(find.text(AuthScreenString.passwordDescription), findsNothing);
    expect(find.text('1234'), findsOneWidget);

    final idWidth = tester
        .getSize(find.byKey(const Key('auth-id-field')))
        .width;
    final passwordWidth = tester
        .getSize(find.byKey(const Key('auth-password-field')))
        .width;
    final captchaWidth = tester
        .getSize(find.byKey(const Key('auth-captcha-field')))
        .width;

    expect(idWidth, closeTo(passwordWidth, 0.1));
    expect(passwordWidth, closeTo(captchaWidth, 0.1));
    _expectInputsFillRow(
      tester,
      const [
        Key('auth-id-field'),
        Key('auth-password-field'),
        Key('auth-captcha-field'),
      ],
    );
  });

  testWidgets('autofocuses keyboard when keyboard starts open', (
    tester,
  ) async {
    final bloc = AuthScreenBloc();
    final keyboardCubit = TvKeyboardCubit(
      initialInputMode: TvKeyboardInputMode.english,
    );
    final nodes = _AuthFormNodes();
    addTearDown(bloc.close);
    addTearDown(keyboardCubit.close);
    addTearDown(nodes.dispose);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: BlocProvider.value(
            value: bloc,
            child: Stack(
              children: [
                AuthFormSection(
                  state: const AuthScreenState(isKeyboardOpen: true),
                  inputFocusNodes: nodes.inputFocusNodes,
                  actionSectionNode: nodes.actionSectionNode,
                  inputSectionNode: nodes.inputSectionNode,
                  keyboardSectionNode: nodes.keyboardSectionNode,
                ),
                AuthKeyboardOverlay(
                  sectionNode: nodes.keyboardSectionNode,
                  cubit: keyboardCubit,
                ),
              ],
            ),
          ),
        ),
      ),
    );
    await tester.pump();

    await tester.sendKeyEvent(LogicalKeyboardKey.enter);
    await tester.pump();

    expect(keyboardCubit.state.value, 'q');
  });

  testWidgets('active input can restore focus to its exact field node', (
    tester,
  ) async {
    final bloc = AuthScreenBloc();
    final nodes = _AuthFormNodes();
    addTearDown(bloc.close);
    addTearDown(nodes.dispose);

    await _pumpAuthForm(
      tester,
      bloc: bloc,
      nodes: nodes,
      state: const AuthScreenState(
        activeInput: AuthInputField.password,
        isKeyboardOpen: false,
      ),
    );

    nodes.inputFocusNodes.forInput(AuthInputField.password).requestFocus();
    await tester.pump();

    expect(nodes.inputFocusNodes.password.hasFocus, isTrue);
    expect(nodes.inputFocusNodes.naverId.hasFocus, isFalse);
    expect(nodes.inputFocusNodes.captcha.hasFocus, isFalse);
  });
}

Future<void> _pumpAuthForm(
  WidgetTester tester, {
  required AuthScreenBloc bloc,
  required _AuthFormNodes nodes,
  required AuthScreenState state,
}) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(
        body: BlocProvider.value(
          value: bloc,
          child: AuthFormSection(
            state: state,
            inputFocusNodes: nodes.inputFocusNodes,
            actionSectionNode: nodes.actionSectionNode,
            inputSectionNode: nodes.inputSectionNode,
            keyboardSectionNode: nodes.keyboardSectionNode,
          ),
        ),
      ),
    ),
  );
}

final class _AuthFormNodes {
  final actionSectionNode = FocusScopeNode(debugLabel: 'test auth actions');
  final inputSectionNode = FocusScopeNode(debugLabel: 'test auth inputs');
  final keyboardSectionNode = FocusScopeNode(debugLabel: 'test auth keyboard');
  late final inputFocusNodes = AuthInputFocusNodes(
    naverId: FocusNode(debugLabel: 'test auth id input'),
    password: FocusNode(debugLabel: 'test auth password input'),
    captcha: FocusNode(debugLabel: 'test auth captcha input'),
  );

  void dispose() {
    inputFocusNodes.naverId.dispose();
    inputFocusNodes.password.dispose();
    inputFocusNodes.captcha.dispose();
    actionSectionNode.dispose();
    inputSectionNode.dispose();
    keyboardSectionNode.dispose();
  }
}

void _expectInputsFillRow(WidgetTester tester, List<Key> fieldKeys) {
  final rowRect = tester.getRect(find.byKey(const Key('auth-input-row')));
  final fieldRects = [
    for (final key in fieldKeys) tester.getRect(find.byKey(key)),
  ];

  expect(fieldRects.first.left, closeTo(rowRect.left, 0.1));
  expect(fieldRects.last.right, closeTo(rowRect.right, 0.1));

  final fieldWidth = fieldRects.fold<double>(
    0,
    (sum, rect) => sum + rect.width,
  );
  final gapWidth = AuthScreenDesign.inputGap * (fieldRects.length - 1);
  expect(fieldWidth + gapWidth, closeTo(rowRect.width, 0.1));

  for (var index = 0; index < fieldRects.length - 1; index += 1) {
    final gap = fieldRects[index + 1].left - fieldRects[index].right;
    expect(gap, closeTo(AuthScreenDesign.inputGap, 0.1));
  }
}
