import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/custom_text_form_field.dart';
import '../../../utils/focus/dpad_widget.dart';
import '../../../utils/focus/focus_utils.dart';
import '../../../utils/router/app_router.dart';

class SearchTextField extends HookConsumerWidget {
  const SearchTextField({
    super.key,
    required this.textInputFocusNode,
    this.goBackAction,
  });

  final FocusNode textInputFocusNode;
  final VoidCallback? goBackAction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController();
    final formKey = useMemoized(GlobalKey<FormState>.new, const []);
    useListenable(controller);

    final submitButtonFocusNode = useFocusNode();

    const String hintText = '검색어를 입력하세요';

    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: Dimensions.searchFormWidth,
        child: Form(
          key: formKey,
          child: Row(
            children: [
              Expanded(
                child: DpadWidget(
                  useKeyUpEvent: true,
                  actionCallbacks: {
                    DpadAction.arrowDown: () {
                      textInputFocusNode.requestFocus();
                    },
                    DpadAction.arrowLeft: () {
                      textInputFocusNode.requestFocus();
                    },
                    DpadAction.arrowRight: () {
                      textInputFocusNode.requestFocus();
                    },
                    DpadAction.arrowUp: () {
                      textInputFocusNode.requestFocus();
                    },
                    DpadAction.select: () {
                      FocusUtils.refreshFocus(textInputFocusNode);
                    },
                    DpadAction.goBack: () {
                      textInputFocusNode.unfocus();
                      if (goBackAction != null) goBackAction!();
                    }
                  },
                  child: CustomTextFormField(
                    autofocus: false,
                    controller: controller,
                    focusNode: textInputFocusNode,
                    hintText: hintText,
                    enableSuggestion: true,
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return hintText;
                      }
                      return null;
                    },
                    onFieldSubmitted: (_) {
                      FocusUtils.changeFocus(
                        currentFocus: textInputFocusNode,
                        nextFocus: submitButtonFocusNode,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                focusNode: submitButtonFocusNode,
                onPressed: () {
                  final bool? isValid = formKey.currentState?.validate();
                  if (isValid == true && context.mounted) {
                    textInputFocusNode.unfocus();

                    context.pushNamed(
                      AppRoute.searchResults.routeName,
                      queryParameters: {'keyword': controller.text},
                    );
                  }
                },
                child: const Text('검색'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
