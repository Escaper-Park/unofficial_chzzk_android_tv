// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'search_tag_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SearchTagLiveResponse {
  int get size;
  SearchTagLivePage? get page;
  List<LiveInfo> get data;

  /// Create a copy of SearchTagLiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagLiveResponseCopyWith<SearchTagLiveResponse> get copyWith =>
      _$SearchTagLiveResponseCopyWithImpl<SearchTagLiveResponse>(
          this as SearchTagLiveResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagLiveResponse &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'SearchTagLiveResponse(size: $size, page: $page, data: $data)';
  }
}

/// @nodoc
abstract mixin class $SearchTagLiveResponseCopyWith<$Res> {
  factory $SearchTagLiveResponseCopyWith(SearchTagLiveResponse value,
          $Res Function(SearchTagLiveResponse) _then) =
      _$SearchTagLiveResponseCopyWithImpl;
  @useResult
  $Res call({int size, SearchTagLivePage? page, List<LiveInfo> data});
}

/// @nodoc
class _$SearchTagLiveResponseCopyWithImpl<$Res>
    implements $SearchTagLiveResponseCopyWith<$Res> {
  _$SearchTagLiveResponseCopyWithImpl(this._self, this._then);

  final SearchTagLiveResponse _self;
  final $Res Function(SearchTagLiveResponse) _then;

  /// Create a copy of SearchTagLiveResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(SearchTagLiveResponse(
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as SearchTagLivePage?,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<LiveInfo>,
    ));
  }
}

/// @nodoc
mixin _$SearchTagLivePage {
  SearchTagLiveNext? get next;

  /// Create a copy of SearchTagLivePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagLivePageCopyWith<SearchTagLivePage> get copyWith =>
      _$SearchTagLivePageCopyWithImpl<SearchTagLivePage>(
          this as SearchTagLivePage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagLivePage &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'SearchTagLivePage(next: $next)';
  }
}

/// @nodoc
abstract mixin class $SearchTagLivePageCopyWith<$Res> {
  factory $SearchTagLivePageCopyWith(
          SearchTagLivePage value, $Res Function(SearchTagLivePage) _then) =
      _$SearchTagLivePageCopyWithImpl;
  @useResult
  $Res call({SearchTagLiveNext? next});
}

/// @nodoc
class _$SearchTagLivePageCopyWithImpl<$Res>
    implements $SearchTagLivePageCopyWith<$Res> {
  _$SearchTagLivePageCopyWithImpl(this._self, this._then);

  final SearchTagLivePage _self;
  final $Res Function(SearchTagLivePage) _then;

  /// Create a copy of SearchTagLivePage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(SearchTagLivePage(
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as SearchTagLiveNext?,
    ));
  }
}

/// @nodoc
mixin _$SearchTagLiveNext {
  int get concurrentUserCount;
  int get liveId;

  /// Create a copy of SearchTagLiveNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagLiveNextCopyWith<SearchTagLiveNext> get copyWith =>
      _$SearchTagLiveNextCopyWithImpl<SearchTagLiveNext>(
          this as SearchTagLiveNext, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagLiveNext &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.liveId, liveId) || other.liveId == liveId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, concurrentUserCount, liveId);

  @override
  String toString() {
    return 'SearchTagLiveNext(concurrentUserCount: $concurrentUserCount, liveId: $liveId)';
  }
}

/// @nodoc
abstract mixin class $SearchTagLiveNextCopyWith<$Res> {
  factory $SearchTagLiveNextCopyWith(
          SearchTagLiveNext value, $Res Function(SearchTagLiveNext) _then) =
      _$SearchTagLiveNextCopyWithImpl;
  @useResult
  $Res call({int concurrentUserCount, int liveId});
}

