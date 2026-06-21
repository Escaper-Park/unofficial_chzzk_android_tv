import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../bloc/category_detail_bloc.dart';
import '../../../category_detail_screen_ui_mapper.dart';

class CategoryDetailFollowAction extends StatelessWidget {
  const CategoryDetailFollowAction({
    super.key,
    required this.state,
    required this.onPressed,
  });

  final CategoryDetailState state;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TvTabActionButton(
      text: categoryDetailFollowLabel(state),
      icon: state.isFollowing
          ? Icons.favorite_rounded
          : Icons.favorite_border_rounded,
      enabled: state.canUseFollowAction,
      onPressed: onPressed,
    );
  }
}
