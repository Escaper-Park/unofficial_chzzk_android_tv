import 'package:flutter/material.dart';

import '../constants/styles.dart';

class CustomTextFormField extends StatelessWidget {
  /// Wrap this [CustomTextformfield] with [Form] for using [Hooks].
  ///
  /// For example, if you use both sigle and multiple [CustomTextFormFiled]
  /// you have to wrap the 'all' [CustomTextFormField] with
  /// a [Form] with a single [GlobalKey].
  const CustomTextFormField({
    super.key,
    required this.controller,
    required this.focusNode,
    this.autofocus = false,
    this.fontSize = 14.0,
    this.contentVPadding = 10.0,
    this.contentHPadding = 20.0,
    this.borderRadius = 100.0,
    this.borderWidth = 1.0,
    this.borderColor = AppColors.chzzkColor,
    this.isObscure = false,
    this.enableSuggestion = false,
    this.suffixIcon,
    this.hintText,
    this.hintTextColor,
    this.validator,
    this.onFieldSubmitted,
    this.isActivate = true,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final bool autofocus;

  // Font
  final double fontSize;

  // Padding
  final double contentVPadding; // vertical padding
  final double contentHPadding; // horizontal padding

  // Border
  final double borderRadius;
  final double borderWidth;
  final Color borderColor;

  // Hiding Password
  final bool isObscure;
  final Widget? suffixIcon;

  // Hint
  final String? hintText;
  final Color? hintTextColor;

  final bool enableSuggestion;

  // Validator
  final String? Function(String?)? validator;

  // After clicking submit button
  final Function(String)? onFieldSubmitted;

  // When login is in progress, this should be a false.
  final bool isActivate;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: !isActivate,
      focusNode: focusNode,
      autocorrect: false,
      autofocus: autofocus,
      canRequestFocus: true,
      controller: controller,
      textInputAction: TextInputAction.next,
      enableIMEPersonalizedLearning: false,
      // Set this to true for avoiding 'Korean' input bug in Android 10
      enableSuggestions: enableSuggestion,
      obscureText: isObscure,
      decoration: InputDecoration(
        isDense: true,
        counterText: '', // Remove counter
        contentPadding: EdgeInsets.symmetric(
          vertical: contentVPadding,
          horizontal: contentHPadding,
        ),
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: borderWidth,
            // color: AppColors.greyColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: borderWidth,
            color: AppColors.greyColor,
            // color: borderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: borderWidth,
            color: AppColors.redColor,
          ),
        ),
        errorStyle: const TextStyle(height: 0.0),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: borderWidth,
            color: borderColor,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: borderWidth,
            // color: borderColor,
          ),
        ),
      ),
      validator: validator,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}
