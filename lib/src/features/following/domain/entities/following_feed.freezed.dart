// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'following_feed.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FollowingChannelPage {
  List<FollowingChannel> get items;
  int get totalCount;
  int get totalPages;

  /// Create a copy of FollowingChannelPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingChannelPageCopyWith<FollowingChannelPage> get copyWith =>
      _$FollowingChannelPageCopyWithImpl<FollowingChannelPage>(
        this as FollowingChannelPage,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingChannelPage &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(items),
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'FollowingChannelPage(items: $items, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $FollowingChannelPageCopyWith<$Res> {
  factory $FollowingChannelPageCopyWith(
    FollowingChannelPage value,
    $Res Function(FollowingChannelPage) _then,
  ) = _$FollowingChannelPageCopyWithImpl;
  @useResult
  $Res call({List<FollowingChannel> items, int totalCount, int totalPages});
}

/// @nodoc
class _$FollowingChannelPageCopyWithImpl<$Res>
    implements $FollowingChannelPageCopyWith<$Res> {
  _$FollowingChannelPageCopyWithImpl(this._self, this._then);

  final FollowingChannelPage _self;
  final $Res Function(FollowingChannelPage) _then;

  /// Create a copy of FollowingChannelPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _self.copyWith(
        items: null == items
            ? _self.items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<FollowingChannel>,
        totalCount: null == totalCount
            ? _self.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _self.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FollowingChannelPage].
