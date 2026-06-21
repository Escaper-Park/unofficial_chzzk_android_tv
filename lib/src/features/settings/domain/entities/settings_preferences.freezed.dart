// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'settings_preferences.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingsPreferences {
  GeneralSetting get generalSetting;
  LiveSettings get liveSettings;
  VodSettings get vodSettings;
  ChatSettings get chatSettings;

  /// Create a copy of SettingsPreferences
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SettingsPreferencesCopyWith<SettingsPreferences> get copyWith =>
      _$SettingsPreferencesCopyWithImpl<SettingsPreferences>(
        this as SettingsPreferences,
        _$identity,
      );

  /// Serializes this SettingsPreferences to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SettingsPreferences &&
            (identical(other.generalSetting, generalSetting) ||
                other.generalSetting == generalSetting) &&
            (identical(other.liveSettings, liveSettings) ||
                other.liveSettings == liveSettings) &&
            (identical(other.vodSettings, vodSettings) ||
                other.vodSettings == vodSettings) &&
            (identical(other.chatSettings, chatSettings) ||
                other.chatSettings == chatSettings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    generalSetting,
    liveSettings,
    vodSettings,
    chatSettings,
  );

  @override
  String toString() {
    return 'SettingsPreferences(generalSetting: $generalSetting, liveSettings: $liveSettings, vodSettings: $vodSettings, chatSettings: $chatSettings)';
  }
}

/// @nodoc
abstract mixin class $SettingsPreferencesCopyWith<$Res> {
  factory $SettingsPreferencesCopyWith(
    SettingsPreferences value,
    $Res Function(SettingsPreferences) _then,
  ) = _$SettingsPreferencesCopyWithImpl;
  @useResult
  $Res call({
    GeneralSetting generalSetting,
    LiveSettings liveSettings,
    VodSettings vodSettings,
    ChatSettings chatSettings,
  });

  $GeneralSettingCopyWith<$Res> get generalSetting;
  $LiveSettingsCopyWith<$Res> get liveSettings;
  $VodSettingsCopyWith<$Res> get vodSettings;
  $ChatSettingsCopyWith<$Res> get chatSettings;
}

/// @nodoc
class _$SettingsPreferencesCopyWithImpl<$Res>
    implements $SettingsPreferencesCopyWith<$Res> {
  _$SettingsPreferencesCopyWithImpl(this._self, this._then);

  final SettingsPreferences _self;
  final $Res Function(SettingsPreferences) _then;

  /// Create a copy of SettingsPreferences
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? generalSetting = null,
    Object? liveSettings = null,
    Object? vodSettings = null,
    Object? chatSettings = null,
  }) {
    return _then(
      _self.copyWith(
        generalSetting: null == generalSetting
            ? _self.generalSetting
            : generalSetting // ignore: cast_nullable_to_non_nullable
                  as GeneralSetting,
        liveSettings: null == liveSettings
            ? _self.liveSettings
            : liveSettings // ignore: cast_nullable_to_non_nullable
                  as LiveSettings,
        vodSettings: null == vodSettings
            ? _self.vodSettings
            : vodSettings // ignore: cast_nullable_to_non_nullable
                  as VodSettings,
        chatSettings: null == chatSettings
            ? _self.chatSettings
            : chatSettings // ignore: cast_nullable_to_non_nullable
                  as ChatSettings,
      ),
    );
  }

  /// Create a copy of SettingsPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeneralSettingCopyWith<$Res> get generalSetting {
    return $GeneralSettingCopyWith<$Res>(_self.generalSetting, (value) {
      return _then(_self.copyWith(generalSetting: value));
    });
  }

  /// Create a copy of SettingsPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveSettingsCopyWith<$Res> get liveSettings {
    return $LiveSettingsCopyWith<$Res>(_self.liveSettings, (value) {
      return _then(_self.copyWith(liveSettings: value));
    });
  }

  /// Create a copy of SettingsPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodSettingsCopyWith<$Res> get vodSettings {
    return $VodSettingsCopyWith<$Res>(_self.vodSettings, (value) {
      return _then(_self.copyWith(vodSettings: value));
    });
  }

  /// Create a copy of SettingsPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatSettingsCopyWith<$Res> get chatSettings {
    return $ChatSettingsCopyWith<$Res>(_self.chatSettings, (value) {
      return _then(_self.copyWith(chatSettings: value));
    });
  }
}

