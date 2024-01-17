import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CustomTextFormField extends StatelessWidget {
  /// Wrap this [CustomTextformfield] with [Form] for using [Hooks].
  ///
  /// For example, if you use both sigle and multiple [CustomTextFormFiled]
  /// you have to wrap the 'all' [CustomTextFormField] with
  /// a [Form] with a single [GlobalKey].
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.focusNode,
    this.autoFocus = false,
    this.textInputAction,
    this.borderRadius = 100.0,
    this.borderWidth = 1.0,
    this.borderColor,
    // this.borderColor = const Color(0xFF303133),
    this.contentVPadding = 10.0,
    this.contentHPadding = 20.0,
    this.keyboardType = TextInputType.text,
    this.isObscure = false,
    this.suffixIcon,
    this.fontSize = 14.0,
    this.hintText,
    this.hintTextColor,
    // this.hintTextColor = const Color(0xFF585859),
    this.validator,
    this.onChanged,
    this.onFieldSubmitted,
  });

  final TextEditingController controller;
  // Focus
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final bool autoFocus;

  // Font
  final double fontSize;

  // Border
  final double borderRadius;
  final double borderWidth;
  final Color? borderColor;

  // Padding
  final double contentVPadding; // vertical padding
  final double contentHPadding; // horizontal padding

  final TextInputType keyboardType;

  // Hiding Password
  final bool isObscure;
  final Widget? suffixIcon;

  // Hint
  final String? hintText;
  final Color? hintTextColor;

  // Validator
  final String? Function(String?)? validator;

  // OnChanged
  final Function(String)? onChanged;
  // After clicking submit button
  final Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autoFocus,
      focusNode: focusNode,
      controller: controller,
      autocorrect: false,
      textCapitalization: TextCapitalization.none,
      enableSuggestions: false,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      obscureText: isObscure,
      style: TextStyle(fontSize: fontSize),
      decoration: InputDecoration(
        isDense: true,
        counterText: '', // Remove counter
        contentPadding: EdgeInsets.symmetric(
          vertical: contentVPadding,
          horizontal: contentHPadding,
        ),
        suffixIcon: suffixIcon,
        // Hint Styles
        hintText: hintText,
        // hintStyle: TextStyle(
        //   color: hintTextColor,
        // ),
        // Error Styles
        // Border Styles
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: borderWidth,
            // color: borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: borderWidth,
            // color: borderColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: borderWidth,
            // color: borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide(
            width: borderWidth,
            // color: borderColor,
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
      onChanged: onChanged,
      onFieldSubmitted: onFieldSubmitted,
    );
  }
}

class PasswordTextFormField extends HookWidget {
  const PasswordTextFormField({
    super.key,
    required this.passwordController,
    this.focusNode,
    this.onFieldSubmitted,
    this.validator,
  });

  final TextEditingController passwordController;
  final FocusNode? focusNode;
  final Function(String)? onFieldSubmitted;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    // If isObscure is true, hide password.
    final isObscure = useState<bool>(true);

    return CustomTextFormField(
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      textInputAction: TextInputAction.next,
      controller: passwordController,
      isObscure: isObscure.value,
      validator: validator,
      hintText: '비밀번호를 입력해주세요.',
      suffixIcon: IconButton(
        icon: isObscure.value
            ? const Icon(Icons.visibility)
            : const Icon(Icons.visibility_off),
        onPressed: () {
          isObscure.value = !isObscure.value;
        },
      ),
    );
  }
}
