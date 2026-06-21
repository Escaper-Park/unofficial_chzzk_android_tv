import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/auth_screen_design.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/presentation/view/layout/auth_layout.dart';

void main() {
  testWidgets('uses 8 and 4 debug-grid column spans', (tester) async {
    tester.view.physicalSize = const Size(960, 540);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 844,
            height: 472,
            child: AuthLayout(
              form: ColoredBox(
                key: Key('auth-layout-form'),
                color: Colors.red,
              ),
              webView: ColoredBox(
                key: Key('auth-layout-webview'),
                color: Colors.blue,
              ),
            ),
          ),
        ),
      ),
    );

    const availableWidth = 844.0;
    final formSize = tester.getSize(find.byKey(const Key('auth-layout-form')));
    final webViewSize = tester.getSize(
      find.byKey(const Key('auth-layout-webview')),
    );
    final formRight = tester.getTopRight(
      find.byKey(const Key('auth-layout-form')),
    );
    final webViewLeft = tester.getTopLeft(
      find.byKey(const Key('auth-layout-webview')),
    );

    final expectedFormWidth = AuthScreenDesign.gridSpanWidth(
      availableWidth: availableWidth,
      span: AuthScreenDesign.formColumnSpan,
    );
    final expectedWebViewWidth = AuthScreenDesign.gridSpanWidth(
      availableWidth: availableWidth,
      span: AuthScreenDesign.webViewColumnSpan,
    );

    expect(AuthScreenDesign.gridColumnCount, 12);
    expect(AuthScreenDesign.gridColumnWidth(availableWidth), 52);
    expect(AuthScreenDesign.columnGap, 20);
    expect(AuthScreenDesign.formColumnSpan, 8);
    expect(AuthScreenDesign.webViewColumnSpan, 4);
    expect(expectedFormWidth, 556);
    expect(expectedWebViewWidth, 268);
    expect(formSize.width, expectedFormWidth);
    expect(formSize.height, 472);
    expect(webViewSize.width, expectedWebViewWidth);
    expect(webViewSize.height, 472);
    expect(webViewLeft.dx - formRight.dx, AuthScreenDesign.columnGap);
  });
}
