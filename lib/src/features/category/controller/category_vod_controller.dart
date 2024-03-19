import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/repository/vod_repository.dart';

import '../../auth/controller/auth_controller.dart';
import '../../vod/model/vod.dart';
import '../model/category.dart';
import '../repository/category_repository.dart';

part 'category_vod_controller.g.dart';

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

      state = await AsyncValue.guard(() async {
        final response =
            await ref.watch(categoryRepositoryProvider).getCategoryVodResponse(
                  category: category,
                  next: _next,
                  options: _options,
                );

        _next = response?.page;

        if (response?.vods == null || _next == null) {
          return [...prev!];
        }

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
