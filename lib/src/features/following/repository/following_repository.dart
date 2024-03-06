import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api.dart';
import '../model/following.dart';

part 'following_repository.g.dart';

@riverpod
FollowingRepository followingRepository(FollowingRepositoryRef ref) =>
    FollowingRepository();

class FollowingRepository {
  final Dio _dio = Dio(
    BaseOptions(
      headers: {
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3',
      },
    ),
  );

  static const int _fetchSize = 50;

  /// Fetch live channels among the following channels.
  Future<List<Following>?> getFollowingLiveChannels({
    required Options? options,
  }) async {
    final url = APIUrl.followingLiveChannels();

    final response = await _dio.get(
      url,
      options: options,
    );

    final List<dynamic> followingLiveChannelsList =
        response.data['content']['followingList'];

    return followingLiveChannelsList
        .map((json) => Following.fromJson(json))
        .toList();
  }

  /// Fetch all following channels.
  Future<List<Following>?> getFollowingChannels({
    required Options? options,
  }) async {
    // Get following of first page and total page count.
    // The total page count varies depend on [_fetchSize].

    final firstResponse =
        await _getFollowingResponse(options: options, page: 0);

    final content = firstResponse.data['content'];
    final totalPage = content['totalPage'];

    // Not following yet
    if (totalPage == 0) {
      return [];
    }
    // Follow less than [_fetchSize].
    else if (totalPage == 1) {
      return await _getFollowingsByPage(options: options, page: 0);
    }
    // Follow more than [_fetchSize].
    else {
      List<Following> followingList = [];
      for (int page = 0; page <= totalPage - 1; page++) {
        List<Following> followings =
            await _getFollowingsByPage(options: options, page: page);
        followingList.addAll(followings);
      }

      return followingList;
    }
  }

  /// Fetch followings by page and size.
  Future<List<Following>> _getFollowingsByPage({
    required Options? options,
    required int page,
  }) async {
    final response = await _getFollowingResponse(options: options, page: page);

    final List<dynamic> followingList =
        response.data['content']['followingList'];

    return followingList.map((json) => Following.fromJson(json)).toList();
  }

  /// Fetch following response including following info.
  Future<dynamic> _getFollowingResponse({
    required Options? options,
    int page = 0,
    int size = _fetchSize,
  }) async {
    final response = await _dio.get(
      APIUrl.following(page: page, size: size),
      options: options,
    );

    return response;
  }

  // Future Works.
  // Future<void> follow(String channelId) async {}
  // Future<void> unFollow(String channelId) async {}
}