extension FollowingChannelPagePatterns on FollowingChannelPage {
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
    TResult Function(_FollowingChannelPage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelPage() when $default != null:
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
    TResult Function(_FollowingChannelPage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelPage():
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
    TResult? Function(_FollowingChannelPage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelPage() when $default != null:
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
      List<FollowingChannel> items,
      int totalCount,
      int totalPages,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelPage() when $default != null:
        return $default(_that.items, _that.totalCount, _that.totalPages);
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
      List<FollowingChannel> items,
      int totalCount,
      int totalPages,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelPage():
        return $default(_that.items, _that.totalCount, _that.totalPages);
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
      List<FollowingChannel> items,
      int totalCount,
      int totalPages,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannelPage() when $default != null:
        return $default(_that.items, _that.totalCount, _that.totalPages);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FollowingChannelPage implements FollowingChannelPage {
  const _FollowingChannelPage({
    final List<FollowingChannel> items = const <FollowingChannel>[],
    this.totalCount = 0,
    this.totalPages = 0,
  }) : _items = items;

  final List<FollowingChannel> _items;
  @override
  @JsonKey()
  List<FollowingChannel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final int totalCount;
  @override
  @JsonKey()
  final int totalPages;

  /// Create a copy of FollowingChannelPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingChannelPageCopyWith<_FollowingChannelPage> get copyWith =>
      __$FollowingChannelPageCopyWithImpl<_FollowingChannelPage>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingChannelPage &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    totalCount,
    totalPages,
  );

  @override
  String toString() {
    return 'FollowingChannelPage(items: $items, totalCount: $totalCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$FollowingChannelPageCopyWith<$Res>
    implements $FollowingChannelPageCopyWith<$Res> {
  factory _$FollowingChannelPageCopyWith(
    _FollowingChannelPage value,
    $Res Function(_FollowingChannelPage) _then,
  ) = __$FollowingChannelPageCopyWithImpl;
  @override
  @useResult
  $Res call({List<FollowingChannel> items, int totalCount, int totalPages});
}

/// @nodoc
class __$FollowingChannelPageCopyWithImpl<$Res>
    implements _$FollowingChannelPageCopyWith<$Res> {
  __$FollowingChannelPageCopyWithImpl(this._self, this._then);

  final _FollowingChannelPage _self;
  final $Res Function(_FollowingChannelPage) _then;

  /// Create a copy of FollowingChannelPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? totalCount = null,
    Object? totalPages = null,
  }) {
    return _then(
      _FollowingChannelPage(
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<FollowingChannel>,
        totalCount: null == totalCount
            ? _self.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        totalPages: null == totalPages
            ? _self.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc
mixin _$FollowingLivePage {
  List<FollowingChannel> get items;
  int? get totalCount;
  int? get totalLiveCount;
  int? get totalPages;

  /// Create a copy of FollowingLivePage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingLivePageCopyWith<FollowingLivePage> get copyWith =>
      _$FollowingLivePageCopyWithImpl<FollowingLivePage>(
        this as FollowingLivePage,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingLivePage &&
            const DeepCollectionEquality().equals(other.items, items) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalLiveCount, totalLiveCount) ||
                other.totalLiveCount == totalLiveCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(items),
    totalCount,
    totalLiveCount,
    totalPages,
  );

  @override
  String toString() {
    return 'FollowingLivePage(items: $items, totalCount: $totalCount, totalLiveCount: $totalLiveCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class $FollowingLivePageCopyWith<$Res> {
  factory $FollowingLivePageCopyWith(
    FollowingLivePage value,
    $Res Function(FollowingLivePage) _then,
  ) = _$FollowingLivePageCopyWithImpl;
  @useResult
  $Res call({
    List<FollowingChannel> items,
    int? totalCount,
    int? totalLiveCount,
    int? totalPages,
  });
}

/// @nodoc
class _$FollowingLivePageCopyWithImpl<$Res>
    implements $FollowingLivePageCopyWith<$Res> {
  _$FollowingLivePageCopyWithImpl(this._self, this._then);

  final FollowingLivePage _self;
  final $Res Function(FollowingLivePage) _then;

  /// Create a copy of FollowingLivePage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? totalCount = freezed,
    Object? totalLiveCount = freezed,
    Object? totalPages = freezed,
  }) {
    return _then(
      _self.copyWith(
        items: null == items
            ? _self.items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<FollowingChannel>,
        totalCount: freezed == totalCount
            ? _self.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalLiveCount: freezed == totalLiveCount
            ? _self.totalLiveCount
            : totalLiveCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalPages: freezed == totalPages
            ? _self.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FollowingLivePage].
extension FollowingLivePagePatterns on FollowingLivePage {
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
    TResult Function(_FollowingLivePage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingLivePage() when $default != null:
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
    TResult Function(_FollowingLivePage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLivePage():
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
    TResult? Function(_FollowingLivePage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLivePage() when $default != null:
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
      List<FollowingChannel> items,
      int? totalCount,
      int? totalLiveCount,
      int? totalPages,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingLivePage() when $default != null:
        return $default(
          _that.items,
          _that.totalCount,
          _that.totalLiveCount,
          _that.totalPages,
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
      List<FollowingChannel> items,
      int? totalCount,
      int? totalLiveCount,
      int? totalPages,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLivePage():
        return $default(
          _that.items,
          _that.totalCount,
          _that.totalLiveCount,
          _that.totalPages,
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
      List<FollowingChannel> items,
      int? totalCount,
      int? totalLiveCount,
      int? totalPages,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLivePage() when $default != null:
        return $default(
          _that.items,
          _that.totalCount,
          _that.totalLiveCount,
          _that.totalPages,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FollowingLivePage implements FollowingLivePage {
  const _FollowingLivePage({
    final List<FollowingChannel> items = const <FollowingChannel>[],
    this.totalCount,
    this.totalLiveCount,
    this.totalPages,
  }) : _items = items;

  final List<FollowingChannel> _items;
  @override
  @JsonKey()
  List<FollowingChannel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  final int? totalCount;
  @override
  final int? totalLiveCount;
  @override
  final int? totalPages;

  /// Create a copy of FollowingLivePage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingLivePageCopyWith<_FollowingLivePage> get copyWith =>
      __$FollowingLivePageCopyWithImpl<_FollowingLivePage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingLivePage &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.totalLiveCount, totalLiveCount) ||
                other.totalLiveCount == totalLiveCount) &&
            (identical(other.totalPages, totalPages) ||
                other.totalPages == totalPages));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_items),
    totalCount,
    totalLiveCount,
    totalPages,
  );

  @override
  String toString() {
    return 'FollowingLivePage(items: $items, totalCount: $totalCount, totalLiveCount: $totalLiveCount, totalPages: $totalPages)';
  }
}

/// @nodoc
abstract mixin class _$FollowingLivePageCopyWith<$Res>
    implements $FollowingLivePageCopyWith<$Res> {
  factory _$FollowingLivePageCopyWith(
    _FollowingLivePage value,
    $Res Function(_FollowingLivePage) _then,
  ) = __$FollowingLivePageCopyWithImpl;
  @override
  @useResult
  $Res call({
    List<FollowingChannel> items,
    int? totalCount,
    int? totalLiveCount,
    int? totalPages,
  });
}

/// @nodoc
class __$FollowingLivePageCopyWithImpl<$Res>
    implements _$FollowingLivePageCopyWith<$Res> {
  __$FollowingLivePageCopyWithImpl(this._self, this._then);

  final _FollowingLivePage _self;
  final $Res Function(_FollowingLivePage) _then;

  /// Create a copy of FollowingLivePage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? items = null,
    Object? totalCount = freezed,
    Object? totalLiveCount = freezed,
    Object? totalPages = freezed,
  }) {
    return _then(
      _FollowingLivePage(
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<FollowingChannel>,
        totalCount: freezed == totalCount
            ? _self.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalLiveCount: freezed == totalLiveCount
            ? _self.totalLiveCount
            : totalLiveCount // ignore: cast_nullable_to_non_nullable
                  as int?,
        totalPages: freezed == totalPages
            ? _self.totalPages
            : totalPages // ignore: cast_nullable_to_non_nullable
                  as int?,
      ),
    );
  }
}

/// @nodoc
mixin _$FollowingChannel {
  String get channelId;
  String get channelName;
  String? get channelImageUrl;
  bool get verifiedMark;
  List<String> get activatedChannelBadgeIds;
  FollowingPersonalData? get personalData;
  FollowingLiveInfo? get liveInfo;
  bool get openLive;

  /// Create a copy of FollowingChannel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingChannelCopyWith<FollowingChannel> get copyWith =>
      _$FollowingChannelCopyWithImpl<FollowingChannel>(
        this as FollowingChannel,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingChannel &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            const DeepCollectionEquality().equals(
              other.activatedChannelBadgeIds,
              activatedChannelBadgeIds,
            ) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData) &&
            (identical(other.liveInfo, liveInfo) ||
                other.liveInfo == liveInfo) &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    channelImageUrl,
    verifiedMark,
    const DeepCollectionEquality().hash(activatedChannelBadgeIds),
    personalData,
    liveInfo,
    openLive,
  );

  @override
  String toString() {
    return 'FollowingChannel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData, liveInfo: $liveInfo, openLive: $openLive)';
  }
}

/// @nodoc
abstract mixin class $FollowingChannelCopyWith<$Res> {
  factory $FollowingChannelCopyWith(
    FollowingChannel value,
    $Res Function(FollowingChannel) _then,
  ) = _$FollowingChannelCopyWithImpl;
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    FollowingPersonalData? personalData,
    FollowingLiveInfo? liveInfo,
    bool openLive,
  });

  $FollowingPersonalDataCopyWith<$Res>? get personalData;
  $FollowingLiveInfoCopyWith<$Res>? get liveInfo;
}

/// @nodoc
class _$FollowingChannelCopyWithImpl<$Res>
    implements $FollowingChannelCopyWith<$Res> {
  _$FollowingChannelCopyWithImpl(this._self, this._then);

  final FollowingChannel _self;
  final $Res Function(FollowingChannel) _then;

  /// Create a copy of FollowingChannel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? activatedChannelBadgeIds = null,
    Object? personalData = freezed,
    Object? liveInfo = freezed,
    Object? openLive = null,
  }) {
    return _then(
      _self.copyWith(
        channelId: null == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String,
        channelName: null == channelName
            ? _self.channelName
            : channelName // ignore: cast_nullable_to_non_nullable
                  as String,
        channelImageUrl: freezed == channelImageUrl
            ? _self.channelImageUrl
            : channelImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        verifiedMark: null == verifiedMark
            ? _self.verifiedMark
            : verifiedMark // ignore: cast_nullable_to_non_nullable
                  as bool,
        activatedChannelBadgeIds: null == activatedChannelBadgeIds
            ? _self.activatedChannelBadgeIds
            : activatedChannelBadgeIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        personalData: freezed == personalData
            ? _self.personalData
            : personalData // ignore: cast_nullable_to_non_nullable
                  as FollowingPersonalData?,
        liveInfo: freezed == liveInfo
            ? _self.liveInfo
            : liveInfo // ignore: cast_nullable_to_non_nullable
                  as FollowingLiveInfo?,
        openLive: null == openLive
            ? _self.openLive
            : openLive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of FollowingChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingPersonalDataCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $FollowingPersonalDataCopyWith<$Res>(_self.personalData!, (value) {
      return _then(_self.copyWith(personalData: value));
    });
  }

  /// Create a copy of FollowingChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingLiveInfoCopyWith<$Res>? get liveInfo {
    if (_self.liveInfo == null) {
      return null;
    }

    return $FollowingLiveInfoCopyWith<$Res>(_self.liveInfo!, (value) {
      return _then(_self.copyWith(liveInfo: value));
    });
  }
}

/// Adds pattern-matching-related methods to [FollowingChannel].
extension FollowingChannelPatterns on FollowingChannel {
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
    TResult Function(_FollowingChannel value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingChannel() when $default != null:
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
    TResult Function(_FollowingChannel value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannel():
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
    TResult? Function(_FollowingChannel value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannel() when $default != null:
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
      String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
      List<String> activatedChannelBadgeIds,
      FollowingPersonalData? personalData,
      FollowingLiveInfo? liveInfo,
      bool openLive,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingChannel() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.activatedChannelBadgeIds,
          _that.personalData,
          _that.liveInfo,
          _that.openLive,
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
      String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
      List<String> activatedChannelBadgeIds,
      FollowingPersonalData? personalData,
      FollowingLiveInfo? liveInfo,
      bool openLive,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannel():
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.activatedChannelBadgeIds,
          _that.personalData,
          _that.liveInfo,
          _that.openLive,
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
      String channelId,
      String channelName,
      String? channelImageUrl,
      bool verifiedMark,
      List<String> activatedChannelBadgeIds,
      FollowingPersonalData? personalData,
      FollowingLiveInfo? liveInfo,
      bool openLive,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingChannel() when $default != null:
        return $default(
          _that.channelId,
          _that.channelName,
          _that.channelImageUrl,
          _that.verifiedMark,
          _that.activatedChannelBadgeIds,
          _that.personalData,
          _that.liveInfo,
          _that.openLive,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FollowingChannel implements FollowingChannel {
  const _FollowingChannel({
    required this.channelId,
    required this.channelName,
    this.channelImageUrl,
    required this.verifiedMark,
    final List<String> activatedChannelBadgeIds = const <String>[],
    this.personalData,
    this.liveInfo,
    required this.openLive,
  }) : _activatedChannelBadgeIds = activatedChannelBadgeIds;

  @override
  final String channelId;
  @override
  final String channelName;
  @override
  final String? channelImageUrl;
  @override
  final bool verifiedMark;
  final List<String> _activatedChannelBadgeIds;
  @override
  @JsonKey()
  List<String> get activatedChannelBadgeIds {
    if (_activatedChannelBadgeIds is EqualUnmodifiableListView)
      return _activatedChannelBadgeIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activatedChannelBadgeIds);
  }

  @override
  final FollowingPersonalData? personalData;
  @override
  final FollowingLiveInfo? liveInfo;
  @override
  final bool openLive;

  /// Create a copy of FollowingChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingChannelCopyWith<_FollowingChannel> get copyWith =>
      __$FollowingChannelCopyWithImpl<_FollowingChannel>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingChannel &&
            (identical(other.channelId, channelId) ||
                other.channelId == channelId) &&
            (identical(other.channelName, channelName) ||
                other.channelName == channelName) &&
            (identical(other.channelImageUrl, channelImageUrl) ||
                other.channelImageUrl == channelImageUrl) &&
            (identical(other.verifiedMark, verifiedMark) ||
                other.verifiedMark == verifiedMark) &&
            const DeepCollectionEquality().equals(
              other._activatedChannelBadgeIds,
              _activatedChannelBadgeIds,
            ) &&
            (identical(other.personalData, personalData) ||
                other.personalData == personalData) &&
            (identical(other.liveInfo, liveInfo) ||
                other.liveInfo == liveInfo) &&
            (identical(other.openLive, openLive) ||
                other.openLive == openLive));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    channelId,
    channelName,
    channelImageUrl,
    verifiedMark,
    const DeepCollectionEquality().hash(_activatedChannelBadgeIds),
    personalData,
    liveInfo,
    openLive,
  );

  @override
  String toString() {
    return 'FollowingChannel(channelId: $channelId, channelName: $channelName, channelImageUrl: $channelImageUrl, verifiedMark: $verifiedMark, activatedChannelBadgeIds: $activatedChannelBadgeIds, personalData: $personalData, liveInfo: $liveInfo, openLive: $openLive)';
  }
}

/// @nodoc
abstract mixin class _$FollowingChannelCopyWith<$Res>
    implements $FollowingChannelCopyWith<$Res> {
  factory _$FollowingChannelCopyWith(
    _FollowingChannel value,
    $Res Function(_FollowingChannel) _then,
  ) = __$FollowingChannelCopyWithImpl;
  @override
  @useResult
  $Res call({
    String channelId,
    String channelName,
    String? channelImageUrl,
    bool verifiedMark,
    List<String> activatedChannelBadgeIds,
    FollowingPersonalData? personalData,
    FollowingLiveInfo? liveInfo,
    bool openLive,
  });

  @override
  $FollowingPersonalDataCopyWith<$Res>? get personalData;
  @override
  $FollowingLiveInfoCopyWith<$Res>? get liveInfo;
}

/// @nodoc
class __$FollowingChannelCopyWithImpl<$Res>
    implements _$FollowingChannelCopyWith<$Res> {
  __$FollowingChannelCopyWithImpl(this._self, this._then);

  final _FollowingChannel _self;
  final $Res Function(_FollowingChannel) _then;

  /// Create a copy of FollowingChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? channelId = null,
    Object? channelName = null,
    Object? channelImageUrl = freezed,
    Object? verifiedMark = null,
    Object? activatedChannelBadgeIds = null,
    Object? personalData = freezed,
    Object? liveInfo = freezed,
    Object? openLive = null,
  }) {
    return _then(
      _FollowingChannel(
        channelId: null == channelId
            ? _self.channelId
            : channelId // ignore: cast_nullable_to_non_nullable
                  as String,
        channelName: null == channelName
            ? _self.channelName
            : channelName // ignore: cast_nullable_to_non_nullable
                  as String,
        channelImageUrl: freezed == channelImageUrl
            ? _self.channelImageUrl
            : channelImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        verifiedMark: null == verifiedMark
            ? _self.verifiedMark
            : verifiedMark // ignore: cast_nullable_to_non_nullable
                  as bool,
        activatedChannelBadgeIds: null == activatedChannelBadgeIds
            ? _self._activatedChannelBadgeIds
            : activatedChannelBadgeIds // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        personalData: freezed == personalData
            ? _self.personalData
            : personalData // ignore: cast_nullable_to_non_nullable
                  as FollowingPersonalData?,
        liveInfo: freezed == liveInfo
            ? _self.liveInfo
            : liveInfo // ignore: cast_nullable_to_non_nullable
                  as FollowingLiveInfo?,
        openLive: null == openLive
            ? _self.openLive
            : openLive // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }

  /// Create a copy of FollowingChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingPersonalDataCopyWith<$Res>? get personalData {
    if (_self.personalData == null) {
      return null;
    }

    return $FollowingPersonalDataCopyWith<$Res>(_self.personalData!, (value) {
      return _then(_self.copyWith(personalData: value));
    });
  }

  /// Create a copy of FollowingChannel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FollowingLiveInfoCopyWith<$Res>? get liveInfo {
    if (_self.liveInfo == null) {
      return null;
    }

    return $FollowingLiveInfoCopyWith<$Res>(_self.liveInfo!, (value) {
      return _then(_self.copyWith(liveInfo: value));
    });
  }
}

/// @nodoc
mixin _$FollowingLiveInfo {
  int? get liveId;
  String? get title;
  String? get thumbnailImageUrl;
  String? get defaultThumbnailImageUrl;
  int get concurrentUserCount;
  bool get adult;
  List<String> get tags;
  String? get categoryValue;
  String? get blindType;
  String? get watchPartyTag;
  String? get watchPartyType;

  /// Create a copy of FollowingLiveInfo
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingLiveInfoCopyWith<FollowingLiveInfo> get copyWith =>
      _$FollowingLiveInfoCopyWithImpl<FollowingLiveInfo>(
        this as FollowingLiveInfo,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingLiveInfo &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumbnailImageUrl, thumbnailImageUrl) ||
                other.thumbnailImageUrl == thumbnailImageUrl) &&
            (identical(
                  other.defaultThumbnailImageUrl,
                  defaultThumbnailImageUrl,
                ) ||
                other.defaultThumbnailImageUrl == defaultThumbnailImageUrl) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            const DeepCollectionEquality().equals(other.tags, tags) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    liveId,
    title,
    thumbnailImageUrl,
    defaultThumbnailImageUrl,
    concurrentUserCount,
    adult,
    const DeepCollectionEquality().hash(tags),
    categoryValue,
    blindType,
    watchPartyTag,
    watchPartyType,
  );

  @override
  String toString() {
    return 'FollowingLiveInfo(liveId: $liveId, title: $title, thumbnailImageUrl: $thumbnailImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, adult: $adult, tags: $tags, categoryValue: $categoryValue, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType)';
  }
}

/// @nodoc
abstract mixin class $FollowingLiveInfoCopyWith<$Res> {
  factory $FollowingLiveInfoCopyWith(
    FollowingLiveInfo value,
    $Res Function(FollowingLiveInfo) _then,
  ) = _$FollowingLiveInfoCopyWithImpl;
  @useResult
  $Res call({
    int? liveId,
    String? title,
    String? thumbnailImageUrl,
    String? defaultThumbnailImageUrl,
    int concurrentUserCount,
    bool adult,
    List<String> tags,
    String? categoryValue,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
  });
}

/// @nodoc
class _$FollowingLiveInfoCopyWithImpl<$Res>
    implements $FollowingLiveInfoCopyWith<$Res> {
  _$FollowingLiveInfoCopyWithImpl(this._self, this._then);

  final FollowingLiveInfo _self;
  final $Res Function(FollowingLiveInfo) _then;

  /// Create a copy of FollowingLiveInfo
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? liveId = freezed,
    Object? title = freezed,
    Object? thumbnailImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? adult = null,
    Object? tags = null,
    Object? categoryValue = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
  }) {
    return _then(
      _self.copyWith(
        liveId: freezed == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int?,
        title: freezed == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        thumbnailImageUrl: freezed == thumbnailImageUrl
            ? _self.thumbnailImageUrl
            : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultThumbnailImageUrl: freezed == defaultThumbnailImageUrl
            ? _self.defaultThumbnailImageUrl
            : defaultThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        adult: null == adult
            ? _self.adult
            : adult // ignore: cast_nullable_to_non_nullable
                  as bool,
        tags: null == tags
            ? _self.tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        categoryValue: freezed == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
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
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FollowingLiveInfo].
extension FollowingLiveInfoPatterns on FollowingLiveInfo {
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
    TResult Function(_FollowingLiveInfo value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveInfo() when $default != null:
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
    TResult Function(_FollowingLiveInfo value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveInfo():
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
    TResult? Function(_FollowingLiveInfo value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveInfo() when $default != null:
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
      int? liveId,
      String? title,
      String? thumbnailImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      bool adult,
      List<String> tags,
      String? categoryValue,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveInfo() when $default != null:
        return $default(
          _that.liveId,
          _that.title,
          _that.thumbnailImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.adult,
          _that.tags,
          _that.categoryValue,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
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
      int? liveId,
      String? title,
      String? thumbnailImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      bool adult,
      List<String> tags,
      String? categoryValue,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveInfo():
        return $default(
          _that.liveId,
          _that.title,
          _that.thumbnailImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.adult,
          _that.tags,
          _that.categoryValue,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
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
      int? liveId,
      String? title,
      String? thumbnailImageUrl,
      String? defaultThumbnailImageUrl,
      int concurrentUserCount,
      bool adult,
      List<String> tags,
      String? categoryValue,
      String? blindType,
      String? watchPartyTag,
      String? watchPartyType,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingLiveInfo() when $default != null:
        return $default(
          _that.liveId,
          _that.title,
          _that.thumbnailImageUrl,
          _that.defaultThumbnailImageUrl,
          _that.concurrentUserCount,
          _that.adult,
          _that.tags,
          _that.categoryValue,
          _that.blindType,
          _that.watchPartyTag,
          _that.watchPartyType,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FollowingLiveInfo implements FollowingLiveInfo {
  const _FollowingLiveInfo({
    this.liveId,
    this.title,
    this.thumbnailImageUrl,
    this.defaultThumbnailImageUrl,
    this.concurrentUserCount = 0,
    required this.adult,
    final List<String> tags = const <String>[],
    this.categoryValue,
    this.blindType,
    this.watchPartyTag,
    this.watchPartyType,
  }) : _tags = tags;

  @override
  final int? liveId;
  @override
  final String? title;
  @override
  final String? thumbnailImageUrl;
  @override
  final String? defaultThumbnailImageUrl;
  @override
  @JsonKey()
  final int concurrentUserCount;
  @override
  final bool adult;
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
  final String? blindType;
  @override
  final String? watchPartyTag;
  @override
  final String? watchPartyType;

  /// Create a copy of FollowingLiveInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingLiveInfoCopyWith<_FollowingLiveInfo> get copyWith =>
      __$FollowingLiveInfoCopyWithImpl<_FollowingLiveInfo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingLiveInfo &&
            (identical(other.liveId, liveId) || other.liveId == liveId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumbnailImageUrl, thumbnailImageUrl) ||
                other.thumbnailImageUrl == thumbnailImageUrl) &&
            (identical(
                  other.defaultThumbnailImageUrl,
                  defaultThumbnailImageUrl,
                ) ||
                other.defaultThumbnailImageUrl == defaultThumbnailImageUrl) &&
            (identical(other.concurrentUserCount, concurrentUserCount) ||
                other.concurrentUserCount == concurrentUserCount) &&
            (identical(other.adult, adult) || other.adult == adult) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.categoryValue, categoryValue) ||
                other.categoryValue == categoryValue) &&
            (identical(other.blindType, blindType) ||
                other.blindType == blindType) &&
            (identical(other.watchPartyTag, watchPartyTag) ||
                other.watchPartyTag == watchPartyTag) &&
            (identical(other.watchPartyType, watchPartyType) ||
                other.watchPartyType == watchPartyType));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    liveId,
    title,
    thumbnailImageUrl,
    defaultThumbnailImageUrl,
    concurrentUserCount,
    adult,
    const DeepCollectionEquality().hash(_tags),
    categoryValue,
    blindType,
    watchPartyTag,
    watchPartyType,
  );

  @override
  String toString() {
    return 'FollowingLiveInfo(liveId: $liveId, title: $title, thumbnailImageUrl: $thumbnailImageUrl, defaultThumbnailImageUrl: $defaultThumbnailImageUrl, concurrentUserCount: $concurrentUserCount, adult: $adult, tags: $tags, categoryValue: $categoryValue, blindType: $blindType, watchPartyTag: $watchPartyTag, watchPartyType: $watchPartyType)';
  }
}

/// @nodoc
abstract mixin class _$FollowingLiveInfoCopyWith<$Res>
    implements $FollowingLiveInfoCopyWith<$Res> {
  factory _$FollowingLiveInfoCopyWith(
    _FollowingLiveInfo value,
    $Res Function(_FollowingLiveInfo) _then,
  ) = __$FollowingLiveInfoCopyWithImpl;
  @override
  @useResult
  $Res call({
    int? liveId,
    String? title,
    String? thumbnailImageUrl,
    String? defaultThumbnailImageUrl,
    int concurrentUserCount,
    bool adult,
    List<String> tags,
    String? categoryValue,
    String? blindType,
    String? watchPartyTag,
    String? watchPartyType,
  });
}

/// @nodoc
class __$FollowingLiveInfoCopyWithImpl<$Res>
    implements _$FollowingLiveInfoCopyWith<$Res> {
  __$FollowingLiveInfoCopyWithImpl(this._self, this._then);

  final _FollowingLiveInfo _self;
  final $Res Function(_FollowingLiveInfo) _then;

  /// Create a copy of FollowingLiveInfo
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? liveId = freezed,
    Object? title = freezed,
    Object? thumbnailImageUrl = freezed,
    Object? defaultThumbnailImageUrl = freezed,
    Object? concurrentUserCount = null,
    Object? adult = null,
    Object? tags = null,
    Object? categoryValue = freezed,
    Object? blindType = freezed,
    Object? watchPartyTag = freezed,
    Object? watchPartyType = freezed,
  }) {
    return _then(
      _FollowingLiveInfo(
        liveId: freezed == liveId
            ? _self.liveId
            : liveId // ignore: cast_nullable_to_non_nullable
                  as int?,
        title: freezed == title
            ? _self.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String?,
        thumbnailImageUrl: freezed == thumbnailImageUrl
            ? _self.thumbnailImageUrl
            : thumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        defaultThumbnailImageUrl: freezed == defaultThumbnailImageUrl
            ? _self.defaultThumbnailImageUrl
            : defaultThumbnailImageUrl // ignore: cast_nullable_to_non_nullable
                  as String?,
        concurrentUserCount: null == concurrentUserCount
            ? _self.concurrentUserCount
            : concurrentUserCount // ignore: cast_nullable_to_non_nullable
                  as int,
        adult: null == adult
            ? _self.adult
            : adult // ignore: cast_nullable_to_non_nullable
                  as bool,
        tags: null == tags
            ? _self._tags
            : tags // ignore: cast_nullable_to_non_nullable
                  as List<String>,
        categoryValue: freezed == categoryValue
            ? _self.categoryValue
            : categoryValue // ignore: cast_nullable_to_non_nullable
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
      ),
    );
  }
}

/// @nodoc
mixin _$FollowingPersonalData {
  bool get following;
  bool get notification;
  String? get followDate;
  bool get privateUserBlock;

  /// Create a copy of FollowingPersonalData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FollowingPersonalDataCopyWith<FollowingPersonalData> get copyWith =>
      _$FollowingPersonalDataCopyWithImpl<FollowingPersonalData>(
        this as FollowingPersonalData,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FollowingPersonalData &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.followDate, followDate) ||
                other.followDate == followDate) &&
            (identical(other.privateUserBlock, privateUserBlock) ||
                other.privateUserBlock == privateUserBlock));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    following,
    notification,
    followDate,
    privateUserBlock,
  );

  @override
  String toString() {
    return 'FollowingPersonalData(following: $following, notification: $notification, followDate: $followDate, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class $FollowingPersonalDataCopyWith<$Res> {
  factory $FollowingPersonalDataCopyWith(
    FollowingPersonalData value,
    $Res Function(FollowingPersonalData) _then,
  ) = _$FollowingPersonalDataCopyWithImpl;
  @useResult
  $Res call({
    bool following,
    bool notification,
    String? followDate,
    bool privateUserBlock,
  });
}

/// @nodoc
class _$FollowingPersonalDataCopyWithImpl<$Res>
    implements $FollowingPersonalDataCopyWith<$Res> {
  _$FollowingPersonalDataCopyWithImpl(this._self, this._then);

  final FollowingPersonalData _self;
  final $Res Function(FollowingPersonalData) _then;

  /// Create a copy of FollowingPersonalData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
    Object? privateUserBlock = null,
  }) {
    return _then(
      _self.copyWith(
        following: null == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as bool,
        notification: null == notification
            ? _self.notification
            : notification // ignore: cast_nullable_to_non_nullable
                  as bool,
        followDate: freezed == followDate
            ? _self.followDate
            : followDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [FollowingPersonalData].
extension FollowingPersonalDataPatterns on FollowingPersonalData {
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
    TResult Function(_FollowingPersonalData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingPersonalData() when $default != null:
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
    TResult Function(_FollowingPersonalData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingPersonalData():
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
    TResult? Function(_FollowingPersonalData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingPersonalData() when $default != null:
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
      bool following,
      bool notification,
      String? followDate,
      bool privateUserBlock,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FollowingPersonalData() when $default != null:
        return $default(
          _that.following,
          _that.notification,
          _that.followDate,
          _that.privateUserBlock,
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
      bool following,
      bool notification,
      String? followDate,
      bool privateUserBlock,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingPersonalData():
        return $default(
          _that.following,
          _that.notification,
          _that.followDate,
          _that.privateUserBlock,
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
      bool following,
      bool notification,
      String? followDate,
      bool privateUserBlock,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FollowingPersonalData() when $default != null:
        return $default(
          _that.following,
          _that.notification,
          _that.followDate,
          _that.privateUserBlock,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _FollowingPersonalData implements FollowingPersonalData {
  const _FollowingPersonalData({
    required this.following,
    required this.notification,
    this.followDate,
    required this.privateUserBlock,
  });

  @override
  final bool following;
  @override
  final bool notification;
  @override
  final String? followDate;
  @override
  final bool privateUserBlock;

  /// Create a copy of FollowingPersonalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FollowingPersonalDataCopyWith<_FollowingPersonalData> get copyWith =>
      __$FollowingPersonalDataCopyWithImpl<_FollowingPersonalData>(
        this,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FollowingPersonalData &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.notification, notification) ||
                other.notification == notification) &&
            (identical(other.followDate, followDate) ||
                other.followDate == followDate) &&
            (identical(other.privateUserBlock, privateUserBlock) ||
                other.privateUserBlock == privateUserBlock));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    following,
    notification,
    followDate,
    privateUserBlock,
  );

  @override
  String toString() {
    return 'FollowingPersonalData(following: $following, notification: $notification, followDate: $followDate, privateUserBlock: $privateUserBlock)';
  }
}

/// @nodoc
abstract mixin class _$FollowingPersonalDataCopyWith<$Res>
    implements $FollowingPersonalDataCopyWith<$Res> {
  factory _$FollowingPersonalDataCopyWith(
    _FollowingPersonalData value,
    $Res Function(_FollowingPersonalData) _then,
  ) = __$FollowingPersonalDataCopyWithImpl;
  @override
  @useResult
  $Res call({
    bool following,
    bool notification,
    String? followDate,
    bool privateUserBlock,
  });
}

/// @nodoc
class __$FollowingPersonalDataCopyWithImpl<$Res>
    implements _$FollowingPersonalDataCopyWith<$Res> {
  __$FollowingPersonalDataCopyWithImpl(this._self, this._then);

  final _FollowingPersonalData _self;
  final $Res Function(_FollowingPersonalData) _then;

  /// Create a copy of FollowingPersonalData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? following = null,
    Object? notification = null,
    Object? followDate = freezed,
    Object? privateUserBlock = null,
  }) {
    return _then(
      _FollowingPersonalData(
        following: null == following
            ? _self.following
            : following // ignore: cast_nullable_to_non_nullable
                  as bool,
        notification: null == notification
            ? _self.notification
            : notification // ignore: cast_nullable_to_non_nullable
                  as bool,
        followDate: freezed == followDate
            ? _self.followDate
            : followDate // ignore: cast_nullable_to_non_nullable
                  as String?,
        privateUserBlock: null == privateUserBlock
            ? _self.privateUserBlock
            : privateUserBlock // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}
