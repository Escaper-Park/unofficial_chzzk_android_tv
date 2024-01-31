import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../constants/api.dart';
import '../../model/following/following.dart';

part 'following_repository.g.dart';

@riverpod
FollowingRepository followingRepository(FollowingRepositoryRef ref) =>
    FollowingRepository();

class FollowingRepository {
  final Dio _dio = Dio();

  static const int _fetchSize = 100;

  // Following Lives
  Future<List<Following>?> getFollowingsLiveChannels({
    required Options? options,
  }) async {
    final url = APIUrl.followingsLive();

    final response = await _dio.get(
      url,
      options: options,
    );

    final List<dynamic> followingList =
        response.data['content']['followingList'];

    return followingList.map((json) => Following.fromJson(json)).toList();
  }

  // Follow channels
  Future<List<Following>?> getFollowingChannels({
    required Options? options,
  }) async {
    // first get
    final firstResponse = await _getFollowingResponseByPage(options: options);

    final content = firstResponse.data['content'];
    final totalPage = content['totalPage'];

    // No following list
    if (totalPage == 0) {
      return [];
    }
    // Follow less than _fetchSize.
    else if (totalPage == 1) {
      return await _getFollowingsFromResponse(options: options, page: 0);
    }
    // more than _fetchSize
    else {
      List<Following> followings = [];
      for (int page = 0; page <= totalPage - 1; page++) {
        List<Following> tempFollowings =
            await _getFollowingsFromResponse(options: options, page: page);
        followings.addAll(tempFollowings);
      }

      return followings;
    }
  }

  Future<dynamic> _getFollowingResponseByPage({
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

  Future<List<Following>> _getFollowingsFromResponse({
    required Options? options,
    int page = 0,
  }) async {
    final response =
        await _getFollowingResponseByPage(options: options, page: page);

    final List<dynamic> followingList =
        response.data['content']['followingList'];

    return followingList.map((json) => Following.fromJson(json)).toList();
  }

  // Future works.
  Future<void> follow(String channelId) async {}
  Future<void> unFollow(String channelId) async {}
}
