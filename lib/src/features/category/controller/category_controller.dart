import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/shared_preferences/shared_prefs.dart';
import '../../auth/controller/auth_controller.dart';
import '../../live/model/live.dart';
import '../../live/repository/live_repository.dart';
import '../../vod/model/vod.dart';
import '../../vod/repository/vod_repository.dart';
import '../model/category.dart';
import '../repository/category_repository.dart';

part 'category_controller.g.dart';

@riverpod
class CategoryController extends _$CategoryController {
  Options? _options;
  final int _size = 20;
  CategoryPage? _next;

  @override
  FutureOr<List<Category>?> build() async {
    final auth = await ref.read(authControllerProvider.future);

    _options = auth?.getOptions();

    return await _initFetch(_next);
  }

  Future<List<Category>?> _initFetch(CategoryPage? next) async {
    final CategoryResponse? response =
        await ref.watch(categoryRepositoryProvider).getCategoryResponse(
              categoryId: next?.categoryId,
              concurrentUserCount: next?.concurrentUserCount,
              openLiveCount: next?.openLiveCount,
              options: _options,
              size: _size,
            );

    _next = response?.page;

    return response?.categories ?? [];
  }

  Future<void> fetchMore() async {
    if (_next != null) {
      final prev = state.value;

      state = await AsyncValue.guard(() async {
        final response =
            await ref.watch(categoryRepositoryProvider).getCategoryResponse(
                  categoryId: _next!.categoryId,
                  concurrentUserCount: _next!.concurrentUserCount,
                  openLiveCount: _next!.openLiveCount,
                  size: 10,
                );

        _next = response?.page;

        if (response?.categories == null || _next == null) {
          return [...prev!];
        }

        return [...prev!, ...response!.categories!];
      });
    }
  }
}

@riverpod
class FavoriteCategoriesController extends _$FavoriteCategoriesController {
  late CategoryLocalRepository _categoryLocalRepository;

  @override
  FutureOr<List<Category>> build() async {
    final SharedPreferences sharedPreferences = ref.read(sharedPrefsProvider);

    _categoryLocalRepository = CategoryLocalRepository(sharedPreferences);

    return fetchFavoriteCategories();
  }

  Future<List<Category>> fetchFavoriteCategories() async {
    final localFavorites = _categoryLocalRepository.getFavoriteCategories();

    final favorites = await ref
        .watch(categoryRepositoryProvider)
        .getFavoriteCategories(favorites: localFavorites);

    favorites.sort(
      (a, b) => b.concurrentUserCount.compareTo(a.concurrentUserCount),
    );

    return favorites;
  }

  Future<void> toggleFavorite({required Category category}) async {
    final categoryString = '${category.categoryType}/${category.categoryId}';

    await _categoryLocalRepository.setFavoriteCategories(categoryString);

    state = await AsyncValue.guard(() async {
      return fetchFavoriteCategories();
    });
  }
}

enum CategoryItem {
  live,
  vod,
}

@riverpod
class CurrentCategoryItem extends _$CurrentCategoryItem {
  @override
  CategoryItem build() {
    return CategoryItem.live;
  }

  void setState(CategoryItem item) {
    if (state != item) state = item;
  }
}

@riverpod
class CategoryLiveController extends _$CategoryLiveController {
  Options? _options;
  LivePage? _next;

  @override
  FutureOr<List<LiveDetail>?> build({required Category category}) async {
    final auth = await ref.read(authControllerProvider.future);

    _options = auth?.getOptions();

    return await _initFetch();
  }

  Future<List<LiveDetail>?> _initFetch() async {
    final LiveResponse? liveResponse =
        await ref.watch(categoryRepositoryProvider).getCategoryLiveResponses(
              category: category,
              next: _next,
              options: _options,
            );

    _next = liveResponse?.page;

    return liveResponse?.liveDetails ?? [];
  }

  Future<void> fetchMore() async {
    if (_next != null) {
      final prev = state.value;

      // Show Loading State in Category Lives Page
      ref.read(categoryLoadingStateProvider.notifier).setState(true);

      state = await AsyncValue.guard(() async {
        final response = await ref
            .watch(categoryRepositoryProvider)
            .getCategoryLiveResponses(
              category: category,
              next: _next,
              options: _options,
            );

        _next = response?.page;

        if (response?.liveDetails == null || _next == null) {
          // Show Loading State in Category Lives Page
          ref.read(categoryLoadingStateProvider.notifier).setState(false);

          return [...prev!];
        }

        ref.read(categoryLoadingStateProvider.notifier).setState(false);
        return [...prev!, ...response!.liveDetails!];
      });
    }
  }

  Future<LiveDetail?> getLiveDetail(final String channelId) async {
    try {
      return await ref.watch(liveRepositoryProvider).getLiveDetail(
            channelId: channelId,
            options: _options,
          );
    } catch (_) {
      return null;
    }
  }
}

@riverpod
class CategoryVodController extends _$CategoryVodController {
  Options? _options;
  VodPage? _next;

  @override
  FutureOr<List<Vod>?> build({required Category category}) async {
    final auth = await ref.read(authControllerProvider.future);

    _options = auth?.getOptions();

    return await _initFetch();
  }

  Future<List<Vod>?> _initFetch() async {
    final VodResponse? vodResponse =
        await ref.watch(categoryRepositoryProvider).getCategoryVodResponse(
              category: category,
              next: _next,
              options: _options,
            );

    _next = vodResponse?.page;

    return vodResponse?.vods ?? [];
  }

  Future<void> fetchMore() async {
    if (_next != null) {
      final prev = state.value;

      // Show Loading State in Category Vods Page
      ref.read(categoryLoadingStateProvider.notifier).setState(true);

      state = await AsyncValue.guard(() async {
        final response =
            await ref.watch(categoryRepositoryProvider).getCategoryVodResponse(
                  category: category,
                  next: _next,
                  options: _options,
                );

        _next = response?.page;

        if (response?.vods == null || _next == null) {
          // Show Loading State in Category Vods Page
          ref.read(categoryLoadingStateProvider.notifier).setState(false);

          return [...prev!];
        }

        ref.read(categoryLoadingStateProvider.notifier).setState(false);
        return [...prev!, ...response!.vods!];
      });
    }
  }

  Future<String?> getVodPath({required int videoNo}) async {
    return await ref.watch(vodRepositoryProvider).getVodPath(
          videoNo: videoNo,
          options: _options,
        );
  }
}

@riverpod
class CategoryLoadingState extends _$CategoryLoadingState {
  @override
  bool build() {
    return false;
  }

  void setState(bool value) {
    state = value;
  }
}
