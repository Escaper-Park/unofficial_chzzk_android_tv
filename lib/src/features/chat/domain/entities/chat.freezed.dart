// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
mixin _$VideoChatPage {
  int? get nextPlayerMessageTime;
  List<VideoChatMessage> get previousMessages;
  List<VideoChatMessage> get messages;

  /// Create a copy of VideoChatPage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $VideoChatPageCopyWith<VideoChatPage> get copyWith =>
      _$VideoChatPageCopyWithImpl<VideoChatPage>(
        this as VideoChatPage,
        _$identity,
      );

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is VideoChatPage &&
            (identical(other.nextPlayerMessageTime, nextPlayerMessageTime) ||
                other.nextPlayerMessageTime == nextPlayerMessageTime) &&
            const DeepCollectionEquality().equals(
              other.previousMessages,
              previousMessages,
            ) &&
            const DeepCollectionEquality().equals(other.messages, messages));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    nextPlayerMessageTime,
    const DeepCollectionEquality().hash(previousMessages),
    const DeepCollectionEquality().hash(messages),
  );

  @override
  String toString() {
    return 'VideoChatPage(nextPlayerMessageTime: $nextPlayerMessageTime, previousMessages: $previousMessages, messages: $messages)';
  }
}

/// @nodoc
abstract mixin class $VideoChatPageCopyWith<$Res> {
  factory $VideoChatPageCopyWith(
    VideoChatPage value,
    $Res Function(VideoChatPage) _then,
  ) = _$VideoChatPageCopyWithImpl;
  @useResult
  $Res call({
    int? nextPlayerMessageTime,
    List<VideoChatMessage> previousMessages,
    List<VideoChatMessage> messages,
  });
}

/// @nodoc
class _$VideoChatPageCopyWithImpl<$Res>
    implements $VideoChatPageCopyWith<$Res> {
  _$VideoChatPageCopyWithImpl(this._self, this._then);

  final VideoChatPage _self;
  final $Res Function(VideoChatPage) _then;

  /// Create a copy of VideoChatPage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nextPlayerMessageTime = freezed,
    Object? previousMessages = null,
    Object? messages = null,
  }) {
    return _then(
      _self.copyWith(
        nextPlayerMessageTime: freezed == nextPlayerMessageTime
            ? _self.nextPlayerMessageTime
            : nextPlayerMessageTime // ignore: cast_nullable_to_non_nullable
                  as int?,
        previousMessages: null == previousMessages
            ? _self.previousMessages
            : previousMessages // ignore: cast_nullable_to_non_nullable
                  as List<VideoChatMessage>,
        messages: null == messages
            ? _self.messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<VideoChatMessage>,
      ),
    );
  }
}

/// Adds pattern-matching-related methods to [VideoChatPage].
extension VideoChatPagePatterns on VideoChatPage {
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
    TResult Function(_VideoChatPage value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoChatPage() when $default != null:
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
    TResult Function(_VideoChatPage value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoChatPage():
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
    TResult? Function(_VideoChatPage value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoChatPage() when $default != null:
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
      List<VideoChatMessage> previousMessages,
      List<VideoChatMessage> messages,
    )?
    $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _VideoChatPage() when $default != null:
        return $default(
          _that.nextPlayerMessageTime,
          _that.previousMessages,
          _that.messages,
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
      List<VideoChatMessage> previousMessages,
      List<VideoChatMessage> messages,
    )
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoChatPage():
        return $default(
          _that.nextPlayerMessageTime,
          _that.previousMessages,
          _that.messages,
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
      List<VideoChatMessage> previousMessages,
      List<VideoChatMessage> messages,
    )?
    $default,
  ) {
    final _that = this;
    switch (_that) {
      case _VideoChatPage() when $default != null:
        return $default(
          _that.nextPlayerMessageTime,
          _that.previousMessages,
          _that.messages,
        );
      case _:
        return null;
    }
  }
}

/// @nodoc

class _VideoChatPage implements VideoChatPage {
  const _VideoChatPage({
    this.nextPlayerMessageTime,
    final List<VideoChatMessage> previousMessages = const <VideoChatMessage>[],
    final List<VideoChatMessage> messages = const <VideoChatMessage>[],
  }) : _previousMessages = previousMessages,
       _messages = messages;

  @override
  final int? nextPlayerMessageTime;
  final List<VideoChatMessage> _previousMessages;
  @override
  @JsonKey()
  List<VideoChatMessage> get previousMessages {
    if (_previousMessages is EqualUnmodifiableListView)
      return _previousMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_previousMessages);
  }

  final List<VideoChatMessage> _messages;
  @override
  @JsonKey()
  List<VideoChatMessage> get messages {
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_messages);
  }

  /// Create a copy of VideoChatPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$VideoChatPageCopyWith<_VideoChatPage> get copyWith =>
      __$VideoChatPageCopyWithImpl<_VideoChatPage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _VideoChatPage &&
            (identical(other.nextPlayerMessageTime, nextPlayerMessageTime) ||
                other.nextPlayerMessageTime == nextPlayerMessageTime) &&
            const DeepCollectionEquality().equals(
              other._previousMessages,
              _previousMessages,
            ) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    nextPlayerMessageTime,
    const DeepCollectionEquality().hash(_previousMessages),
    const DeepCollectionEquality().hash(_messages),
  );

  @override
  String toString() {
    return 'VideoChatPage(nextPlayerMessageTime: $nextPlayerMessageTime, previousMessages: $previousMessages, messages: $messages)';
  }
}

/// @nodoc
abstract mixin class _$VideoChatPageCopyWith<$Res>
    implements $VideoChatPageCopyWith<$Res> {
  factory _$VideoChatPageCopyWith(
    _VideoChatPage value,
    $Res Function(_VideoChatPage) _then,
  ) = __$VideoChatPageCopyWithImpl;
  @override
  @useResult
  $Res call({
    int? nextPlayerMessageTime,
    List<VideoChatMessage> previousMessages,
    List<VideoChatMessage> messages,
  });
}

/// @nodoc
class __$VideoChatPageCopyWithImpl<$Res>
    implements _$VideoChatPageCopyWith<$Res> {
  __$VideoChatPageCopyWithImpl(this._self, this._then);

  final _VideoChatPage _self;
  final $Res Function(_VideoChatPage) _then;

  /// Create a copy of VideoChatPage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nextPlayerMessageTime = freezed,
    Object? previousMessages = null,
    Object? messages = null,
  }) {
    return _then(
      _VideoChatPage(
        nextPlayerMessageTime: freezed == nextPlayerMessageTime
            ? _self.nextPlayerMessageTime
            : nextPlayerMessageTime // ignore: cast_nullable_to_non_nullable
                  as int?,
        previousMessages: null == previousMessages
            ? _self._previousMessages
            : previousMessages // ignore: cast_nullable_to_non_nullable
                  as List<VideoChatMessage>,
        messages: null == messages
            ? _self._messages
            : messages // ignore: cast_nullable_to_non_nullable
                  as List<VideoChatMessage>,
      ),
    );
  }
}
