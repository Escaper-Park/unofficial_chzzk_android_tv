import 'package:flutter/material.dart';

import '../../../common/custom_text_field.dart';

class NaverLoginTextFormFields extends StatelessWidget {
  const NaverLoginTextFormFields({
    super.key,
    required this.formKey,
    required this.idFocusNode,
    required this.passwordFocusNode,
    required this.idController,
    required this.passwordController,
    required this.onPasswordFieldSubmitted,
  });

  final GlobalKey<FormState> formKey;
  final FocusNode idFocusNode;
  final FocusNode passwordFocusNode;
  final TextEditingController idController;
  final TextEditingController passwordController;
  final Function(String?) onPasswordFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          CustomTextFormField(
            focusNode: idFocusNode,
            autoFocus: true,
            controller: idController,
            onFieldSubmitted: (term) {
              idFocusNode.unfocus();
              FocusScope.of(context).requestFocus(passwordFocusNode);
            },
            hintText: '네이버 아이디를 입력해주세요.',
            validator: (value) {
              if (value != null && value.isEmpty) {
                return '아이디를 입력해주세요.';
              }
              return null;
            },
          ),
          const SizedBox(height: 12.0),
          PasswordTextFormField(
            focusNode: passwordFocusNode,
            onFieldSubmitted: onPasswordFieldSubmitted,
            passwordController: passwordController,
            validator: (value) {
              if (value != null && value.isEmpty) {
                return '비밀번호를 입력해주세요.';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
