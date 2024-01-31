import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/focus/focus_utils.dart';
import '../../../common/custom_text_field.dart';
import '../../../common/dpad_widget.dart';
import 'login_with_headless_webview.dart';

class NaverLogin extends StatelessWidget {
  const NaverLogin({
    super.key,
    required this.formKey,
    required this.idController,
    required this.passwordController,
    required this.idFocusNode,
    required this.passwordFocusNode,
    required this.suffixIconFocusNode,
    required this.confirmFocusNode,
    required this.cancelFocusNode,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController idController;
  final TextEditingController passwordController;

  final FocusNode idFocusNode;
  final FocusNode passwordFocusNode;
  final FocusNode suffixIconFocusNode;
  final FocusNode confirmFocusNode;
  final FocusNode cancelFocusNode;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ID
          DpadWidget(
            upCallback: () {
              // move to cancel
              FocusUtils.changeFocus(
                currentFocus: idFocusNode,
                nextFocus: cancelFocusNode,
              );
            },
            downCallback: () {
              // move to password
              FocusUtils.changeFocus(
                currentFocus: idFocusNode,
                nextFocus: passwordFocusNode,
              );
            },
            returnCallback: () {
              // unfocus
            },
            okCallback: () {
              // re-focus
              FocusUtils.changeFocus(
                currentFocus: idFocusNode,
                nextFocus: idFocusNode,
              );
            },
            child: CustomTextFormField(
              autoFocus: true,
              focusNode: idFocusNode,
              controller: idController,
              onFieldSubmitted: (term) {
                FocusUtils.changeFocus(
                  currentFocus: idFocusNode,
                  nextFocus: passwordFocusNode,
                );
              },
              hintText: '네이버 아이디를 입력해주세요.',
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return '아이디를 입력해주세요.';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 10.0),
          // Password
          DpadWidget(
            returnCallback: () {
              // unfocus
              FocusScope.of(context).unfocus();
            },
            okCallback: () {
              // re-focus
              FocusUtils.changeFocus(
                currentFocus: passwordFocusNode,
                nextFocus: passwordFocusNode,
              );
            },
            rightCallback: () {
              // move to suffix
              FocusUtils.changeFocus(
                currentFocus: passwordFocusNode,
                nextFocus: suffixIconFocusNode,
              );
            },
            downCallback: () {
              // move to confirm
              FocusUtils.changeFocus(
                currentFocus: passwordFocusNode,
                nextFocus: confirmFocusNode,
              );
            },
            upCallback: () {
              // move to id
              FocusUtils.changeFocus(
                currentFocus: passwordFocusNode,
                nextFocus: idFocusNode,
              );
            },
            child: PasswordTextFormField(
              passwordController: passwordController,
              passwordfocusNode: passwordFocusNode,
              suffixIconFocusNode: suffixIconFocusNode,
              onFieldSubmitted: (_) {
                passwordFocusNode.unfocus();
                confirmFocusNode.requestFocus();
              },
              validator: (value) {
                if (value != null && value.isEmpty) {
                  return '비밀번호를 입력해주세요.';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 10.0),
          // Login Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cancel
              DpadWidget(
                returnCallback: () {
                  // unfocus
                  FocusScope.of(context).unfocus();
                },
                downCallback: () {
                  // move to id
                  FocusUtils.changeFocus(
                    currentFocus: cancelFocusNode,
                    nextFocus: idFocusNode,
                  );
                },
                rightCallback: () {
                  // move to confirm
                  FocusUtils.changeFocus(
                    currentFocus: cancelFocusNode,
                    nextFocus: confirmFocusNode,
                  );
                },
                upCallback: () {
                  // move to password
                  FocusUtils.changeFocus(
                    currentFocus: cancelFocusNode,
                    nextFocus: passwordFocusNode,
                  );
                },
                child: ElevatedButton(
                  focusNode: cancelFocusNode,
                  onPressed: () {
                    if (context.mounted) context.pop();
                  },
                  child: const Text('취소'),
                ),
              ),
              const SizedBox(width: 10.0),
              // Login Buttons With Headless WebView
              DpadWidget(
                returnCallback: () {
                  // unfocus
                  FocusScope.of(context).unfocus();
                },
                downCallback: () {
                  // move to id
                  FocusUtils.changeFocus(
                    currentFocus: confirmFocusNode,
                    nextFocus: idFocusNode,
                  );
                },
                leftCallback: () {
                  // move to cancel
                  FocusUtils.changeFocus(
                    currentFocus: confirmFocusNode,
                    nextFocus: cancelFocusNode,
                  );
                },
                upCallback: () {
                  // move to password
                  FocusUtils.changeFocus(
                    currentFocus: confirmFocusNode,
                    nextFocus: passwordFocusNode,
                  );
                },
                child: LoginWithHeadlessWebView(
                  formKey: formKey,
                  focusNode: confirmFocusNode,
                  id: idController.text,
                  password: passwordController.text,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
