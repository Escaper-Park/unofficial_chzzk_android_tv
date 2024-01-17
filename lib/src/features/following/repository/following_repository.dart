import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api.dart';
import '../model/following.dart';

part 'following_repository.g.dart';

@riverpod
FollowingRepository followingRepository(FollowingRepositoryRef ref) =>
    FollowingRepository();

class FollowingRepository {
  final Dio _dio = Dio();

  Future<dynamic> _getFollowingResponseByPage({
    Options? options,
    int page = 0,
  }) async {
    final response = await _dio.get(
      APIUrl.followingList(size: 100, page: page),
      options: options,
    );

    return response;
  }

  Future<List<Following>> _getFollowingsByPage({
    Options? options,
    int page = 0,
  }) async {
    final response =
        await _getFollowingResponseByPage(options: options, page: page);

    final List<dynamic> followingList =
        response.data['content']['followingList'];

    return followingList.map((f) => Following.fromJson(f)).toList();
  }

  Future<List<Following>?> fetchFollowingChannels(Options? options) async {
    // first get, size = 100, page = 0.
    final response = await _getFollowingResponseByPage(options: options);

    final content = response.data['content'];
    final totalPage = content['totalPage'];

    // Not yet followed
    if (totalPage == 0) {
      return [];
    }
    // Follow less than 100.
    else if (totalPage == 1) {
      return await _getFollowingsByPage(options: options, page: 0);
    }
    // Follow more than 100
    else {
      List<Following> followings = [];
      for (int page = 0; page <= totalPage - 1; page++) {
        List<Following> tempFollowings =
            await _getFollowingsByPage(options: options, page: page);
        followings.addAll(tempFollowings);
      }

      return followings;
    }
  }

  Future<List<Following>?> fetchFollowingLiveChannels(Options? options) async {
    final response = await _dio.get(
      APIUrl.liveFollowingList,
      options: options,
    );

    final List<dynamic> followingList =
        response.data['content']['followingList'];

    return followingList.map((f) => Following.fromJson(f)).toList();
  }

  // Future works.
  Future<void> follow() async {}

  // Future works.
  Future<void> unFollow() async {}
}
