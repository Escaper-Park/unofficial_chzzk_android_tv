import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart'
    show AppRoute, FilterType, ClipOrderType;
import '../../../utils/extensions/custom_extensions.dart';
import '../../category/model/category.dart';
import '../../clip/model/clip.dart';
import '../../clip/model/clip_response.dart';
import '../../clip/repository/clip_repository_wrapper.dart';
import '../../user/controller/private_user_blocks_controller.dart';

part 'category_clip_controller.g.dart';

@riverpod
class CategoryClipController extends _$CategoryClipController {
  late ClipRepositoryWrapper _repository;
  late List<String> _privateUserBlocks;

  CategoryClipNext? _next;

  @override
  FutureOr<List<NaverClip>?> build({
    required Category category,
    required FilterType filterType,
    required ClipOrderType orderType,
  }) async {
    _repository = ref.watch(clipRepositoryWrapperProvider);
    _privateUserBlocks =
        await ref.watch(privateUserBlocksControllerProvider.future);

    return await _fetch();
  }

  Future<List<NaverClip>?> _fetch() async {
    final result = await _repository.getCategoryClips(
      categoryType: category.categoryType,
      categoryId: category.categoryId,
      filterType: filterType.value,
      orderType: orderType.value,
      size: 10,
      clipUID: null,
      readCount: null,
    );

    return result.when(
      success: (response) {
        _next = response?.page?.next;
        return _filterBlockedNaverClips(response?.data);
      },
      failure: (_) => null,
    );
  }

  Future<void> fetchMore() async {
    if (_next == null) return;
    ref.setFetchMoreLoading(AppRoute.categoryDetail.routeName, true);

    final prev = state.value;

    state = await AsyncValue.guard(
      () async {
        final result = await _repository.getCategoryClips(
          categoryType: category.categoryType,
          categoryId: category.categoryId,
          filterType: filterType.value,
          orderType: orderType.value,
          size: 10,
          clipUID: _next!.clipUID,
          readCount: _next!.readCount,
        );

        return result.when(
          success: (response) {
            _next = response?.page?.next;
            ref.setFetchMoreLoading(AppRoute.categoryDetail.routeName, false);
            if (response?.data == null) return [...prev!];
            final filteredNewClips =
                _filterBlockedNaverClips(response?.data) ?? [];
            return [...prev!, ...filteredNewClips];
          },
          failure: (_) {
            ref.setFetchMoreLoading(AppRoute.categoryDetail.routeName, false);
            return [...prev!];
          },
        );
      },
    );
  }

  List<NaverClip>? _filterBlockedNaverClips(List<NaverClip>? clips) {
    if (clips == null) return null;
    return clips
        .where((clip) => !_privateUserBlocks.contains(clip.ownerChannelId))
        .toList();
  }
}
