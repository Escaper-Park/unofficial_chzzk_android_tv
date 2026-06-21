import 'package:flutter/widgets.dart';

class AppShellNavigationBackdropNotification extends Notification {
  const AppShellNavigationBackdropNotification({
    required this.translucent,
  });

  final bool translucent;
}
