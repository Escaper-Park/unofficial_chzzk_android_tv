import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/tv/input/input.dart';
import '../../../../../core/ui/ui.dart';
import '../../home_screen_string.dart';
import 'home_category_card_design.dart';
import 'home_rail_more_card_design.dart';

part 'home_rail_more_card_frame.dart';
part 'home_rail_more_card_label.dart';

enum HomeRailMoreCardVariant {
  media,
  category,
}

class HomeRailMoreCard extends StatelessWidget {
  const HomeRailMoreCard.media({
    super.key,
    required this.onPressed,
    this.autofocus = false,
    this.focusedElevation = TvCardElevation.level2,
    this.focusedShadowColor,
  }) : variant = HomeRailMoreCardVariant.media;

  const HomeRailMoreCard.category({
    super.key,
    required this.onPressed,
    this.autofocus = false,
    this.focusedElevation = HomeCategoryCardDesign.focusedElevation,
    this.focusedShadowColor = HomeCategoryCardDesign.focusedShadowColor,
  }) : variant = HomeRailMoreCardVariant.category;

  final HomeRailMoreCardVariant variant;
  final VoidCallback onPressed;
  final bool autofocus;
  final TvCardElevation focusedElevation;
  final Color? focusedShadowColor;

  @override
  Widget build(BuildContext context) {
    final size = _size;

    return _HomeRailMoreCardFrame(
      width: size.width,
      height: size.height,
      autofocus: autofocus,
      focusedElevation: focusedElevation,
      focusedShadowColor: focusedShadowColor,
      onPressed: onPressed,
    );
  }

  Size get _size {
    return switch (variant) {
      HomeRailMoreCardVariant.media => Size(
        TvMediaCardDesign.width.value,
        TvMediaCardDesign.cardHeight(TvMediaCardDesign.width),
      ),
      HomeRailMoreCardVariant.category => Size(
        HomeCategoryCardDesign.width.value,
        HomeCategoryCardDesign.height,
      ),
    };
  }
}
