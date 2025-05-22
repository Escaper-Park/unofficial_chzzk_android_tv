import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show AppRoute, KeyboardLanguage;
import '../../common/widgets/screen/screen_widgets.dart';
import '../../common/widgets/ui/ui_widgets.dart';
import '../../utils/extensions/custom_extensions.dart';
import '../../utils/virtual_keyboard/virtual_keyboard.dart';

import 'group_generate_event.dart';

part 'widgets/screen/group_generate_body.dart';
part 'widgets/screen/group_generate_header.dart';
part 'widgets/screen/group_generate_input_field.dart';
part 'widgets/screen/group_generate_keyboard.dart';

class GroupGenerateScreen extends ConsumerWidget with GroupGenerateEvent {
  const GroupGenerateScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScopeScreen(
      onPopInvoked: (onPopInvokedHandler) {
        onPopInvokedHandler.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _GroupGenerateBody(
          header: HeaderText(
            text: '생성하려는 그룹 이름을 입력해 주세요',
          ),
          inputField: _GroupGenerateInputField(),
          keyboard: _GroupGenerateKeyboard(
            onEnterPressed: (groupName) =>
                generateGroup(ref, context, groupName: groupName),
          ),
        ),
      ),
    );
  }
}
