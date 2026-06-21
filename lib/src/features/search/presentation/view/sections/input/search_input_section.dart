import 'package:flutter/material.dart';

import '../../../../../../core/tv/focus/focus.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../bloc/search_bloc.dart';
import '../../../search_screen_design.dart';
import '../../../search_screen_string.dart';

class SearchInputSection extends StatelessWidget {
  const SearchInputSection({
    super.key,
    required this.state,
    required this.inputNode,
    required this.tabsNode,
    required this.downNode,
    required this.onPressed,
  });

  final SearchState state;
  final FocusScopeNode inputNode;
  final FocusScopeNode tabsNode;
  final FocusScopeNode? downNode;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TvFocusSection.list(
      node: inputNode,
      up: tabsNode,
      down: downNode,
      downEnsureVisibleScope: downNode != null,
      child: TvTextField(
        value: state.query,
        hintText: SearchScreenString.inputHint(state.selectedTab),
        active: state.isKeyboardOpen,
        autofocus: !state.isKeyboardOpen,
        design: SearchScreenDesign.inputDesign(),
        onPressed: onPressed,
      ),
    );
  }
}
