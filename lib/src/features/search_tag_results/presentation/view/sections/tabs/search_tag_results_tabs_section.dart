import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../bloc/search_tag_results_bloc.dart';
import '../../../search_tag_results_screen_string.dart';

class SearchTagResultsSortAction extends StatelessWidget {
  const SearchTagResultsSortAction({
    super.key,
    required this.state,
    required this.onPressed,
  });

  final SearchTagResultsState state;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TvTabActionButton(
      text: SearchTagResultsScreenString.sortLabel(state),
      icon: Icons.tune_rounded,
      onPressed: onPressed,
    );
  }
}
