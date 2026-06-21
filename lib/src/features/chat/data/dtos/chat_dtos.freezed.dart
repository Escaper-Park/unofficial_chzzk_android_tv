// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_dtos.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatAccessTokenDto {
  String get accessToken;
  String get extraToken;

  /// Create a copy of ChatAccessTokenDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatAccessTokenDtoCopyWith<ChatAccessTokenDto> get copyWith =>
      _$ChatAccessTokenDtoCopyWithImpl<ChatAccessTokenDto>(
        this as ChatAccessTokenDto,
        _$identity,
      );

  /// Serializes this ChatAccessTokenDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatAccessTokenDto &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.extraToken, extraToken) ||
                other.extraToken == extraToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, extraToken);
}

/// @nodoc
abstract mixin class $ChatAccessTokenDtoCopyWith<$Res> {
  factory $ChatAccessTokenDtoCopyWith(
    ChatAccessTokenDto value,
    $Res Function(ChatAccessTokenDto) _then,
  ) = _$ChatAccessTokenDtoCopyWithImpl;
  @useResult
  $Res call({String accessToken, String extraToken});
}

/// @nodoc
class _$ChatAccessTokenDtoCopyWithImpl<$Res>
    implements $ChatAccessTokenDtoCopyWith<$Res> {
  _$ChatAccessTokenDtoCopyWithImpl(this._self, this._then);

  final ChatAccessTokenDto _self;
  final $Res Function(ChatAccessTokenDto) _then;

  /// Create a copy of ChatAccessTokenDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? accessToken = null, Object? extraToken = null}) {
    return _then(
      _self.copyWith(
        accessToken: null == accessToken
            ? _self.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String,
        extraToken: null == extraToken
            ? _self.extraToken
            : extraToken // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [ChatAccessTokenDto].
extension ChatAccessTokenDtoPatterns on ChatAccessTokenDto {
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
    TResult Function(_ChatAccessTokenDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatAccessTokenDto() when $default != null:
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
    TResult Function(_ChatAccessTokenDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatAccessTokenDto():
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
    TResult? Function(_ChatAccessTokenDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatAccessTokenDto() when $default != null:
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
    TResult Function(String accessToken, String extraToken)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChatAccessTokenDto() when $default != null:
        return $default(_that.accessToken, _that.extraToken);
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
    TResult Function(String accessToken, String extraToken) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatAccessTokenDto():
        return $default(_that.accessToken, _that.extraToken);
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
    TResult? Function(String accessToken, String extraToken)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ChatAccessTokenDto() when $default != null:
        return $default(_that.accessToken, _that.extraToken);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ChatAccessTokenDto implements ChatAccessTokenDto {
  const _ChatAccessTokenDto({
    required this.accessToken,
    required this.extraToken,
  });
  factory _ChatAccessTokenDto.fromJson(Map<String, dynamic> json) =>
      _$ChatAccessTokenDtoFromJson(json);

  @override
  final String accessToken;
  @override
  final String extraToken;

  /// Create a copy of ChatAccessTokenDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatAccessTokenDtoCopyWith<_ChatAccessTokenDto> get copyWith =>
      __$ChatAccessTokenDtoCopyWithImpl<_ChatAccessTokenDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatAccessTokenDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatAccessTokenDto &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.extraToken, extraToken) ||
                other.extraToken == extraToken));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, extraToken);
}

/// @nodoc
abstract mixin class _$ChatAccessTokenDtoCopyWith<$Res>
    implements $ChatAccessTokenDtoCopyWith<$Res> {
  factory _$ChatAccessTokenDtoCopyWith(
    _ChatAccessTokenDto value,
    $Res Function(_ChatAccessTokenDto) _then,
  ) = __$ChatAccessTokenDtoCopyWithImpl;
  @override
  @useResult
  $Res call({String accessToken, String extraToken});
}

/// @nodoc
class __$ChatAccessTokenDtoCopyWithImpl<$Res>
    implements _$ChatAccessTokenDtoCopyWith<$Res> {
  __$ChatAccessTokenDtoCopyWithImpl(this._self, this._then);

  final _ChatAccessTokenDto _self;
  final $Res Function(_ChatAccessTokenDto) _then;

  /// Create a copy of ChatAccessTokenDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({Object? accessToken = null, Object? extraToken = null}) {
    return _then(
      _ChatAccessTokenDto(
        accessToken: null == accessToken
            ? _self.accessToken
            : accessToken // ignore: cast_nullable_to_non_nullable
                  as String,
        extraToken: null == extraToken
            ? _self.extraToken
            : extraToken // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
mixin _$VideoChatListDto {
  int? get nextPlayerMessageTime;
  List<VideoChatMessageDto> get previousVideoChats;
  List<VideoChatMessageDto> get videoChats;

  /// Create a copy of VideoChatListDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoChatListDtoCopyWith<VideoChatListDto> get copyWith =>
      _$VideoChatListDtoCopyWithImpl<VideoChatListDto>(
        this as VideoChatListDto,
        _$identity,
      );

  /// Serializes this VideoChatListDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoChatListDto &&
            (identical(other.nextPlayerMessageTime, nextPlayerMessageTime) ||
                other.nextPlayerMessageTime == nextPlayerMessageTime) &&
            const DeepCollectionEquality().equals(
              other.previousVideoChats,
              previousVideoChats,
            ) &&
            const DeepCollectionEquality().equals(
              other.videoChats,
              videoChats,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    nextPlayerMessageTime,
    const DeepCollectionEquality().hash(previousVideoChats),
    const DeepCollectionEquality().hash(videoChats),
  );

  @override
  String toString() {
    return 'VideoChatListDto(nextPlayerMessageTime: $nextPlayerMessageTime, previousVideoChats: $previousVideoChats, videoChats: $videoChats)';
  }
}

/// @nodoc
abstract mixin class $VideoChatListDtoCopyWith<$Res> {
  factory $VideoChatListDtoCopyWith(
    VideoChatListDto value,
    $Res Function(VideoChatListDto) _then,
  ) = _$VideoChatListDtoCopyWithImpl;
  @useResult
  $Res call({
    int? nextPlayerMessageTime,
    List<VideoChatMessageDto> previousVideoChats,
    List<VideoChatMessageDto> videoChats,
  });
}

/// @nodoc
class _$VideoChatListDtoCopyWithImpl<$Res>
    implements $VideoChatListDtoCopyWith<$Res> {
  _$VideoChatListDtoCopyWithImpl(this._self, this._then);

  final VideoChatListDto _self;
  final $Res Function(VideoChatListDto) _then;

  /// Create a copy of VideoChatListDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextPlayerMessageTime = freezed,
    Object? previousVideoChats = null,
    Object? videoChats = null,
  }) {
    return _then(
      _self.copyWith(
        nextPlayerMessageTime: freezed == nextPlayerMessageTime
            ? _self.nextPlayerMessageTime
            : nextPlayerMessageTime // ignore: cast_nullable_to_non_nullable
                  as int?,
        previousVideoChats: null == previousVideoChats
            ? _self.previousVideoChats
            : previousVideoChats // ignore: cast_nullable_to_non_nullable
                  as List<VideoChatMessageDto>,
        videoChats: null == videoChats
            ? _self.videoChats
            : videoChats // ignore: cast_nullable_to_non_nullable
                  as List<VideoChatMessageDto>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VideoChatListDto].
extension VideoChatListDtoPatterns on VideoChatListDto {
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
    TResult Function(_VideoChatListDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoChatListDto() when $default != null:
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
    TResult Function(_VideoChatListDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoChatListDto():
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
    TResult? Function(_VideoChatListDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoChatListDto() when $default != null:
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
      int? nextPlayerMessageTime,
      List<VideoChatMessageDto> previousVideoChats,
      List<VideoChatMessageDto> videoChats,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoChatListDto() when $default != null:
        return $default(
          _that.nextPlayerMessageTime,
          _that.previousVideoChats,
          _that.videoChats,
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
      int? nextPlayerMessageTime,
      List<VideoChatMessageDto> previousVideoChats,
      List<VideoChatMessageDto> videoChats,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoChatListDto():
        return $default(
          _that.nextPlayerMessageTime,
          _that.previousVideoChats,
          _that.videoChats,
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
      int? nextPlayerMessageTime,
      List<VideoChatMessageDto> previousVideoChats,
      List<VideoChatMessageDto> videoChats,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoChatListDto() when $default != null:
        return $default(
          _that.nextPlayerMessageTime,
          _that.previousVideoChats,
          _that.videoChats,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VideoChatListDto implements VideoChatListDto {
  const _VideoChatListDto({
    this.nextPlayerMessageTime,
    final List<VideoChatMessageDto> previousVideoChats =
        const <VideoChatMessageDto>[],
    final List<VideoChatMessageDto> videoChats = const <VideoChatMessageDto>[],
  }) : _previousVideoChats = previousVideoChats,
       _videoChats = videoChats;
  factory _VideoChatListDto.fromJson(Map<String, dynamic> json) =>
      _$VideoChatListDtoFromJson(json);

  @override
  final int? nextPlayerMessageTime;
  final List<VideoChatMessageDto> _previousVideoChats;
  @override
  @JsonKey()
  List<VideoChatMessageDto> get previousVideoChats {
    if (_previousVideoChats is EqualUnmodifiableListView)
      return _previousVideoChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_previousVideoChats);
  }

  final List<VideoChatMessageDto> _videoChats;
  @override
  @JsonKey()
  List<VideoChatMessageDto> get videoChats {
    if (_videoChats is EqualUnmodifiableListView) return _videoChats;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_videoChats);
  }

  /// Create a copy of VideoChatListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VideoChatListDtoCopyWith<_VideoChatListDto> get copyWith =>
      __$VideoChatListDtoCopyWithImpl<_VideoChatListDto>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$VideoChatListDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoChatListDto &&
            (identical(other.nextPlayerMessageTime, nextPlayerMessageTime) ||
                other.nextPlayerMessageTime == nextPlayerMessageTime) &&
            const DeepCollectionEquality().equals(
              other._previousVideoChats,
              _previousVideoChats,
            ) &&
            const DeepCollectionEquality().equals(
              other._videoChats,
              _videoChats,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    nextPlayerMessageTime,
    const DeepCollectionEquality().hash(_previousVideoChats),
    const DeepCollectionEquality().hash(_videoChats),
  );

  @override
  String toString() {
    return 'VideoChatListDto(nextPlayerMessageTime: $nextPlayerMessageTime, previousVideoChats: $previousVideoChats, videoChats: $videoChats)';
  }
}

/// @nodoc
abstract mixin class _$VideoChatListDtoCopyWith<$Res>
    implements $VideoChatListDtoCopyWith<$Res> {
  factory _$VideoChatListDtoCopyWith(
    _VideoChatListDto value,
    $Res Function(_VideoChatListDto) _then,
  ) = __$VideoChatListDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    int? nextPlayerMessageTime,
    List<VideoChatMessageDto> previousVideoChats,
    List<VideoChatMessageDto> videoChats,
  });
}

/// @nodoc
class __$VideoChatListDtoCopyWithImpl<$Res>
    implements _$VideoChatListDtoCopyWith<$Res> {
  __$VideoChatListDtoCopyWithImpl(this._self, this._then);

  final _VideoChatListDto _self;
  final $Res Function(_VideoChatListDto) _then;

  /// Create a copy of VideoChatListDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nextPlayerMessageTime = freezed,
    Object? previousVideoChats = null,
    Object? videoChats = null,
  }) {
    return _then(
      _VideoChatListDto(
        nextPlayerMessageTime: freezed == nextPlayerMessageTime
            ? _self.nextPlayerMessageTime
            : nextPlayerMessageTime // ignore: cast_nullable_to_non_nullable
                  as int?,
        previousVideoChats: null == previousVideoChats
            ? _self._previousVideoChats
            : previousVideoChats // ignore: cast_nullable_to_non_nullable
                  as List<VideoChatMessageDto>,
        videoChats: null == videoChats
            ? _self._videoChats
            : videoChats // ignore: cast_nullable_to_non_nullable
                  as List<VideoChatMessageDto>,
      ),
    );
  }
}

/// @nodoc
mixin _$VideoChatMessageDto {
  String get chatChannelId;
  String get content;
  Object? get extras;
  String get messageStatusType;
  int get messageTime;
  int get messageTypeCode;
  int get playerMessageTime;
  Object? get profile;
  String get userIdHash;

  /// Create a copy of VideoChatMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoChatMessageDtoCopyWith<VideoChatMessageDto> get copyWith =>
      _$VideoChatMessageDtoCopyWithImpl<VideoChatMessageDto>(
        this as VideoChatMessageDto,
        _$identity,
      );

  /// Serializes this VideoChatMessageDto to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoChatMessageDto &&
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other.extras, extras) &&
            (identical(other.messageStatusType, messageStatusType) ||
                other.messageStatusType == messageStatusType) &&
            (identical(other.messageTime, messageTime) ||
                other.messageTime == messageTime) &&
            (identical(other.messageTypeCode, messageTypeCode) ||
                other.messageTypeCode == messageTypeCode) &&
            (identical(other.playerMessageTime, playerMessageTime) ||
                other.playerMessageTime == playerMessageTime) &&
            const DeepCollectionEquality().equals(other.profile, profile) &&
            (identical(other.userIdHash, userIdHash) ||
                other.userIdHash == userIdHash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    chatChannelId,
    content,
    const DeepCollectionEquality().hash(extras),
    messageStatusType,
    messageTime,
    messageTypeCode,
    playerMessageTime,
    const DeepCollectionEquality().hash(profile),
    userIdHash,
  );

  @override
  String toString() {
    return 'VideoChatMessageDto(chatChannelId: $chatChannelId, content: $content, extras: $extras, messageStatusType: $messageStatusType, messageTime: $messageTime, messageTypeCode: $messageTypeCode, playerMessageTime: $playerMessageTime, profile: $profile, userIdHash: $userIdHash)';
  }
}

/// @nodoc
abstract mixin class $VideoChatMessageDtoCopyWith<$Res> {
  factory $VideoChatMessageDtoCopyWith(
    VideoChatMessageDto value,
    $Res Function(VideoChatMessageDto) _then,
  ) = _$VideoChatMessageDtoCopyWithImpl;
  @useResult
  $Res call({
    String chatChannelId,
    String content,
    Object? extras,
    String messageStatusType,
    int messageTime,
    int messageTypeCode,
    int playerMessageTime,
    Object? profile,
    String userIdHash,
  });
}

/// @nodoc
class _$VideoChatMessageDtoCopyWithImpl<$Res>
    implements $VideoChatMessageDtoCopyWith<$Res> {
  _$VideoChatMessageDtoCopyWithImpl(this._self, this._then);

  final VideoChatMessageDto _self;
  final $Res Function(VideoChatMessageDto) _then;

  /// Create a copy of VideoChatMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? chatChannelId = null,
    Object? content = null,
    Object? extras = freezed,
    Object? messageStatusType = null,
    Object? messageTime = null,
    Object? messageTypeCode = null,
    Object? playerMessageTime = null,
    Object? profile = freezed,
    Object? userIdHash = null,
  }) {
    return _then(
      _self.copyWith(
        chatChannelId: null == chatChannelId
            ? _self.chatChannelId
            : chatChannelId // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _self.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        extras: freezed == extras ? _self.extras : extras,
        messageStatusType: null == messageStatusType
            ? _self.messageStatusType
            : messageStatusType // ignore: cast_nullable_to_non_nullable
                  as String,
        messageTime: null == messageTime
            ? _self.messageTime
            : messageTime // ignore: cast_nullable_to_non_nullable
                  as int,
        messageTypeCode: null == messageTypeCode
            ? _self.messageTypeCode
            : messageTypeCode // ignore: cast_nullable_to_non_nullable
                  as int,
        playerMessageTime: null == playerMessageTime
            ? _self.playerMessageTime
            : playerMessageTime // ignore: cast_nullable_to_non_nullable
                  as int,
        profile: freezed == profile ? _self.profile : profile,
        userIdHash: null == userIdHash
            ? _self.userIdHash
            : userIdHash // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VideoChatMessageDto].
extension VideoChatMessageDtoPatterns on VideoChatMessageDto {
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
    TResult Function(_VideoChatMessageDto value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoChatMessageDto() when $default != null:
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
    TResult Function(_VideoChatMessageDto value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoChatMessageDto():
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
    TResult? Function(_VideoChatMessageDto value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoChatMessageDto() when $default != null:
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
      String chatChannelId,
      String content,
      Object? extras,
      String messageStatusType,
      int messageTime,
      int messageTypeCode,
      int playerMessageTime,
      Object? profile,
      String userIdHash,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoChatMessageDto() when $default != null:
        return $default(
          _that.chatChannelId,
          _that.content,
          _that.extras,
          _that.messageStatusType,
          _that.messageTime,
          _that.messageTypeCode,
          _that.playerMessageTime,
          _that.profile,
          _that.userIdHash,
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
      String chatChannelId,
      String content,
      Object? extras,
      String messageStatusType,
      int messageTime,
      int messageTypeCode,
      int playerMessageTime,
      Object? profile,
      String userIdHash,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoChatMessageDto():
        return $default(
          _that.chatChannelId,
          _that.content,
          _that.extras,
          _that.messageStatusType,
          _that.messageTime,
          _that.messageTypeCode,
          _that.playerMessageTime,
          _that.profile,
          _that.userIdHash,
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
      String chatChannelId,
      String content,
      Object? extras,
      String messageStatusType,
      int messageTime,
      int messageTypeCode,
      int playerMessageTime,
      Object? profile,
      String userIdHash,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoChatMessageDto() when $default != null:
        return $default(
          _that.chatChannelId,
          _that.content,
          _that.extras,
          _that.messageStatusType,
          _that.messageTime,
          _that.messageTypeCode,
          _that.playerMessageTime,
          _that.profile,
          _that.userIdHash,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _VideoChatMessageDto implements VideoChatMessageDto {
  const _VideoChatMessageDto({
    this.chatChannelId = '',
    this.content = '',
    this.extras,
    this.messageStatusType = '',
    this.messageTime = 0,
    this.messageTypeCode = 0,
    this.playerMessageTime = 0,
    this.profile,
    this.userIdHash = '',
  });
  factory _VideoChatMessageDto.fromJson(Map<String, dynamic> json) =>
      _$VideoChatMessageDtoFromJson(json);

  @override
  @JsonKey()
  final String chatChannelId;
  @override
  @JsonKey()
  final String content;
  @override
  final Object? extras;
  @override
  @JsonKey()
  final String messageStatusType;
  @override
  @JsonKey()
  final int messageTime;
  @override
  @JsonKey()
  final int messageTypeCode;
  @override
  @JsonKey()
  final int playerMessageTime;
  @override
  final Object? profile;
  @override
  @JsonKey()
  final String userIdHash;

  /// Create a copy of VideoChatMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VideoChatMessageDtoCopyWith<_VideoChatMessageDto> get copyWith =>
      __$VideoChatMessageDtoCopyWithImpl<_VideoChatMessageDto>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$VideoChatMessageDtoToJson(this);
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoChatMessageDto &&
            (identical(other.chatChannelId, chatChannelId) ||
                other.chatChannelId == chatChannelId) &&
            (identical(other.content, content) || other.content == content) &&
            const DeepCollectionEquality().equals(other.extras, extras) &&
            (identical(other.messageStatusType, messageStatusType) ||
                other.messageStatusType == messageStatusType) &&
            (identical(other.messageTime, messageTime) ||
                other.messageTime == messageTime) &&
            (identical(other.messageTypeCode, messageTypeCode) ||
                other.messageTypeCode == messageTypeCode) &&
            (identical(other.playerMessageTime, playerMessageTime) ||
                other.playerMessageTime == playerMessageTime) &&
            const DeepCollectionEquality().equals(other.profile, profile) &&
            (identical(other.userIdHash, userIdHash) ||
                other.userIdHash == userIdHash));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    chatChannelId,
    content,
    const DeepCollectionEquality().hash(extras),
    messageStatusType,
    messageTime,
    messageTypeCode,
    playerMessageTime,
    const DeepCollectionEquality().hash(profile),
    userIdHash,
  );

  @override
  String toString() {
    return 'VideoChatMessageDto(chatChannelId: $chatChannelId, content: $content, extras: $extras, messageStatusType: $messageStatusType, messageTime: $messageTime, messageTypeCode: $messageTypeCode, playerMessageTime: $playerMessageTime, profile: $profile, userIdHash: $userIdHash)';
  }
}

/// @nodoc
abstract mixin class _$VideoChatMessageDtoCopyWith<$Res>
    implements $VideoChatMessageDtoCopyWith<$Res> {
  factory _$VideoChatMessageDtoCopyWith(
    _VideoChatMessageDto value,
    $Res Function(_VideoChatMessageDto) _then,
  ) = __$VideoChatMessageDtoCopyWithImpl;
  @override
  @useResult
  $Res call({
    String chatChannelId,
    String content,
    Object? extras,
    String messageStatusType,
    int messageTime,
    int messageTypeCode,
    int playerMessageTime,
    Object? profile,
    String userIdHash,
  });
}

/// @nodoc
class __$VideoChatMessageDtoCopyWithImpl<$Res>
    implements _$VideoChatMessageDtoCopyWith<$Res> {
  __$VideoChatMessageDtoCopyWithImpl(this._self, this._then);

  final _VideoChatMessageDto _self;
  final $Res Function(_VideoChatMessageDto) _then;

  /// Create a copy of VideoChatMessageDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? chatChannelId = null,
    Object? content = null,
    Object? extras = freezed,
    Object? messageStatusType = null,
    Object? messageTime = null,
    Object? messageTypeCode = null,
    Object? playerMessageTime = null,
    Object? profile = freezed,
    Object? userIdHash = null,
  }) {
    return _then(
      _VideoChatMessageDto(
        chatChannelId: null == chatChannelId
            ? _self.chatChannelId
            : chatChannelId // ignore: cast_nullable_to_non_nullable
                  as String,
        content: null == content
            ? _self.content
            : content // ignore: cast_nullable_to_non_nullable
                  as String,
        extras: freezed == extras ? _self.extras : extras,
        messageStatusType: null == messageStatusType
            ? _self.messageStatusType
            : messageStatusType // ignore: cast_nullable_to_non_nullable
                  as String,
        messageTime: null == messageTime
            ? _self.messageTime
            : messageTime // ignore: cast_nullable_to_non_nullable
                  as int,
        messageTypeCode: null == messageTypeCode
            ? _self.messageTypeCode
            : messageTypeCode // ignore: cast_nullable_to_non_nullable
                  as int,
        playerMessageTime: null == playerMessageTime
            ? _self.playerMessageTime
            : playerMessageTime // ignore: cast_nullable_to_non_nullable
                  as int,
        profile: freezed == profile ? _self.profile : profile,
        userIdHash: null == userIdHash
            ? _self.userIdHash
            : userIdHash // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}
