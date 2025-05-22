import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart'
    show AppRoute, FilterType, ClipOrderType;
import '../../../utils/dio/dio_client.dart';
import '../../../utils/extensions/custom_extensions.dart';

import '../../category/model/category.dart';
import '../../clip/model/clip.dart';
import '../../clip/model/clip_response.dart';
import '../../clip/repository/clip_repository.dart';
import '../../user/controller/private_user_blocks_controller.dart';

part 'category_clip_controller.g.dart';

@riverpod
class CategoryClipController extends _$CategoryClipController {
  late ClipRepository _repository;
  late List<String> _privateUserBlocks;

  CategoryClipNext? _next;

  @override
  FutureOr<List<NaverClip>?> build({
    required Category category,
    required FilterType filterType,
    required ClipOrderType orderType,
  }) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = ClipRepository(dio);
    _privateUserBlocks =
        await ref.watch(privateUserBlocksControllerProvider.future);

    return await _fetch();
  }

  Future<List<NaverClip>?> _fetch() async {
    final response = await _repository.getCategoryClipResponse(
      categoryType: category.categoryType,
      categoryId: category.categoryId,
      filterType: filterType.value,
      orderType: orderType.value,
      size: 10,
      clipUID: null,
      readCount: null,
    );

    _next = response?.page?.next;

    return _filterBlockedNaverClips(response?.data);
  }

  Future<void> fetchMore() async {
    if (_next == null) return;
    ref.setFetchMoreLoading(AppRoute.categoryDetail.routeName, true);

    final prev = state.value;

    state = await AsyncValue.guard(
      () async {
        final response = await _repository.getCategoryClipResponse(
          categoryType: category.categoryType,
          categoryId: category.categoryId,
          filterType: filterType.value,
          orderType: orderType.value,
          size: 10,
          clipUID: _next!.clipUID,
          readCount: _next!.readCount,
        );

        _next = response?.page?.next;

        if (response?.data == null) return [...prev!];
        final filteredNewClips = _filterBlockedNaverClips(response?.data) ?? [];

        ref.setFetchMoreLoading(AppRoute.categoryDetail.routeName, false);
        return [...prev!, ...filteredNewClips];
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
