import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../common/constants/dimensions.dart';
import '../../common/widgets/screen/adaptive_grid_view/adaptive_grid_view.dart'
    show AdaptiveGridViewWithAsyncValue;
import '../../common/widgets/ui/ui_widgets.dart' show HeaderText;
import '../../utils/extensions/custom_extensions.dart';
import '../../utils/image/image_utils.dart';
import '../dashboard/widgets/dashboard_widgets.dart'
    show InheritedSidebarFocusScope;
import 'category_event.dart';
import 'category_state.dart';
import 'model/category.dart';
import 'widgets/category_container.dart' show CategoryContainer;

part 'widgets/screen/category_body.dart';
part 'widgets/screen/category_grid_view.dart';
part 'widgets/screen/category_header.dart';

class CategoryScreen extends HookConsumerWidget with CategoryEvent {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sidebarFSN = InheritedSidebarFocusScope.of(context);
    final gridViewFSN = useFocusScopeNode();

    const int crossAxisCount = 5;
    const double crossAxisSpacing = 10.0;
    const double mainAxisSpacing = 10.0;
    const double horizontalPadding = 10.0;

    return _CategoryBody(
      horizontalPadding: horizontalPadding,
      categoryHeader: const _CategoryHeader(),
      categoryGridView: _CategoryGridView(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        horizontalPadding: horizontalPadding,
        sidebarFSN: sidebarFSN,
        gridViewFSN: gridViewFSN,
        pushCategoryDetail: (category) =>
            pushCategoryDetail(context, category: category),
        fetchMore: () async => await fetchMore(ref),
      ),
    );
  }
}
