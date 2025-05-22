import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../common/constants/enums.dart' show DpadAction;
import '../../../common/widgets/dpad/dpad_widgets.dart'
    show DpadActionWidget, createScrollBindings;

class UpdateLogMarkdown extends HookWidget {
  const UpdateLogMarkdown({
    super.key,
    required this.log,
    required this.focusNode,
    required this.settingMenuFSN,
  });

  final String log;
  final FocusNode focusNode;
  final FocusScopeNode settingMenuFSN;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    final extraBinding = {
      DpadAction.arrowLeft: () => settingMenuFSN.requestFocus(),
    };
    final bindings =
        createScrollBindings(scrollController, extraBindings: extraBinding);

    return DpadActionWidget(
      autofocus: true,
      focusNode: focusNode,
      useFocusedBorder: true,
      dpadActionCallbacks: bindings,
      useKeyRepeatEvent: true,
      child: Markdown(
        controller: scrollController,
        data: log,
      ),
    );
  }
}
