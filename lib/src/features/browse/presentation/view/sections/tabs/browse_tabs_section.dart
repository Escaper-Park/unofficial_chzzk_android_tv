import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../bloc/browse_bloc.dart';
import '../../../browse_screen_string.dart';

class BrowseSortAction extends StatelessWidget {
  const BrowseSortAction({
    super.key,
    required this.state,
    required this.onPressed,
  });

  final BrowseState state;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TvTabActionButton(
      text: BrowseScreenString.sortLabel(state),
      icon: Icons.tune_rounded,
      onPressed: onPressed,
    );
  }
}
