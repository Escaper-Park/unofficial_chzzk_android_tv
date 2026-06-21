import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../auth_screen_design.dart';

class AuthWebViewSection extends StatelessWidget {
  const AuthWebViewSection({
    super.key,
    required this.controller,
    required this.loading,
  });

  final WebViewController controller;
  final bool loading;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox.expand(
      child: DecoratedBox(
        decoration: AuthScreenDesign.webViewDecoration(colorScheme),
        child: ClipRRect(
          borderRadius: AuthScreenDesign.webViewRadius,
          child: Stack(
            children: [
              Focus(
                canRequestFocus: false,
                descendantsAreFocusable: false,
                descendantsAreTraversable: false,
                child: IgnorePointer(
                  child: WebViewWidget(controller: controller),
                ),
              ),
              if (loading)
                const Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: LinearProgressIndicator(minHeight: 2),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
