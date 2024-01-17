import 'package:flutter/material.dart';

import '../../../common/custom_text_field.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.formKey,
    required this.controller,
    required this.searchFieldFocusNode,
    this.onFieldSubmitted,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController controller;
  final FocusNode searchFieldFocusNode;
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: CustomTextFormField(
        autoFocus: true,
        focusNode: searchFieldFocusNode,
        controller: controller,
        onFieldSubmitted: onFieldSubmitted,
        hintText: '검색어를 입력해주세요.',
        validator: (value) {
          if (value != null && value.isEmpty) {
            return '검색어를 입력해주세요.';
          }
          return null;
        },
      ),
    );
  }
}
