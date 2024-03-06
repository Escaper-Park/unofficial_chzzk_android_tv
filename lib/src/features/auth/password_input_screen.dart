import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../common/widgets/base_scaffold.dart';
import './widgets/naver_login_headless_webview.dart';

class PasswordInputScreen extends HookWidget {
  const PasswordInputScreen({
    super.key,
    required this.id,
  });

  final String id;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      useTextField: true,
      verticalPadding: 100.0,
      body: NaverLoginHeadlessWebView(id: id),
    );
  }
}