/// @nodoc
class _$SearchTagLiveNextCopyWithImpl<$Res>
    implements $SearchTagLiveNextCopyWith<$Res> {
  _$SearchTagLiveNextCopyWithImpl(this._self, this._then);

  final SearchTagLiveNext _self;
  final $Res Function(SearchTagLiveNext) _then;

  /// Create a copy of SearchTagLiveNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? concurrentUserCount = null,
    Object? liveId = null,
  }) {
    return _then(SearchTagLiveNext(
      concurrentUserCount: null == concurrentUserCount
          ? _self.concurrentUserCount
          : concurrentUserCount // ignore: cast_nullable_to_non_nullable
              as int,
      liveId: null == liveId
          ? _self.liveId
          : liveId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$SearchTagVodResponse {
  int get size;
  SearchTagVodPage? get page;
  List<Vod> get data;

  /// Create a copy of SearchTagVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagVodResponseCopyWith<SearchTagVodResponse> get copyWith =>
      _$SearchTagVodResponseCopyWithImpl<SearchTagVodResponse>(
          this as SearchTagVodResponse, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagVodResponse &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.page, page) || other.page == page) &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, size, page, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'SearchTagVodResponse(size: $size, page: $page, data: $data)';
  }
}

/// @nodoc
abstract mixin class $SearchTagVodResponseCopyWith<$Res> {
  factory $SearchTagVodResponseCopyWith(SearchTagVodResponse value,
          $Res Function(SearchTagVodResponse) _then) =
      _$SearchTagVodResponseCopyWithImpl;
  @useResult
  $Res call({int size, SearchTagVodPage? page, List<Vod> data});
}

/// @nodoc
class _$SearchTagVodResponseCopyWithImpl<$Res>
    implements $SearchTagVodResponseCopyWith<$Res> {
  _$SearchTagVodResponseCopyWithImpl(this._self, this._then);

  final SearchTagVodResponse _self;
  final $Res Function(SearchTagVodResponse) _then;

  /// Create a copy of SearchTagVodResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? page = freezed,
    Object? data = null,
  }) {
    return _then(SearchTagVodResponse(
      size: null == size
          ? _self.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      page: freezed == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as SearchTagVodPage?,
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Vod>,
    ));
  }
}

/// @nodoc
mixin _$SearchTagVodPage {
  SearchTagVodNext? get next;

  /// Create a copy of SearchTagVodPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagVodPageCopyWith<SearchTagVodPage> get copyWith =>
      _$SearchTagVodPageCopyWithImpl<SearchTagVodPage>(
          this as SearchTagVodPage, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagVodPage &&
            (identical(other.next, next) || other.next == next));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, next);

  @override
  String toString() {
    return 'SearchTagVodPage(next: $next)';
  }
}

/// @nodoc
abstract mixin class $SearchTagVodPageCopyWith<$Res> {
  factory $SearchTagVodPageCopyWith(
          SearchTagVodPage value, $Res Function(SearchTagVodPage) _then) =
      _$SearchTagVodPageCopyWithImpl;
  @useResult
  $Res call({SearchTagVodNext? next});
}

/// @nodoc
class _$SearchTagVodPageCopyWithImpl<$Res>
    implements $SearchTagVodPageCopyWith<$Res> {
  _$SearchTagVodPageCopyWithImpl(this._self, this._then);

  final SearchTagVodPage _self;
  final $Res Function(SearchTagVodPage) _then;

  /// Create a copy of SearchTagVodPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? next = freezed,
  }) {
    return _then(SearchTagVodPage(
      next: freezed == next
          ? _self.next
          : next // ignore: cast_nullable_to_non_nullable
              as SearchTagVodNext?,
    ));
  }
}

/// @nodoc
mixin _$SearchTagVodNext {
  int get start;

  /// Create a copy of SearchTagVodNext
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SearchTagVodNextCopyWith<SearchTagVodNext> get copyWith =>
      _$SearchTagVodNextCopyWithImpl<SearchTagVodNext>(
          this as SearchTagVodNext, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SearchTagVodNext &&
            (identical(other.start, start) || other.start == start));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, start);

  @override
  String toString() {
    return 'SearchTagVodNext(start: $start)';
  }
}

/// @nodoc
abstract mixin class $SearchTagVodNextCopyWith<$Res> {
  factory $SearchTagVodNextCopyWith(
          SearchTagVodNext value, $Res Function(SearchTagVodNext) _then) =
      _$SearchTagVodNextCopyWithImpl;
  @useResult
  $Res call({int start});
}

/// @nodoc
class _$SearchTagVodNextCopyWithImpl<$Res>
    implements $SearchTagVodNextCopyWith<$Res> {
  _$SearchTagVodNextCopyWithImpl(this._self, this._then);

  final SearchTagVodNext _self;
  final $Res Function(SearchTagVodNext) _then;

  /// Create a copy of SearchTagVodNext
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
  }) {
    return _then(SearchTagVodNext(
      start: null == start
          ? _self.start
          : start // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
