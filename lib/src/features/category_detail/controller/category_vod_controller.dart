import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/enums.dart' show AppRoute;
import '../../../utils/extensions/custom_extensions.dart';
import '../../../utils/dio/dio_client.dart';
import '../../category/model/category.dart';
import '../../category/repository/category_repository.dart';
import '../../user/controller/private_user_blocks_controller.dart';
import '../../vod/model/vod.dart';
import '../../vod/model/vod_response.dart';

part 'category_vod_controller.g.dart';

@riverpod
class CategoryVodController extends _$CategoryVodController {
  late CategoryRepository _repository;
  late List<String> _privateUserBlocks;

  CategoryVodNext? _next;

  @override
  FutureOr<List<Vod>?> build({required Category category}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = CategoryRepository(dio);
    _privateUserBlocks =
        await ref.watch(privateUserBlocksControllerProvider.future);

    return await _fetch();
  }

  Future<List<Vod>?> _fetch() async {
    final response = await _repository.getCategoryVods(
      categoryType: category.categoryType,
      categoryId: category.categoryId,
      publishDateAt: null,
      readCount: null,
      size: 18,
    );

    _next = response?.page?.next;

    return _filterBlockedVods(response?.data);
  }

  Future<void> fetchMore() async {
    if (_next == null) return;
    ref.setFetchMoreLoading(AppRoute.categoryDetail.routeName, true);

    final prev = state.value;

    state = await AsyncValue.guard(
      () async {
        final response = await _repository.getCategoryVods(
          categoryType: category.categoryType,
          categoryId: category.categoryId,
          publishDateAt: _next!.publishDateAt,
          readCount: _next!.readCount,
          size: 18,
        );

        _next = response?.page?.next;

        if (response?.data == null) return [...prev!];
        final filteredNewVods = _filterBlockedVods(response?.data) ?? [];

        ref.setFetchMoreLoading(AppRoute.categoryDetail.routeName, false);
        return [...prev!, ...filteredNewVods];
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
