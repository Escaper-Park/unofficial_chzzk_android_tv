import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show AppRoute;
import '../../../utils/extensions/custom_extensions.dart';
import '../../category/model/category.dart';
import '../../category/repository/category_repository_wrapper.dart';
import '../../user/controller/private_user_blocks_controller.dart';
import '../../vod/model/vod.dart';
import '../../vod/model/vod_response.dart';

part 'category_vod_controller.g.dart';

@riverpod
class CategoryVodController extends _$CategoryVodController {
  late CategoryRepositoryWrapper _repository;
  late List<String> _privateUserBlocks;

  CategoryVodNext? _next;

  @override
  FutureOr<List<Vod>?> build({required Category category}) async {
    _repository = ref.watch(categoryRepositoryWrapperProvider);
    _privateUserBlocks =
        await ref.watch(privateUserBlocksControllerProvider.future);

    return await _fetch();
  }

  Future<List<Vod>?> _fetch() async {
    final result = await _repository.getCategoryVods(
      categoryType: category.categoryType,
      categoryId: category.categoryId,
      publishDateAt: null,
      readCount: null,
      size: 18,
    );

    return result.when(
      success: (response) {
        _next = response?.page?.next;
        return _filterBlockedVods(response?.data);
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
        final result = await _repository.getCategoryVods(
          categoryType: category.categoryType,
          categoryId: category.categoryId,
          publishDateAt: _next!.publishDateAt,
          readCount: _next!.readCount,
          size: 18,
        );

        return result.when(
          success: (response) {
            _next = response?.page?.next;

            if (response?.data == null) return [...prev!];
            final filteredNewVods = _filterBlockedVods(response?.data) ?? [];

            ref.setFetchMoreLoading(AppRoute.categoryDetail.routeName, false);
            return [...prev!, ...filteredNewVods];
          },
          failure: (_) {
            ref.setFetchMoreLoading(AppRoute.categoryDetail.routeName, false);
            return [...prev!];
          },
        );
      },
    );
  }

  List<Vod>? _filterBlockedVods(List<Vod>? vods) {
    if (vods == null) return null;
    return vods
        .where((vod) => !_privateUserBlocks.contains(vod.channel?.channelId))
        .toList();
  }
}
