part of '../../group_screen.dart';

class _GroupGenerateButton extends HookWidget {
  const _GroupGenerateButton({
    required this.groupIsEmpty,
    required this.itemNode,
    required this.belowFSN,
    required this.leftFSN,
    required this.pushGroupGenerate,
  });

  final bool groupIsEmpty;
  final FocusScopeNode itemNode;
  final FocusScopeNode belowFSN;
  final FocusScopeNode leftFSN;
  final VoidCallback pushGroupGenerate;

  @override
  Widget build(BuildContext context) {
    final genButtomFN = useFocusNode();

    return DpadFocusScopeNavigator(
      node: itemNode,
      dpadKeyNodeMap: groupIsEmpty
          ? {}
          : {
              DpadAction.arrowDown: belowFSN,
            },
      onFocusChange: (value) {
        if (value) genButtomFN.requestFocus();
      },
      child: _button(
        groupIsEmpty,
        true,
        genButtomFN,
        '그룹 만들기',
        pushGroupGenerate,
      ),
    );
  }

  Widget _button(
    bool autofocus,
    bool isFirstItem,
    FocusNode? focusNode,
    String buttonText,
    VoidCallback onPressed,
  ) {
    return DpadCallbackShortcuts(
      dpadKeyNodeMap: {},
      bindings: _createBindings(isFirstItem),
      child: RoundedContainer(
        width: Dimensions.groupGenerateButtonWidth,
        height: Dimensions.groupGenerateButtonHeight,
        child: FocusedOutlinedButton(
          autofocus: autofocus,
          focusNode: focusNode,
          padding: const EdgeInsets.all(10.0),
          backgroundColor: AppColors.greyContainerColor,
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 14.0,
              color: AppColors.whiteColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }

  ShortcutsBindings _createBindings(bool isFirstItem) {
    ShortcutsBindings bindings = {};

    bindings[const SingleActivator(LogicalKeyboardKey.arrowDown)] = () {
      belowFSN.requestFocus();
    };

    // Add up arrow binding for top row items
    if (isFirstItem) {
      bindings[const SingleActivator(LogicalKeyboardKey.arrowLeft)] = () {
        leftFSN.requestFocus();
      };
    }

    return bindings;
  }
}
