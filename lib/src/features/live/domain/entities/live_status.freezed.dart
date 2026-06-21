// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_status.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LiveStatus {
  String get title;
  String get status;
  int get concurrentUserCount;
  bool get adult;
  String? get openDate;
  String? get chatChannelId;
  List<String> get tags;
  String? get categoryValue;
  String? get categoryType;
  String? get categoryId;
  String? get userAdultStatus;
  String? get blindType;
  String? get watchPartyTag;
  String? get watchPartyType;
  String? get channelId;
  bool get krOnlyViewing;
  bool get timeMachineActive;
  String? get membershipBenefitType;
  List<String>? get liveTokenList;
  List<String> get liveTokens;

  /// Create a copy of LiveStatus
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LiveStatusCopyWith<LiveStatus> get copyWith =>
      _$LiveStatusCopyWithImpl<LiveStatus>(this as LiveStatus, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LiveStatus &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.krOnlyViewing, krOnlyViewing) ||
                other.krOnlyViewing == krOnlyViewing) &&
            (identical(other.timeMachineActive, timeMachineActive) ||
                other.timeMachineActive == timeMachineActive) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType) &&
            const DeepCollectionEquality().equals(
              other.liveTokenList,
              liveTokenList,
            ) &&
            const DeepCollectionEquality().equals(
              other.liveTokens,
              liveTokens,
            ));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    title,
    status,
    concurrentUserCount,
    adult,
    openDate,
    chatChannelId,
    const DeepCollectionEquality().hash(tags),
    categoryValue,
    categoryType,
    categoryId,
    userAdultStatus,
    blindType,
    watchPartyTag,
    watchPartyType,
    channelId,
    krOnlyViewing,
    timeMachineActive,
    membershipBenefitType,
    const DeepCollectionEquality().hash(liveTokenList),
    const DeepCollectionEquality().hash(liveTokens),
  ]);

  @override
  String toString() {
    return 'LiveStatus(title: $title, status: $status, concurrentUserCount: $concurrentUserCount, adult: $adult, openDate: $openDate, chatChannelId: $chatChannelId, tags: $tags, categoryValue: $categoryValue, categoryType: $categoryType, categoryId: $categoryId, userAdultStatus: $userAdultStatus, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, channelId: $channelId, krOnlyViewing: $krOnlyViewing, timeMachineActive: $timeMachineActive, membershipBenefitType: $membershipBenefitType, liveTokenList: $liveTokenList, liveTokens: $liveTokens)';
  }
}

/// @nodoc
abstract mixin class $LiveStatusCopyWith<$Res> {
  factory $LiveStatusCopyWith(
    LiveStatus value,
    $Res Function(LiveStatus) _then,
  ) = _$LiveStatusCopyWithImpl;
  @useResult
  $Res call({
    String title,
    String status,
    int concurrentUserCount,
    bool adult,
    String? openDate,
    String? chatChannelId,
    List<String> tags,
    String? categoryValue,
    String? categoryType,
    String? categoryId,
    String? userAdultStatus,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    String? channelId,
    bool krOnlyViewing,
    bool timeMachineActive,
    String? membershipBenefitType,
    List<String>? liveTokenList,
    List<String> liveTokens,
  });
}

/// @nodoc
class _$LiveStatusCopyWithImpl<$Res> implements $LiveStatusCopyWith<$Res> {
  _$LiveStatusCopyWithImpl(this._self, this._then);

  final LiveStatus _self;
  final $Res Function(LiveStatus) _then;

