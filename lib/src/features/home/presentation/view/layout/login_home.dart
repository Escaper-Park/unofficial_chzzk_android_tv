import 'package:flutter/widgets.dart';

import '../../../../category/domain/entities/category_item.dart';
import '../../../../live/domain/entities/live_feed.dart';
import '../../../../vod/domain/entities/vod_feed.dart';
import '../../bloc/home_bloc.dart';
import '../shared/home_focus_registry.dart';
import 'home_layout.dart';

class LoginHome extends StatelessWidget {
  const LoginHome({
    super.key,
    required this.state,
    required this.focusRegistry,
    required this.scrollController,
    required this.onRetry,
    required this.onLivePressed,
    required this.onVodPressed,
    required this.onCategoryPressed,
    required this.onSectionMorePressed,
  });

  final HomeState state;
  final HomeFocusRegistry focusRegistry;
  final ScrollController scrollController;
  final VoidCallback onRetry;
  final ValueChanged<Live> onLivePressed;
  final ValueChanged<Vod> onVodPressed;
  final ValueChanged<CategoryItem> onCategoryPressed;
  final ValueChanged<HomeSectionId> onSectionMorePressed;

  @override
  Widget build(BuildContext context) {
    return HomeLayout(
      state: state,
      focusRegistry: focusRegistry,
      scrollController: scrollController,
      onRetry: onRetry,
      onLivePressed: onLivePressed,
      onVodPressed: onVodPressed,
      onCategoryPressed: onCategoryPressed,
      onSectionMorePressed: onSectionMorePressed,
    );
  }
}
