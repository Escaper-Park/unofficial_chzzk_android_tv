// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_repository.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element

class _VodRepository implements VodRepository {
  _VodRepository(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://api.chzzk.naver.com/service';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ChannelVodResponse?> getChannelVods({
    required String channelId,
    required String sortType,
    required String pagingType,
    required int page,
    required int size,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'sortType': sortType,
      r'pagingType': pagingType,
      r'page': page,
      r'size': size,
    };
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<ChannelVodResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v1/channels/${channelId}/videos',
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
        : ChannelVodResponse.fromJson(_result.data!);
    return _value;
  }

  @override
  Future<FollowingVodResponse?> getFollowingVods({
    required int size,
    int? nextNo,
  }) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'size': size,
      r'nextNo': nextNo,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<FollowingVodResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v1/my-content',
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
        : FollowingVodResponse.fromJson(_result.data!);
    return _value;
  }

  @override
  Future<PopularVodResponse?> getPopularVods({required int size}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'size': size};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result = await _dio.fetch<Map<String, dynamic>?>(
        _setStreamType<PopularVodResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v1/home/popular-videos',
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
        : PopularVodResponse.fromJson(_result.data!);
    return _value;
  }

  @override
  Future<Vod?> getVod({required int videoNo}) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _result =
        await _dio.fetch<Map<String, dynamic>?>(_setStreamType<Vod>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/v3/videos/${videoNo}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final _value = _result.data == null ? null : Vod.fromJson(_result.data!);
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