  /// Create a copy of LiveStatus
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? status = null,
    Object? concurrentUserCount = null,
    Object? adult = null,
    Object? openDate = freezed,
    Object? chatChannelId = freezed,
    Object? tags = null,
    Object? categoryValue = freezed,
    Object? categoryType = freezed,
    Object? categoryId = freezed,
    Object? userAdultStatus = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? channelId = freezed,
    Object? krOnlyViewing = null,
    Object? timeMachineActive = null,
    Object? membershipBenefitType = freezed,
    Object? liveTokenList = freezed,
    Object? liveTokens = null,
  }) {
    return _then(
      _self.copyWith(
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        adult: null == adult
            ? _self.adult
            : adult // ignore: cast_nullable_to_non_nullable
                  as bool,
        openDate: freezed == openDate
            ? _self.openDate
            : openDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        chatChannelId: freezed == chatChannelId
            ? _self.chatChannelId
            : chatChannelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        tags: null == tags
            ? _self.tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        categoryValue: freezed == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryType: freezed == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryId: freezed == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        userAdultStatus: freezed == userAdultStatus
            ? _self.userAdultStatus
            : userAdultStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyTag: freezed == watchPartyTag
            ? _self.watchPartyTag
            : watchPartyTag // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyType: freezed == watchPartyType
            ? _self.watchPartyType
            : watchPartyType // ignore: cast_nullable_to_non_nullable
                  as String?,
        channelId: freezed == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        krOnlyViewing: null == krOnlyViewing
            ? _self.krOnlyViewing
            : krOnlyViewing // ignore: cast_nullable_to_non_nullable
                  as bool,
        timeMachineActive: null == timeMachineActive
            ? _self.timeMachineActive
            : timeMachineActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveTokenList: freezed == liveTokenList
            ? _self.liveTokenList
            : liveTokenList // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        liveTokens: null == liveTokens
            ? _self.liveTokens
            : liveTokens // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [LiveStatus].
extension LiveStatusPatterns on LiveStatus {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_LiveStatus value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveStatus() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_LiveStatus value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveStatus():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_LiveStatus value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveStatus() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
      String title,
      String status,
      int concurrentUserCount,
      bool adult,
      String? openDate,
      String? chatChannelId,
      List<String> tags,
      String? categoryValue,
      String? categoryType,
      String? categoryId,
      String? userAdultStatus,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      String? channelId,
      bool krOnlyViewing,
      bool timeMachineActive,
      String? membershipBenefitType,
      List<String>? liveTokenList,
      List<String> liveTokens,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _LiveStatus() when $default != null:
        return $default(
          _that.title,
          _that.status,
          _that.concurrentUserCount,
          _that.adult,
          _that.openDate,
          _that.chatChannelId,
          _that.tags,
          _that.categoryValue,
          _that.categoryType,
          _that.categoryId,
          _that.userAdultStatus,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.channelId,
          _that.krOnlyViewing,
          _that.timeMachineActive,
          _that.membershipBenefitType,
          _that.liveTokenList,
          _that.liveTokens,
        );
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
      String title,
      String status,
      int concurrentUserCount,
      bool adult,
      String? openDate,
      String? chatChannelId,
      List<String> tags,
      String? categoryValue,
      String? categoryType,
      String? categoryId,
      String? userAdultStatus,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      String? channelId,
      bool krOnlyViewing,
      bool timeMachineActive,
      String? membershipBenefitType,
      List<String>? liveTokenList,
      List<String> liveTokens,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveStatus():
        return $default(
          _that.title,
          _that.status,
          _that.concurrentUserCount,
          _that.adult,
          _that.openDate,
          _that.chatChannelId,
          _that.tags,
          _that.categoryValue,
          _that.categoryType,
          _that.categoryId,
          _that.userAdultStatus,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.channelId,
          _that.krOnlyViewing,
          _that.timeMachineActive,
          _that.membershipBenefitType,
          _that.liveTokenList,
          _that.liveTokens,
        );
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
      String title,
      String status,
      int concurrentUserCount,
      bool adult,
      String? openDate,
      String? chatChannelId,
      List<String> tags,
      String? categoryValue,
      String? categoryType,
      String? categoryId,
      String? userAdultStatus,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
      String? channelId,
      bool krOnlyViewing,
      bool timeMachineActive,
      String? membershipBenefitType,
      List<String>? liveTokenList,
      List<String> liveTokens,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _LiveStatus() when $default != null:
        return $default(
          _that.title,
          _that.status,
          _that.concurrentUserCount,
          _that.adult,
          _that.openDate,
          _that.chatChannelId,
          _that.tags,
          _that.categoryValue,
          _that.categoryType,
          _that.categoryId,
          _that.userAdultStatus,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
          _that.channelId,
          _that.krOnlyViewing,
          _that.timeMachineActive,
          _that.membershipBenefitType,
          _that.liveTokenList,
          _that.liveTokens,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _LiveStatus implements LiveStatus {
  const _LiveStatus({
    required this.title,
    required this.status,
    required this.concurrentUserCount,
    required this.adult,
    this.openDate,
    this.chatChannelId,
    final List<String> tags = const <String>[],
    this.categoryValue,
    this.categoryType,
    this.categoryId,
    this.userAdultStatus,
    this.blindType,
    this.watchPartyTag,
    this.watchPartyType,
    this.channelId,
    this.krOnlyViewing = false,
    this.timeMachineActive = false,
    this.membershipBenefitType,
    final List<String>? liveTokenList,
    final List<String> liveTokens = const <String>[],
  }) : _tags = tags,
       _liveTokenList = liveTokenList,
       _liveTokens = liveTokens;

  @override
  final String title;
  @override
  final String status;
  @override
  final int concurrentUserCount;
  @override
  final bool adult;
  @override
  final String? openDate;
  @override
  final String? chatChannelId;
  final List<String> _tags;
  @override
  @JsonKey()
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? categoryValue;
  @override
  final String? categoryType;
  @override
  final String? categoryId;
  @override
  final String? userAdultStatus;
  @override
  final String? blindType;
  @override
  final String? watchPartyTag;
  @override
  final String? watchPartyType;
  @override
  final String? channelId;
  @override
  @JsonKey()
  final bool krOnlyViewing;
  @override
  @JsonKey()
  final bool timeMachineActive;
  @override
  final String? membershipBenefitType;
  final List<String>? _liveTokenList;
  @override
  List<String>? get liveTokenList {
    final value = _liveTokenList;
    if (value == null) return null;
    if (_liveTokenList is EqualUnmodifiableListView) return _liveTokenList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String> _liveTokens;
  @override
  @JsonKey()
  List<String> get liveTokens {
    if (_liveTokens is EqualUnmodifiableListView) return _liveTokens;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_liveTokens);
  }

  /// Create a copy of LiveStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LiveStatusCopyWith<_LiveStatus> get copyWith =>
      __$LiveStatusCopyWithImpl<_LiveStatus>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LiveStatus &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            (identical(other.openDate, openDate) ||
                other.openDate == openDate) &&
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.categoryType, categoryType) ||
                other.categoryType == categoryType) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.userAdultStatus, userAdultStatus) ||
                other.userAdultStatus == userAdultStatus) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType) &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.krOnlyViewing, krOnlyViewing) ||
                other.krOnlyViewing == krOnlyViewing) &&
            (identical(other.timeMachineActive, timeMachineActive) ||
                other.timeMachineActive == timeMachineActive) &&
            (identical(other.membershipBenefitType, membershipBenefitType) ||
                other.membershipBenefitType == membershipBenefitType) &&
            const DeepCollectionEquality().equals(
              other._liveTokenList,
              _liveTokenList,
            ) &&
            const DeepCollectionEquality().equals(
              other._liveTokens,
              _liveTokens,
            ));
  }

  @override
  int get hashCode => Object.hashAll([
    runtimeType,
    title,
    status,
    concurrentUserCount,
    adult,
    openDate,
    chatChannelId,
    const DeepCollectionEquality().hash(_tags),
    categoryValue,
    categoryType,
    categoryId,
    userAdultStatus,
    blindType,
    watchPartyTag,
    watchPartyType,
    channelId,
    krOnlyViewing,
    timeMachineActive,
    membershipBenefitType,
    const DeepCollectionEquality().hash(_liveTokenList),
    const DeepCollectionEquality().hash(_liveTokens),
  ]);

  @override
  String toString() {
    return 'LiveStatus(title: $title, status: $status, concurrentUserCount: $concurrentUserCount, adult: $adult, openDate: $openDate, chatChannelId: $chatChannelId, tags: $tags, categoryValue: $categoryValue, categoryType: $categoryType, categoryId: $categoryId, userAdultStatus: $userAdultStatus, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType, channelId: $channelId, krOnlyViewing: $krOnlyViewing, timeMachineActive: $timeMachineActive, membershipBenefitType: $membershipBenefitType, liveTokenList: $liveTokenList, liveTokens: $liveTokens)';
  }
}

