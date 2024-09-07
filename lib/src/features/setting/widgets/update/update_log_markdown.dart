import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

import '../../../../common/widgets/dpad_widgets.dart';

class UpdateLogMarkdown extends HookWidget {
  const UpdateLogMarkdown({
    super.key,
    required this.settingMenuFSN,
    required this.log,
  });

  final FocusScopeNode settingMenuFSN;
  final String log;

  @override
  Widget build(BuildContext context) {
    final controller = useScrollController();
    final focusNode = useFocusNode();

    return DpadActionWidget(
      autofocus: true,
      focusNode: focusNode,
      borderRadius: 0.0,
      useKeyRepeatEvent: true,
      dpadActionCallbacks: {
        DpadAction.arrowDown: () {
          controller.jumpTo(controller.offset + 20.0);
        },
        DpadAction.arrowUp: () {
          controller.jumpTo(controller.offset - 20.0);
        },
        DpadAction.arrowLeft: () {
          settingMenuFSN.requestFocus();
        },
      },
      child: Markdown(
        padding: const EdgeInsets.all(10.0),
        controller: controller,
        data: log,
      ),
    );
  }
}
