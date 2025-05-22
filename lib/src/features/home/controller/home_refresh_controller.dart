import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../following/controller/following_category_controller.dart';
import 'home_controller.dart';

part 'home_refresh_controller.g.dart';

@riverpod
class HomeRefreshController extends _$HomeRefreshController {
  @override
  void build() {
    return;
  }

  Future<void> refresh() async {
    await Future.wait([
      ref.read(homeFollowingLivesControllerProvider.notifier).refresh(),
      ref.read(followingCategoryControllerProvider.notifier).refresh(),
      ref.read(homePopularLivesControllerProvider.notifier).refresh(),
    ]);
  }
}