/// @nodoc
abstract mixin class _$LiveStatusCopyWith<$Res>
    implements $LiveStatusCopyWith<$Res> {
  factory _$LiveStatusCopyWith(
    _LiveStatus value,
    $Res Function(_LiveStatus) _then,
  ) = __$LiveStatusCopyWithImpl;
  @override
  @useResult
  $Res call({
    String title,
    String status,
    int concurrentUserCount,
    bool adult,
    String? openDate,
    String? chatChannelId,
    List<String> tags,
    String? categoryValue,
    String? categoryType,
    String? categoryId,
    String? userAdultStatus,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
    String? channelId,
    bool krOnlyViewing,
    bool timeMachineActive,
    String? membershipBenefitType,
    List<String>? liveTokenList,
    List<String> liveTokens,
  });
}

/// @nodoc
class __$LiveStatusCopyWithImpl<$Res> implements _$LiveStatusCopyWith<$Res> {
  __$LiveStatusCopyWithImpl(this._self, this._then);

  final _LiveStatus _self;
  final $Res Function(_LiveStatus) _then;

  /// Create a copy of LiveStatus
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? title = null,
    Object? status = null,
    Object? concurrentUserCount = null,
    Object? adult = null,
    Object? openDate = freezed,
    Object? chatChannelId = freezed,
    Object? tags = null,
    Object? categoryValue = freezed,
    Object? categoryType = freezed,
    Object? categoryId = freezed,
    Object? userAdultStatus = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
    Object? channelId = freezed,
    Object? krOnlyViewing = null,
    Object? timeMachineActive = null,
    Object? membershipBenefitType = freezed,
    Object? liveTokenList = freezed,
    Object? liveTokens = null,
  }) {
    return _then(
      _LiveStatus(
        title: null == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as String,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        adult: null == adult
            ? _self.adult
            : adult // ignore: cast_nullable_to_non_nullable
                  as bool,
        openDate: freezed == openDate
            ? _self.openDate
            : openDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        chatChannelId: freezed == chatChannelId
            ? _self.chatChannelId
            : chatChannelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        tags: null == tags
            ? _self._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        categoryValue: freezed == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryType: freezed == categoryType
            ? _self.categoryType
            : categoryType // ignore: cast_nullable_to_non_nullable
                  as String?,
        categoryId: freezed == categoryId
            ? _self.categoryId
            : categoryId // ignore: cast_nullable_to_non_nullable
                  as String?,
        userAdultStatus: freezed == userAdultStatus
            ? _self.userAdultStatus
            : userAdultStatus // ignore: cast_nullable_to_non_nullable
                  as String?,
        blindType: freezed == blindType
            ? _self.blindType
            : blindType // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyTag: freezed == watchPartyTag
            ? _self.watchPartyTag
            : watchPartyTag // ignore: cast_nullable_to_non_nullable
                  as String?,
        watchPartyType: freezed == watchPartyType
            ? _self.watchPartyType
            : watchPartyType // ignore: cast_nullable_to_non_nullable
                  as String?,
        channelId: freezed == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String?,
        krOnlyViewing: null == krOnlyViewing
            ? _self.krOnlyViewing
            : krOnlyViewing // ignore: cast_nullable_to_non_nullable
                  as bool,
        timeMachineActive: null == timeMachineActive
            ? _self.timeMachineActive
            : timeMachineActive // ignore: cast_nullable_to_non_nullable
                  as bool,
        membershipBenefitType: freezed == membershipBenefitType
            ? _self.membershipBenefitType
            : membershipBenefitType // ignore: cast_nullable_to_non_nullable
                  as String?,
        liveTokenList: freezed == liveTokenList
            ? _self._liveTokenList
            : liveTokenList // ignore: cast_nullable_to_non_nullable
                  as List<String>?,
        liveTokens: null == liveTokens
            ? _self._liveTokens
            : liveTokens // ignore: cast_nullable_to_non_nullable
                  as List<String>,
      ),
    );
  }
}
