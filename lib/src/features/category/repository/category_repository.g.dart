// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _CategoryRepository implements CategoryRepository {
  _CategoryRepository(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.chzzk.naver.com/service';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CategoryResponse?> getCategories({
    required int size,
    String? categoryId,
    int? concurrentUserCount,
    int? openLiveCount,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'size': size,
      r'categoryId': categoryId,
      r'concurrentUserCount': concurrentUserCount,
      r'openLiveCount': openLiveCount,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<CategoryResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v1/categories/live',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value =
        _result.data == null ? null : CategoryResponse.fromJson(_result.data!);
    return _value;
  }

  @override
  Future<LiveResponse?> getCategoryLives({
    required String categoryType,
    required String categoryId,
    required int size,
    int? concurrentUserCount,
    int? liveId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'size': size,
      r'concurrentUserCount': concurrentUserCount,
      r'liveId': liveId,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>?>(_setStreamType<LiveResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v2/categories/${categoryType}/${categoryId}/lives',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value =
        _result.data == null ? null : LiveResponse.fromJson(_result.data!);
    return _value;
  }

  @override
  Future<CategoryVodResponse?> getCategoryVods({
    required String categoryType,
    required String categoryId,
    required int size,
    int? publishDateAt,
    int? readCount,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'size': size,
      r'publishDateAt': publishDateAt,
      r'readCount': readCount,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<CategoryVodResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v2/categories/${categoryType}/${categoryId}/videos',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = _result.data == null
        ? null
        : CategoryVodResponse.fromJson(_result.data!);
    return _value;
  }

  @override
  Future<FollowingCategoryResponse?> getFollowingCategories() async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<FollowingCategoryResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v1/categories/following',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = _result.data == null
        ? null
        : FollowingCategoryResponse.fromJson(_result.data!);
    return _value;
  }

  @override
  Future<void> follow({
    required String categoryType,
    required String categoryId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'POST',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/v1/categories/${categoryType}/${categoryId}/follow',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  @override
  Future<void> unfollow({
    required String categoryType,
    required String categoryId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    await _dio.fetch<void>(_setStreamType<void>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    )
        .compose(
          _dio.options,
          '/v1/categories/${categoryType}/${categoryId}/follow',
          queryParameters: queryParameters,
          data: _data,
        )
        .copyWith(
            baseUrl: _combineBaseUrls(
          _dio.options.baseUrl,
          baseUrl,
        ))));
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
