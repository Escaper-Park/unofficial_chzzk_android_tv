import '../../../core/ui/ui.dart';
import 'view/sections/immersive/home_immersive_list_exports.dart';
import 'view/shared/home_card_focus_design.dart';
import 'view/shared/home_category_card_design.dart';

abstract final class HomeScreenDesign {
  static const sectionGap = 36.0;
  static const sectionTitleBottomGap = 14.0;
  static const sectionHorizontalPadding = 58.0;
  static const scrollBottomPadding = 24.0;
  static const verticalScrollDuration = Duration(milliseconds: 150);
  static const verticalScrollAlignment = 0.6;
  static const focusedCardElevation = HomeCardFocusDesign.elevation;
  static const focusedCardShadowColor = HomeCardFocusDesign.shadowColor;

  static double get categoryRailHeight {
    return HomeCategoryCardDesign.height;
  }

  static double get immersiveHeight {
    return HomeImmersiveListDesign.layoutHeight;
  }

  static double get mediaRailHeight {
    return TvMediaCardDesign.cardHeight(TvMediaCardDesign.width);
  }

  static double get mediaRailItemExtent {
    return TvMediaCardDesign.width.value;
  }

  static double get categoryRailItemExtent {
    return HomeCategoryCardDesign.width.value;
  }
}
