part of 'auth_screen.dart';

Widget _authScreenContent({
  required AuthScreenState state,
  required AuthInputFocusNodes inputFocusNodes,
  required FocusScopeNode actionSectionNode,
  required FocusScopeNode inputSectionNode,
  required FocusScopeNode keyboardSectionNode,
  required WebViewController webViewController,
  required TvKeyboardCubit? keyboardCubit,
}) {
  return Stack(
    children: [
      Padding(
        padding: AuthScreenDesign.framePadding,
        child: AuthLayout(
          form: AuthFormSection(
            state: state,
            inputFocusNodes: inputFocusNodes,
            actionSectionNode: actionSectionNode,
            inputSectionNode: inputSectionNode,
            keyboardSectionNode: state.isKeyboardOpen
                ? keyboardSectionNode
                : null,
          ),
          webView: AuthWebViewSection(
            controller: webViewController,
            loading: state.isPageLoading,
          ),
        ),
      ),
      if (state.isKeyboardOpen && keyboardCubit != null)
        AuthKeyboardOverlay(
          sectionNode: keyboardSectionNode,
          cubit: keyboardCubit,
        ),
    ],
  );
}
