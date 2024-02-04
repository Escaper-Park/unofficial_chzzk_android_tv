import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../constants/styles.dart';
import '../../../../utils/focus/focus_utils.dart';
import '../../../common/custom_outline_button.dart';
import '../../../common/custom_text_field.dart';
import '../../../common/dpad_widget.dart';

class SearchTextField extends HookWidget {
  const SearchTextField({
    super.key,
    required this.formKey,
    required this.searchController,
    required this.textFocusNode,
    required this.buttonFocusNode,
    required this.resultsFocusNode,
    required this.searchCallback,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController searchController;
  final FocusNode textFocusNode;
  final FocusNode buttonFocusNode;
  final FocusNode resultsFocusNode;
  final VoidCallback searchCallback;

  @override
  Widget build(BuildContext context) {
    final focusScopeNode = useFocusScopeNode();
    return Form(
      key: formKey,
      child: FocusScope(
        node: focusScopeNode,
        child: Row(
          children: [
            Expanded(
              child: DpadWidget(
                okCallback: () {
                  FocusUtils.changeFocus(
                    currentFocus: textFocusNode,
                    nextFocus: textFocusNode,
                  );
                },
                rightCallback: () {
                  FocusUtils.changeFocus(
                    currentFocus: textFocusNode,
                    nextFocus: buttonFocusNode,
                  );
                },
                downCallback: () {
                  FocusUtils.changeFocus(
                    currentFocus: textFocusNode,
                    nextFocus: resultsFocusNode,
                  );
                },
                child: CustomTextFormField(
                  autoFocus: true,
                  focusNode: textFocusNode,
                  controller: searchController,
                  hintText: '검색어를 입력해주세요',
                  onFieldSubmitted: (_) {
                    FocusUtils.changeFocus(
                      currentFocus: textFocusNode,
                      nextFocus: buttonFocusNode,
                    );
                  },
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return '';
                    }
                    return null;
                  },
                ),
              ),
            ),
            const SizedBox(width: 5.0),
            DpadWidget(
              okCallback: searchCallback,
              leftCallback: () {
                FocusUtils.changeFocus(
                  currentFocus: buttonFocusNode,
                  nextFocus: textFocusNode,
                );
              },
              downCallback: () {
                FocusUtils.changeFocus(
                  currentFocus: textFocusNode,
                  nextFocus: resultsFocusNode,
                );
              },
              child: CustomOutlineButton(
                padding: const EdgeInsets.all(8.0),
                onPressed: () {
                  // OK Button bugs.
                },
                focusNode: buttonFocusNode,
                child: const Icon(
                  Icons.search,
                  color: AppColors.greyColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
