// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_tag_results_api.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _SearchTagResultsApi implements SearchTagResultsApi {
  _SearchTagResultsApi(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'https://api.chzzk.naver.com';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<ApiResponseDto<SearchTagLiveListDto>> searchTagLives({
    int size = SearchTagResultsApiDefaults.pageSize,
    String sortType = SearchTagResultsApiDefaults.sortTypePopular,
    required String tags,
    int? concurrentUserCount,
    int? liveId,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'size': size,
      r'sortType': sortType,
      r'tags': tags,
      r'concurrentUserCount': concurrentUserCount,
      r'liveId': liveId,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponseDto<SearchTagLiveListDto>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/service/v1/tag/lives',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponseDto<SearchTagLiveListDto> _value;
    try {
      _value = ApiResponseDto<SearchTagLiveListDto>.fromJson(
        _result.data!,
        (json) => SearchTagLiveListDto.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<ApiResponseDto<SearchTagVideoListDto>> searchTagVideos({
    int size = SearchTagResultsApiDefaults.pageSize,
    String sortType = SearchTagResultsApiDefaults.sortTypePopular,
    required String tag,
    int? start,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'size': size,
      r'sortType': sortType,
      r'tag': tag,
      r'start': start,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options = _setStreamType<ApiResponseDto<SearchTagVideoListDto>>(
      Options(method: 'GET', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            '/service/v1/tag/videos',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late ApiResponseDto<SearchTagVideoListDto> _value;
    try {
      _value = ApiResponseDto<SearchTagVideoListDto>.fromJson(
        _result.data!,
        (json) => SearchTagVideoListDto.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
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

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
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

// dart format on
