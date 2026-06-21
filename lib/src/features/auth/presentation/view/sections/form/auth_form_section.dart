import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/tv/focus/focus.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../auth_screen_design.dart';
import '../../../auth_screen_string.dart';
import '../../../auth_screen_ui_mapper.dart';
import '../../../bloc/auth_screen_bloc.dart';

part 'auth_form_actions.dart';
part 'auth_form_inputs.dart';

class AuthFormSection extends StatelessWidget {
  const AuthFormSection({
    super.key,
    required this.state,
    required this.inputFocusNodes,
    required this.actionSectionNode,
    required this.inputSectionNode,
    required this.keyboardSectionNode,
  });

  final AuthScreenState state;
  final AuthInputFocusNodes inputFocusNodes;
  final FocusScopeNode actionSectionNode;
  final FocusScopeNode inputSectionNode;
  final FocusScopeNode? keyboardSectionNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AuthScreenDesign.formTopInset),
        Text(
          AuthScreenString.title,
          style: AuthScreenDesign.titleStyle(context),
        ),
        const SizedBox(height: AuthScreenDesign.titleGap),
        Text(
          AuthScreenString.subtitle,
          style: AuthScreenDesign.subtitleStyle(context),
        ),
        const SizedBox(height: AuthScreenDesign.sectionGap),
        SizedBox(
          height: AuthScreenDesign.statusMinHeight,
          child: Text(
            AuthScreenUiMapper.description(state),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AuthScreenDesign.statusStyle(context),
          ),
        ),
        const SizedBox(height: AuthScreenDesign.sectionGap),
        TvFocusSection.list(
          node: actionSectionNode,
          down: inputSectionNode,
          child: const _AuthActionRow(),
        ),
        const SizedBox(height: AuthScreenDesign.sectionGap),
        TvFocusSection.list(
          node: inputSectionNode,
          up: actionSectionNode,
          down: keyboardSectionNode,
          child: _AuthInputRow(
            state: state,
            inputFocusNodes: inputFocusNodes,
          ),
        ),
      ],
    );
  }
}

final class AuthInputFocusNodes {
  const AuthInputFocusNodes({
    required this.naverId,
    required this.password,
    required this.captcha,
  });

  final FocusNode naverId;
  final FocusNode password;
  final FocusNode captcha;

  FocusNode forInput(AuthInputField input) {
    return switch (input) {
      AuthInputField.naverId => naverId,
      AuthInputField.password => password,
      AuthInputField.captcha => captcha,
    };
  }
}
