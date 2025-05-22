import 'package:flutter/material.dart';

import '../../../common/widgets/ui/ui_widgets.dart' show RoundedContainer;
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/ui/focused_outlined_button.dart';
import '../model/category.dart';
import 'category_widgets.dart' show CategoryInfoCard, CategoryPoster;

part 'category_container/category_container_body.dart';

class CategoryContainer extends StatelessWidget {
  /// Category container with a size that adapts to the size of the screen.
  const CategoryContainer({
    super.key,
    required this.autofocus,
    required this.focusNode,
    required this.category,
    required this.containerWidth,
    required this.containerHeight,
    required this.posterWidth,
    required this.posterHeight,
    required this.onPressed,
  });

  final bool autofocus;
  final FocusNode focusNode;
  final Category category;
  final double containerWidth;
  final double containerHeight;
  final double posterWidth;
  final double posterHeight;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      backgroundColor: AppColors.greyContainerColor,
      width: containerWidth,
      height: containerHeight,
      child: FocusedOutlinedButton(
        autofocus: autofocus,
        focusNode: focusNode,
        onPressed: onPressed,
        child: _CategoryContainerBody(
          categoryPoster: CategoryPoster(
            posterImageUrl: category.posterImageUrl,
            posterWidth: posterWidth,
            posterHeight: posterHeight,
          ),
          categoryInfoCard: CategoryInfoCard(category: category),
        ),
      ),
    );
  }
}
