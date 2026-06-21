import 'package:flutter/widgets.dart';

import '../../auth_screen_design.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    required this.form,
    required this.webView,
  });

  final Widget form;
  final Widget webView;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final formWidth = AuthScreenDesign.gridSpanWidth(
          availableWidth: constraints.maxWidth,
          span: AuthScreenDesign.formColumnSpan,
        );
        final webViewWidth = AuthScreenDesign.gridSpanWidth(
          availableWidth: constraints.maxWidth,
          span: AuthScreenDesign.webViewColumnSpan,
        );

        return SizedBox.expand(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                width: formWidth,
                child: form,
              ),
              const SizedBox(width: AuthScreenDesign.columnGap),
              SizedBox(
                width: webViewWidth,
                child: webView,
              ),
            ],
          ),
        );
      },
    );
  }
}
