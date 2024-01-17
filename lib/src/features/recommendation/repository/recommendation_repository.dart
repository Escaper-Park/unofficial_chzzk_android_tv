import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../constants/api.dart';
import '../model/recommendation.dart';

part 'recommendation_repository.g.dart';

@riverpod
RecommendationRepository recommendationRepository(
        RecommendationRepositoryRef ref) =>
    RecommendationRepository();

class RecommendationRepository {
  final Dio _dio = Dio();

  Future<List<Recommendation>?> fetchRecommendList(Options? options) async {
    const String url = APIUrl.recommendataionChannels;

    final response = await _dio.get(url, options: options);

    final List<dynamic> responseData =
        response.data['content']['recommendationChannels'];

    List<Recommendation> recommendationChannels =
        responseData.map((json) => Recommendation.fromJson(json)).toList();

    return recommendationChannels;
  }
}
