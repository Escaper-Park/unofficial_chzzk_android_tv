import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/repository/live_repository.dart';

import '../../auth/controller/auth_controller.dart';
import '../../live/model/live.dart';
import '../model/category.dart';
import '../repository/category_repository.dart';

part 'category_live_controller.g.dart';

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
          return [...prev!];
        }

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
