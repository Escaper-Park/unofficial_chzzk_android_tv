// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeEvent {
  bool get isSignedIn;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeEventCopyWith<HomeEvent> get copyWith =>
      _$HomeEventCopyWithImpl<HomeEvent>(this as HomeEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeEvent &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSignedIn);

  @override
  String toString() {
    return 'HomeEvent(isSignedIn: $isSignedIn)';
  }
}

/// @nodoc
abstract mixin class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) _then) =
      _$HomeEventCopyWithImpl;
  @useResult
  $Res call({bool isSignedIn});
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res> implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._self, this._then);

  final HomeEvent _self;
  final $Res Function(HomeEvent) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? isSignedIn = null}) {
    return _then(
      _self.copyWith(
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(_RefreshRequested value)? refreshRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _RefreshRequested() when refreshRequested != null:
        return refreshRequested(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(_RefreshRequested value) refreshRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that);
      case _RefreshRequested():
        return refreshRequested(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(_RefreshRequested value)? refreshRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that);
      case _RefreshRequested() when refreshRequested != null:
        return refreshRequested(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isSignedIn)? started,
    TResult Function(bool isSignedIn)? refreshRequested,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that.isSignedIn);
      case _RefreshRequested() when refreshRequested != null:
        return refreshRequested(_that.isSignedIn);
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
  TResult when<TResult extends Object?>({
    required TResult Function(bool isSignedIn) started,
    required TResult Function(bool isSignedIn) refreshRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started():
        return started(_that.isSignedIn);
      case _RefreshRequested():
        return refreshRequested(_that.isSignedIn);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isSignedIn)? started,
    TResult? Function(bool isSignedIn)? refreshRequested,
  }) {
    final _that = this;
    switch (_that) {
      case _Started() when started != null:
        return started(_that.isSignedIn);
      case _RefreshRequested() when refreshRequested != null:
        return refreshRequested(_that.isSignedIn);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Started implements HomeEvent {
  const _Started({required this.isSignedIn});

  @override
  final bool isSignedIn;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$StartedCopyWith<_Started> get copyWith =>
      __$StartedCopyWithImpl<_Started>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Started &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSignedIn);

  @override
  String toString() {
    return 'HomeEvent.started(isSignedIn: $isSignedIn)';
  }
}

/// @nodoc
abstract mixin class _$StartedCopyWith<$Res>
    implements $HomeEventCopyWith<$Res> {
  factory _$StartedCopyWith(_Started value, $Res Function(_Started) _then) =
      __$StartedCopyWithImpl;
  @override
  @useResult
  $Res call({bool isSignedIn});
}

/// @nodoc
class __$StartedCopyWithImpl<$Res> implements _$StartedCopyWith<$Res> {
  __$StartedCopyWithImpl(this._self, this._then);

  final _Started _self;
  final $Res Function(_Started) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? isSignedIn = null}) {
    return _then(
      _Started(
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _RefreshRequested implements HomeEvent {
  const _RefreshRequested({required this.isSignedIn});

  @override
  final bool isSignedIn;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RefreshRequestedCopyWith<_RefreshRequested> get copyWith =>
      __$RefreshRequestedCopyWithImpl<_RefreshRequested>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RefreshRequested &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSignedIn);

  @override
  String toString() {
    return 'HomeEvent.refreshRequested(isSignedIn: $isSignedIn)';
  }
}

/// @nodoc
abstract mixin class _$RefreshRequestedCopyWith<$Res>
    implements $HomeEventCopyWith<$Res> {
  factory _$RefreshRequestedCopyWith(
    _RefreshRequested value,
    $Res Function(_RefreshRequested) _then,
  ) = __$RefreshRequestedCopyWithImpl;
  @override
  @useResult
  $Res call({bool isSignedIn});
}

/// @nodoc
class __$RefreshRequestedCopyWithImpl<$Res>
    implements _$RefreshRequestedCopyWith<$Res> {
  __$RefreshRequestedCopyWithImpl(this._self, this._then);

  final _RefreshRequested _self;
  final $Res Function(_RefreshRequested) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? isSignedIn = null}) {
    return _then(
      _RefreshRequested(
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc
mixin _$HomeState {
  HomeLoadStatus get loadStatus;
  bool get isSignedIn;
  GeneralSetting get generalSetting;
  List<HomeSectionId> get visibleSections;
  HomeSectionData<Live> get immersive;
  HomeSectionData<Live> get followingLive;
  HomeSectionData<Live> get popularLive;
  HomeSectionData<Vod> get watchingHistory;
  HomeSectionData<Vod> get popularVod;
  HomeSectionData<CategoryItem> get followingCategory;
  HomeSectionData<CategoryItem> get trendingCategory;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeStateCopyWith<HomeState> get copyWith =>
      _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeState &&
            (identical(other.loadStatus, loadStatus) ||
                other.loadStatus == loadStatus) &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.generalSetting, generalSetting) ||
                other.generalSetting == generalSetting) &&
            const DeepCollectionEquality().equals(
              other.visibleSections,
              visibleSections,
            ) &&
            (identical(other.immersive, immersive) ||
                other.immersive == immersive) &&
            (identical(other.followingLive, followingLive) ||
                other.followingLive == followingLive) &&
            (identical(other.popularLive, popularLive) ||
                other.popularLive == popularLive) &&
            (identical(other.watchingHistory, watchingHistory) ||
                other.watchingHistory == watchingHistory) &&
            (identical(other.popularVod, popularVod) ||
                other.popularVod == popularVod) &&
            (identical(other.followingCategory, followingCategory) ||
                other.followingCategory == followingCategory) &&
            (identical(other.trendingCategory, trendingCategory) ||
                other.trendingCategory == trendingCategory));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loadStatus,
    isSignedIn,
    generalSetting,
    const DeepCollectionEquality().hash(visibleSections),
    immersive,
    followingLive,
    popularLive,
    watchingHistory,
    popularVod,
    followingCategory,
    trendingCategory,
  );

  @override
  String toString() {
    return 'HomeState(loadStatus: $loadStatus, isSignedIn: $isSignedIn, generalSetting: $generalSetting, visibleSections: $visibleSections, immersive: $immersive, followingLive: $followingLive, popularLive: $popularLive, watchingHistory: $watchingHistory, popularVod: $popularVod, followingCategory: $followingCategory, trendingCategory: $trendingCategory)';
  }
}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) =
      _$HomeStateCopyWithImpl;
  @useResult
  $Res call({
    HomeLoadStatus loadStatus,
    bool isSignedIn,
    GeneralSetting generalSetting,
    List<HomeSectionId> visibleSections,
    HomeSectionData<Live> immersive,
    HomeSectionData<Live> followingLive,
    HomeSectionData<Live> popularLive,
    HomeSectionData<Vod> watchingHistory,
    HomeSectionData<Vod> popularVod,
    HomeSectionData<CategoryItem> followingCategory,
    HomeSectionData<CategoryItem> trendingCategory,
  });

  $GeneralSettingCopyWith<$Res> get generalSetting;
  $HomeSectionDataCopyWith<Live, $Res> get immersive;
  $HomeSectionDataCopyWith<Live, $Res> get followingLive;
  $HomeSectionDataCopyWith<Live, $Res> get popularLive;
  $HomeSectionDataCopyWith<Vod, $Res> get watchingHistory;
  $HomeSectionDataCopyWith<Vod, $Res> get popularVod;
  $HomeSectionDataCopyWith<CategoryItem, $Res> get followingCategory;
  $HomeSectionDataCopyWith<CategoryItem, $Res> get trendingCategory;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res> implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadStatus = null,
    Object? isSignedIn = null,
    Object? generalSetting = null,
    Object? visibleSections = null,
    Object? immersive = null,
    Object? followingLive = null,
    Object? popularLive = null,
    Object? watchingHistory = null,
    Object? popularVod = null,
    Object? followingCategory = null,
    Object? trendingCategory = null,
  }) {
    return _then(
      _self.copyWith(
        loadStatus: null == loadStatus
            ? _self.loadStatus
            : loadStatus // ignore: cast_nullable_to_non_nullable
                  as HomeLoadStatus,
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        generalSetting: null == generalSetting
            ? _self.generalSetting
            : generalSetting // ignore: cast_nullable_to_non_nullable
                  as GeneralSetting,
        visibleSections: null == visibleSections
            ? _self.visibleSections
            : visibleSections // ignore: cast_nullable_to_non_nullable
                  as List<HomeSectionId>,
        immersive: null == immersive
            ? _self.immersive
            : immersive // ignore: cast_nullable_to_non_nullable
                  as HomeSectionData<Live>,
        followingLive: null == followingLive
            ? _self.followingLive
            : followingLive // ignore: cast_nullable_to_non_nullable
                  as HomeSectionData<Live>,
        popularLive: null == popularLive
            ? _self.popularLive
            : popularLive // ignore: cast_nullable_to_non_nullable
                  as HomeSectionData<Live>,
        watchingHistory: null == watchingHistory
            ? _self.watchingHistory
            : watchingHistory // ignore: cast_nullable_to_non_nullable
                  as HomeSectionData<Vod>,
        popularVod: null == popularVod
            ? _self.popularVod
            : popularVod // ignore: cast_nullable_to_non_nullable
                  as HomeSectionData<Vod>,
        followingCategory: null == followingCategory
            ? _self.followingCategory
            : followingCategory // ignore: cast_nullable_to_non_nullable
                  as HomeSectionData<CategoryItem>,
        trendingCategory: null == trendingCategory
            ? _self.trendingCategory
            : trendingCategory // ignore: cast_nullable_to_non_nullable
                  as HomeSectionData<CategoryItem>,
      ),
    );
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeneralSettingCopyWith<$Res> get generalSetting {
    return $GeneralSettingCopyWith<$Res>(_self.generalSetting, (value) {
      return _then(_self.copyWith(generalSetting: value));
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSectionDataCopyWith<Live, $Res> get immersive {
    return $HomeSectionDataCopyWith<Live, $Res>(_self.immersive, (value) {
      return _then(_self.copyWith(immersive: value));
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSectionDataCopyWith<Live, $Res> get followingLive {
    return $HomeSectionDataCopyWith<Live, $Res>(_self.followingLive, (value) {
      return _then(_self.copyWith(followingLive: value));
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSectionDataCopyWith<Live, $Res> get popularLive {
    return $HomeSectionDataCopyWith<Live, $Res>(_self.popularLive, (value) {
      return _then(_self.copyWith(popularLive: value));
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSectionDataCopyWith<Vod, $Res> get watchingHistory {
    return $HomeSectionDataCopyWith<Vod, $Res>(_self.watchingHistory, (value) {
      return _then(_self.copyWith(watchingHistory: value));
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSectionDataCopyWith<Vod, $Res> get popularVod {
    return $HomeSectionDataCopyWith<Vod, $Res>(_self.popularVod, (value) {
      return _then(_self.copyWith(popularVod: value));
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSectionDataCopyWith<CategoryItem, $Res> get followingCategory {
    return $HomeSectionDataCopyWith<CategoryItem, $Res>(
      _self.followingCategory,
      (value) {
        return _then(_self.copyWith(followingCategory: value));
      },
    );
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSectionDataCopyWith<CategoryItem, $Res> get trendingCategory {
    return $HomeSectionDataCopyWith<CategoryItem, $Res>(
      _self.trendingCategory,
      (value) {
        return _then(_self.copyWith(trendingCategory: value));
      },
    );
  }
}

/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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
    TResult Function(_HomeState value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
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
    TResult Function(_HomeState value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState():
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
    TResult? Function(_HomeState value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
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
      HomeLoadStatus loadStatus,
      bool isSignedIn,
      GeneralSetting generalSetting,
      List<HomeSectionId> visibleSections,
      HomeSectionData<Live> immersive,
      HomeSectionData<Live> followingLive,
      HomeSectionData<Live> popularLive,
      HomeSectionData<Vod> watchingHistory,
      HomeSectionData<Vod> popularVod,
      HomeSectionData<CategoryItem> followingCategory,
      HomeSectionData<CategoryItem> trendingCategory,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
        return $default(
          _that.loadStatus,
          _that.isSignedIn,
          _that.generalSetting,
          _that.visibleSections,
          _that.immersive,
          _that.followingLive,
          _that.popularLive,
          _that.watchingHistory,
          _that.popularVod,
          _that.followingCategory,
          _that.trendingCategory,
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
      HomeLoadStatus loadStatus,
      bool isSignedIn,
      GeneralSetting generalSetting,
      List<HomeSectionId> visibleSections,
      HomeSectionData<Live> immersive,
      HomeSectionData<Live> followingLive,
      HomeSectionData<Live> popularLive,
      HomeSectionData<Vod> watchingHistory,
      HomeSectionData<Vod> popularVod,
      HomeSectionData<CategoryItem> followingCategory,
      HomeSectionData<CategoryItem> trendingCategory,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState():
        return $default(
          _that.loadStatus,
          _that.isSignedIn,
          _that.generalSetting,
          _that.visibleSections,
          _that.immersive,
          _that.followingLive,
          _that.popularLive,
          _that.watchingHistory,
          _that.popularVod,
          _that.followingCategory,
          _that.trendingCategory,
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
      HomeLoadStatus loadStatus,
      bool isSignedIn,
      GeneralSetting generalSetting,
      List<HomeSectionId> visibleSections,
      HomeSectionData<Live> immersive,
      HomeSectionData<Live> followingLive,
      HomeSectionData<Live> popularLive,
      HomeSectionData<Vod> watchingHistory,
      HomeSectionData<Vod> popularVod,
      HomeSectionData<CategoryItem> followingCategory,
      HomeSectionData<CategoryItem> trendingCategory,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeState() when $default != null:
        return $default(
          _that.loadStatus,
          _that.isSignedIn,
          _that.generalSetting,
          _that.visibleSections,
          _that.immersive,
          _that.followingLive,
          _that.popularLive,
          _that.watchingHistory,
          _that.popularVod,
          _that.followingCategory,
          _that.trendingCategory,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeState extends HomeState {
  const _HomeState({
    required this.loadStatus,
    required this.isSignedIn,
    required this.generalSetting,
    required final List<HomeSectionId> visibleSections,
    required this.immersive,
    required this.followingLive,
    required this.popularLive,
    required this.watchingHistory,
    required this.popularVod,
    required this.followingCategory,
    required this.trendingCategory,
  }) : _visibleSections = visibleSections,
       super._();

  @override
  final HomeLoadStatus loadStatus;
  @override
  final bool isSignedIn;
  @override
  final GeneralSetting generalSetting;
  final List<HomeSectionId> _visibleSections;
  @override
  List<HomeSectionId> get visibleSections {
    if (_visibleSections is EqualUnmodifiableListView) return _visibleSections;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_visibleSections);
  }

  @override
  final HomeSectionData<Live> immersive;
  @override
  final HomeSectionData<Live> followingLive;
  @override
  final HomeSectionData<Live> popularLive;
  @override
  final HomeSectionData<Vod> watchingHistory;
  @override
  final HomeSectionData<Vod> popularVod;
  @override
  final HomeSectionData<CategoryItem> followingCategory;
  @override
  final HomeSectionData<CategoryItem> trendingCategory;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeStateCopyWith<_HomeState> get copyWith =>
      __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeState &&
            (identical(other.loadStatus, loadStatus) ||
                other.loadStatus == loadStatus) &&
            (identical(other.isSignedIn, isSignedIn) ||
                other.isSignedIn == isSignedIn) &&
            (identical(other.generalSetting, generalSetting) ||
                other.generalSetting == generalSetting) &&
            const DeepCollectionEquality().equals(
              other._visibleSections,
              _visibleSections,
            ) &&
            (identical(other.immersive, immersive) ||
                other.immersive == immersive) &&
            (identical(other.followingLive, followingLive) ||
                other.followingLive == followingLive) &&
            (identical(other.popularLive, popularLive) ||
                other.popularLive == popularLive) &&
            (identical(other.watchingHistory, watchingHistory) ||
                other.watchingHistory == watchingHistory) &&
            (identical(other.popularVod, popularVod) ||
                other.popularVod == popularVod) &&
            (identical(other.followingCategory, followingCategory) ||
                other.followingCategory == followingCategory) &&
            (identical(other.trendingCategory, trendingCategory) ||
                other.trendingCategory == trendingCategory));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loadStatus,
    isSignedIn,
    generalSetting,
    const DeepCollectionEquality().hash(_visibleSections),
    immersive,
    followingLive,
    popularLive,
    watchingHistory,
    popularVod,
    followingCategory,
    trendingCategory,
  );

  @override
  String toString() {
    return 'HomeState(loadStatus: $loadStatus, isSignedIn: $isSignedIn, generalSetting: $generalSetting, visibleSections: $visibleSections, immersive: $immersive, followingLive: $followingLive, popularLive: $popularLive, watchingHistory: $watchingHistory, popularVod: $popularVod, followingCategory: $followingCategory, trendingCategory: $trendingCategory)';
  }
}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(
    _HomeState value,
    $Res Function(_HomeState) _then,
  ) = __$HomeStateCopyWithImpl;
  @override
  @useResult
  $Res call({
    HomeLoadStatus loadStatus,
    bool isSignedIn,
    GeneralSetting generalSetting,
    List<HomeSectionId> visibleSections,
    HomeSectionData<Live> immersive,
    HomeSectionData<Live> followingLive,
    HomeSectionData<Live> popularLive,
    HomeSectionData<Vod> watchingHistory,
    HomeSectionData<Vod> popularVod,
    HomeSectionData<CategoryItem> followingCategory,
    HomeSectionData<CategoryItem> trendingCategory,
  });

  @override
  $GeneralSettingCopyWith<$Res> get generalSetting;
  @override
  $HomeSectionDataCopyWith<Live, $Res> get immersive;
  @override
  $HomeSectionDataCopyWith<Live, $Res> get followingLive;
  @override
  $HomeSectionDataCopyWith<Live, $Res> get popularLive;
  @override
  $HomeSectionDataCopyWith<Vod, $Res> get watchingHistory;
  @override
  $HomeSectionDataCopyWith<Vod, $Res> get popularVod;
  @override
  $HomeSectionDataCopyWith<CategoryItem, $Res> get followingCategory;
  @override
  $HomeSectionDataCopyWith<CategoryItem, $Res> get trendingCategory;
}

/// @nodoc
class __$HomeStateCopyWithImpl<$Res> implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? loadStatus = null,
    Object? isSignedIn = null,
    Object? generalSetting = null,
    Object? visibleSections = null,
    Object? immersive = null,
    Object? followingLive = null,
    Object? popularLive = null,
    Object? watchingHistory = null,
    Object? popularVod = null,
    Object? followingCategory = null,
    Object? trendingCategory = null,
  }) {
    return _then(
      _HomeState(
        loadStatus: null == loadStatus
            ? _self.loadStatus
            : loadStatus // ignore: cast_nullable_to_non_nullable
                  as HomeLoadStatus,
        isSignedIn: null == isSignedIn
            ? _self.isSignedIn
            : isSignedIn // ignore: cast_nullable_to_non_nullable
                  as bool,
        generalSetting: null == generalSetting
            ? _self.generalSetting
            : generalSetting // ignore: cast_nullable_to_non_nullable
                  as GeneralSetting,
        visibleSections: null == visibleSections
            ? _self._visibleSections
            : visibleSections // ignore: cast_nullable_to_non_nullable
                  as List<HomeSectionId>,
        immersive: null == immersive
            ? _self.immersive
            : immersive // ignore: cast_nullable_to_non_nullable
                  as HomeSectionData<Live>,
        followingLive: null == followingLive
            ? _self.followingLive
            : followingLive // ignore: cast_nullable_to_non_nullable
                  as HomeSectionData<Live>,
        popularLive: null == popularLive
            ? _self.popularLive
            : popularLive // ignore: cast_nullable_to_non_nullable
                  as HomeSectionData<Live>,
        watchingHistory: null == watchingHistory
            ? _self.watchingHistory
            : watchingHistory // ignore: cast_nullable_to_non_nullable
                  as HomeSectionData<Vod>,
        popularVod: null == popularVod
            ? _self.popularVod
            : popularVod // ignore: cast_nullable_to_non_nullable
                  as HomeSectionData<Vod>,
        followingCategory: null == followingCategory
            ? _self.followingCategory
            : followingCategory // ignore: cast_nullable_to_non_nullable
                  as HomeSectionData<CategoryItem>,
        trendingCategory: null == trendingCategory
            ? _self.trendingCategory
            : trendingCategory // ignore: cast_nullable_to_non_nullable
                  as HomeSectionData<CategoryItem>,
      ),
    );
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeneralSettingCopyWith<$Res> get generalSetting {
    return $GeneralSettingCopyWith<$Res>(_self.generalSetting, (value) {
      return _then(_self.copyWith(generalSetting: value));
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSectionDataCopyWith<Live, $Res> get immersive {
    return $HomeSectionDataCopyWith<Live, $Res>(_self.immersive, (value) {
      return _then(_self.copyWith(immersive: value));
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSectionDataCopyWith<Live, $Res> get followingLive {
    return $HomeSectionDataCopyWith<Live, $Res>(_self.followingLive, (value) {
      return _then(_self.copyWith(followingLive: value));
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSectionDataCopyWith<Live, $Res> get popularLive {
    return $HomeSectionDataCopyWith<Live, $Res>(_self.popularLive, (value) {
      return _then(_self.copyWith(popularLive: value));
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSectionDataCopyWith<Vod, $Res> get watchingHistory {
    return $HomeSectionDataCopyWith<Vod, $Res>(_self.watchingHistory, (value) {
      return _then(_self.copyWith(watchingHistory: value));
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSectionDataCopyWith<Vod, $Res> get popularVod {
    return $HomeSectionDataCopyWith<Vod, $Res>(_self.popularVod, (value) {
      return _then(_self.copyWith(popularVod: value));
    });
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSectionDataCopyWith<CategoryItem, $Res> get followingCategory {
    return $HomeSectionDataCopyWith<CategoryItem, $Res>(
      _self.followingCategory,
      (value) {
        return _then(_self.copyWith(followingCategory: value));
      },
    );
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeSectionDataCopyWith<CategoryItem, $Res> get trendingCategory {
    return $HomeSectionDataCopyWith<CategoryItem, $Res>(
      _self.trendingCategory,
      (value) {
        return _then(_self.copyWith(trendingCategory: value));
      },
    );
  }
}

/// @nodoc
mixin _$HomeSectionData<T> {
  HomeSectionLoadStatus get status;
  List<T> get items;

  /// Create a copy of HomeSectionData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeSectionDataCopyWith<T, HomeSectionData<T>> get copyWith =>
      _$HomeSectionDataCopyWithImpl<T, HomeSectionData<T>>(
        this as HomeSectionData<T>,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeSectionData<T> &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other.items, items));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(items),
  );

  @override
  String toString() {
    return 'HomeSectionData<$T>(status: $status, items: $items)';
  }
}

/// @nodoc
abstract mixin class $HomeSectionDataCopyWith<T, $Res> {
  factory $HomeSectionDataCopyWith(
    HomeSectionData<T> value,
    $Res Function(HomeSectionData<T>) _then,
  ) = _$HomeSectionDataCopyWithImpl;
  @useResult
  $Res call({HomeSectionLoadStatus status, List<T> items});
}

/// @nodoc
class _$HomeSectionDataCopyWithImpl<T, $Res>
    implements $HomeSectionDataCopyWith<T, $Res> {
  _$HomeSectionDataCopyWithImpl(this._self, this._then);

  final HomeSectionData<T> _self;
  final $Res Function(HomeSectionData<T>) _then;

  /// Create a copy of HomeSectionData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = null, Object? items = null}) {
    return _then(
      _self.copyWith(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as HomeSectionLoadStatus,
        items: null == items
            ? _self.items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [HomeSectionData].
extension HomeSectionDataPatterns<T> on HomeSectionData<T> {
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
    TResult Function(_HomeSectionData<T> value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeSectionData() when $default != null:
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
    TResult Function(_HomeSectionData<T> value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeSectionData():
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
    TResult? Function(_HomeSectionData<T> value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeSectionData() when $default != null:
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
    TResult Function(HomeSectionLoadStatus status, List<T> items)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _HomeSectionData() when $default != null:
        return $default(_that.status, _that.items);
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
    TResult Function(HomeSectionLoadStatus status, List<T> items) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeSectionData():
        return $default(_that.status, _that.items);
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
    TResult? Function(HomeSectionLoadStatus status, List<T> items)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _HomeSectionData() when $default != null:
        return $default(_that.status, _that.items);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _HomeSectionData<T> extends HomeSectionData<T> {
  const _HomeSectionData({required this.status, required final List<T> items})
    : _items = items,
      super._();

  @override
  final HomeSectionLoadStatus status;
  final List<T> _items;
  @override
  List<T> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  /// Create a copy of HomeSectionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HomeSectionDataCopyWith<T, _HomeSectionData<T>> get copyWith =>
      __$HomeSectionDataCopyWithImpl<T, _HomeSectionData<T>>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HomeSectionData<T> &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    status,
    const DeepCollectionEquality().hash(_items),
  );

  @override
  String toString() {
    return 'HomeSectionData<$T>(status: $status, items: $items)';
  }
}

/// @nodoc
abstract mixin class _$HomeSectionDataCopyWith<T, $Res>
    implements $HomeSectionDataCopyWith<T, $Res> {
  factory _$HomeSectionDataCopyWith(
    _HomeSectionData<T> value,
    $Res Function(_HomeSectionData<T>) _then,
  ) = __$HomeSectionDataCopyWithImpl;
  @override
  @useResult
  $Res call({HomeSectionLoadStatus status, List<T> items});
}

/// @nodoc
class __$HomeSectionDataCopyWithImpl<T, $Res>
    implements _$HomeSectionDataCopyWith<T, $Res> {
  __$HomeSectionDataCopyWithImpl(this._self, this._then);

  final _HomeSectionData<T> _self;
  final $Res Function(_HomeSectionData<T>) _then;

  /// Create a copy of HomeSectionData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? status = null, Object? items = null}) {
    return _then(
      _HomeSectionData<T>(
        status: null == status
            ? _self.status
            : status // ignore: cast_nullable_to_non_nullable
                  as HomeSectionLoadStatus,
        items: null == items
            ? _self._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<T>,
      ),
    );
  }
}
