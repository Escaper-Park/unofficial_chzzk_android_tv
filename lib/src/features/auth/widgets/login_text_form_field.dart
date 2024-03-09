import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/custom_text_form_field.dart';
import '../../../utils/focus/dpad_widget.dart';
import '../../../utils/focus/focus_utils.dart';

class LoginTextFormField extends HookWidget {
  const LoginTextFormField({
    super.key,
    this.textEditingController,
    required this.textInputFocusNode,
    required this.buttonText,
    required this.hintText,
    required this.onPressed,
    this.initText,
    this.goBackAction,
    this.isObscure = false,
    this.autofocus = false,
    this.enableSuggestion = false,
  });

  final TextEditingController? textEditingController;
  final FocusNode textInputFocusNode;
  final String buttonText;
  final String hintText;
  final bool isObscure;
  final String? initText;
  final VoidCallback? goBackAction;
  final Function(String? text)? onPressed;
  final bool autofocus;
  final bool enableSuggestion;

  @override
  Widget build(BuildContext context) {
    final controller =
        textEditingController ?? useTextEditingController(text: initText);
    final formKey = useMemoized(GlobalKey<FormState>.new, const []);
    useListenable(controller);

    final submitButtonFocusNode = useFocusNode();

    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: Dimensions.loginFormContainerWidth,
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
                    autofocus: autofocus,
                    focusNode: textInputFocusNode,
                    controller: controller,
                    isObscure: isObscure,
                    hintText: hintText,
                    enableSuggestion: enableSuggestion,
                    onFieldSubmitted: (_) {
                      FocusUtils.changeFocus(
                        currentFocus: textInputFocusNode,
                        nextFocus: submitButtonFocusNode,
                      );
                    },
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return hintText;
                      }
                      return null;
                    },
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                focusNode: submitButtonFocusNode,
                // null check to de-active login button
                onPressed: onPressed == null
                    ? null
                    : () {
                        final bool? isValid = formKey.currentState?.validate();

                        if (isValid == true && context.mounted) {
                          textInputFocusNode.unfocus();

                          onPressed!(controller.text);
                        }
                      },
                child: Text(buttonText),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