/// Adds pattern-matching-related methods to [SettingsPreferences].
extension SettingsPreferencesPatterns on SettingsPreferences {
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
    TResult Function(_SettingsPreferences value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SettingsPreferences() when $default != null:
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
    TResult Function(_SettingsPreferences value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsPreferences():
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
    TResult? Function(_SettingsPreferences value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsPreferences() when $default != null:
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
      GeneralSetting generalSetting,
      LiveSettings liveSettings,
      VodSettings vodSettings,
      ChatSettings chatSettings,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SettingsPreferences() when $default != null:
        return $default(
          _that.generalSetting,
          _that.liveSettings,
          _that.vodSettings,
          _that.chatSettings,
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
      GeneralSetting generalSetting,
      LiveSettings liveSettings,
      VodSettings vodSettings,
      ChatSettings chatSettings,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsPreferences():
        return $default(
          _that.generalSetting,
          _that.liveSettings,
          _that.vodSettings,
          _that.chatSettings,
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
      GeneralSetting generalSetting,
      LiveSettings liveSettings,
      VodSettings vodSettings,
      ChatSettings chatSettings,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SettingsPreferences() when $default != null:
        return $default(
          _that.generalSetting,
          _that.liveSettings,
          _that.vodSettings,
          _that.chatSettings,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SettingsPreferences extends SettingsPreferences {
  const _SettingsPreferences({
    this.generalSetting = defaultGeneralSetting,
    this.liveSettings = defaultLiveSettings,
    this.vodSettings = defaultVodSettings,
    this.chatSettings = defaultChatSettings,
  }) : super._();
  factory _SettingsPreferences.fromJson(Map<String, dynamic> json) =>
      _$SettingsPreferencesFromJson(json);

  @override
  @JsonKey()
  final GeneralSetting generalSetting;
  @override
  @JsonKey()
  final LiveSettings liveSettings;
  @override
  @JsonKey()
  final VodSettings vodSettings;
  @override
  @JsonKey()
  final ChatSettings chatSettings;

  /// Create a copy of SettingsPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SettingsPreferencesCopyWith<_SettingsPreferences> get copyWith =>
      __$SettingsPreferencesCopyWithImpl<_SettingsPreferences>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$SettingsPreferencesToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SettingsPreferences &&
            (identical(other.generalSetting, generalSetting) ||
                other.generalSetting == generalSetting) &&
            (identical(other.liveSettings, liveSettings) ||
                other.liveSettings == liveSettings) &&
            (identical(other.vodSettings, vodSettings) ||
                other.vodSettings == vodSettings) &&
            (identical(other.chatSettings, chatSettings) ||
                other.chatSettings == chatSettings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    generalSetting,
    liveSettings,
    vodSettings,
    chatSettings,
  );

  @override
  String toString() {
    return 'SettingsPreferences(generalSetting: $generalSetting, liveSettings: $liveSettings, vodSettings: $vodSettings, chatSettings: $chatSettings)';
  }
}

/// @nodoc
abstract mixin class _$SettingsPreferencesCopyWith<$Res>
    implements $SettingsPreferencesCopyWith<$Res> {
  factory _$SettingsPreferencesCopyWith(
    _SettingsPreferences value,
    $Res Function(_SettingsPreferences) _then,
  ) = __$SettingsPreferencesCopyWithImpl;
  @override
  @useResult
  $Res call({
    GeneralSetting generalSetting,
    LiveSettings liveSettings,
    VodSettings vodSettings,
    ChatSettings chatSettings,
  });

  @override
  $GeneralSettingCopyWith<$Res> get generalSetting;
  @override
  $LiveSettingsCopyWith<$Res> get liveSettings;
  @override
  $VodSettingsCopyWith<$Res> get vodSettings;
  @override
  $ChatSettingsCopyWith<$Res> get chatSettings;
}

/// @nodoc
class __$SettingsPreferencesCopyWithImpl<$Res>
    implements _$SettingsPreferencesCopyWith<$Res> {
  __$SettingsPreferencesCopyWithImpl(this._self, this._then);

  final _SettingsPreferences _self;
  final $Res Function(_SettingsPreferences) _then;

  /// Create a copy of SettingsPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? generalSetting = null,
    Object? liveSettings = null,
    Object? vodSettings = null,
    Object? chatSettings = null,
  }) {
    return _then(
      _SettingsPreferences(
        generalSetting: null == generalSetting
            ? _self.generalSetting
            : generalSetting // ignore: cast_nullable_to_non_nullable
                  as GeneralSetting,
        liveSettings: null == liveSettings
            ? _self.liveSettings
            : liveSettings // ignore: cast_nullable_to_non_nullable
                  as LiveSettings,
        vodSettings: null == vodSettings
            ? _self.vodSettings
            : vodSettings // ignore: cast_nullable_to_non_nullable
                  as VodSettings,
        chatSettings: null == chatSettings
            ? _self.chatSettings
            : chatSettings // ignore: cast_nullable_to_non_nullable
                  as ChatSettings,
      ),
    );
  }

  /// Create a copy of SettingsPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $GeneralSettingCopyWith<$Res> get generalSetting {
    return $GeneralSettingCopyWith<$Res>(_self.generalSetting, (value) {
      return _then(_self.copyWith(generalSetting: value));
    });
  }

  /// Create a copy of SettingsPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LiveSettingsCopyWith<$Res> get liveSettings {
    return $LiveSettingsCopyWith<$Res>(_self.liveSettings, (value) {
      return _then(_self.copyWith(liveSettings: value));
    });
  }

  /// Create a copy of SettingsPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $VodSettingsCopyWith<$Res> get vodSettings {
    return $VodSettingsCopyWith<$Res>(_self.vodSettings, (value) {
      return _then(_self.copyWith(vodSettings: value));
    });
  }

  /// Create a copy of SettingsPreferences
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ChatSettingsCopyWith<$Res> get chatSettings {
    return $ChatSettingsCopyWith<$Res>(_self.chatSettings, (value) {
      return _then(_self.copyWith(chatSettings: value));
    });
  }
}
