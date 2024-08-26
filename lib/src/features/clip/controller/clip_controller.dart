import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../../category/model/category.dart';
import '../model/clip.dart';
import '../repository/clip_repository.dart';

part 'clip_controller.g.dart';

@riverpod
class PopularClipController extends _$PopularClipController {
  late ClipRepository _repository;
  PopularClipPage? _next;

  @override
  FutureOr<List<NaverClip>?> build() async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = ClipRepository(dio);

    return await _initFetch();
  }

  Future<List<NaverClip>?> _initFetch() async {
    final popularClipResponse = await _repository.getPopularClips(next: '');

    _next = popularClipResponse?.next;

    return popularClipResponse?.data;
  }

  Future<void> fetchMore() async {
    if (_next != null) {
      final prev = state.value;

      state = await AsyncValue.guard(() async {
        final popularClipResponse = await _repository
            .getPopularClips(
          next: _next!.next,
        )
            .catchError((_) {
          return null;
        });

        _next = popularClipResponse?.next;

        if (popularClipResponse?.data == null || _next == null) {
          return [...prev!];
        }

        return [...prev!, ...popularClipResponse!.data];
      });
    }
  }
}

@riverpod
class ChannelClipController extends _$ChannelClipController {
  late ClipRepository _repository;
  ClipPage? _next;

  @override
  FutureOr<List<NaverClip>?> build({
    required String channelId,
    String sortType = 'POPULAR',
  }) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = ClipRepository(dio);

    return await _initFetch();
  }

  Future<List<NaverClip>?> _initFetch() async {
    final clipResponse = await _repository.getChannelClips(
      orderType: sortType,
      channelId: channelId,
    );

    _next = clipResponse?.next;

    return clipResponse?.data;
  }

  Future<void> fetchMore() async {
    if (_next != null) {
      final prev = state.value;

      state = await AsyncValue.guard(() async {
        final clipResponse = await _repository
            .getChannelClips(
          orderType: sortType,
          channelId: channelId,
          clipUID: _next!.clipUID,
          readCount: _next!.readCount,
        )
            .catchError((_) {
          return null;
        });

        _next = clipResponse?.next;

        if (clipResponse?.data == null || _next == null) {
          return [...prev!];
        }

        return [...prev!, ...clipResponse!.data];
      });
    }
  }
}

@riverpod
class CategoryClipController extends _$CategoryClipController {
  late ClipRepository _repository;
  ClipPage? _next;

  @override
  FutureOr<List<NaverClip>?> build({
    required Category category,
    String sortType = 'POPULAR',
  }) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = ClipRepository(dio);

    return await _initFetch();
  }

  Future<List<NaverClip>?> _initFetch() async {
    final clipResponse = await _repository.getCategoryClips(
      orderType: sortType,
      categoryType: category.categoryType,
      categoryId: category.categoryId,
    );

    _next = clipResponse?.next;

    return clipResponse?.data;
  }

  Future<void> fetchMore() async {
    if (_next != null) {
      final prev = state.value;

      state = await AsyncValue.guard(() async {
        final clipResponse = await _repository
            .getCategoryClips(
          orderType: sortType,
          categoryId: category.categoryId,
          categoryType: category.categoryType,
          clipUID: _next!.clipUID,
          readCount: _next!.readCount,
        )
            .catchError((_) {
          return null;
        });

        _next = clipResponse?.next;

        if (clipResponse?.data == null || _next == null) {
          return [...prev!];
        }

        return [...prev!, ...clipResponse!.data];
      });
    }
  }
}

@riverpod
class CurrentSelectedClip extends _$CurrentSelectedClip {
  @override
  String? build() {
    return null;
  }

  void setState(String url) {
    state = url;
  }

  void reset() {
    state = null;
  }
}
