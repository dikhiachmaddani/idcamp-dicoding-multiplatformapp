// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_stories_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$AddStoriesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function(String message) loaded,
    required TResult Function() loading,
    required TResult Function() none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function(String message)? loaded,
    TResult? Function()? loading,
    TResult? Function()? none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function(String message)? loaded,
    TResult Function()? loading,
    TResult Function()? none,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddStoriesErrorState value) error,
    required TResult Function(AddStoriesLoadedState value) loaded,
    required TResult Function(AddStoriesLoadingState value) loading,
    required TResult Function(AddStoriesNoneState value) none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddStoriesErrorState value)? error,
    TResult? Function(AddStoriesLoadedState value)? loaded,
    TResult? Function(AddStoriesLoadingState value)? loading,
    TResult? Function(AddStoriesNoneState value)? none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddStoriesErrorState value)? error,
    TResult Function(AddStoriesLoadedState value)? loaded,
    TResult Function(AddStoriesLoadingState value)? loading,
    TResult Function(AddStoriesNoneState value)? none,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddStoriesStateCopyWith<$Res> {
  factory $AddStoriesStateCopyWith(
    AddStoriesState value,
    $Res Function(AddStoriesState) then,
  ) = _$AddStoriesStateCopyWithImpl<$Res, AddStoriesState>;
}

/// @nodoc
class _$AddStoriesStateCopyWithImpl<$Res, $Val extends AddStoriesState>
    implements $AddStoriesStateCopyWith<$Res> {
  _$AddStoriesStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AddStoriesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddStoriesErrorStateImplCopyWith<$Res> {
  factory _$$AddStoriesErrorStateImplCopyWith(
    _$AddStoriesErrorStateImpl value,
    $Res Function(_$AddStoriesErrorStateImpl) then,
  ) = __$$AddStoriesErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AddStoriesErrorStateImplCopyWithImpl<$Res>
    extends _$AddStoriesStateCopyWithImpl<$Res, _$AddStoriesErrorStateImpl>
    implements _$$AddStoriesErrorStateImplCopyWith<$Res> {
  __$$AddStoriesErrorStateImplCopyWithImpl(
    _$AddStoriesErrorStateImpl _value,
    $Res Function(_$AddStoriesErrorStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddStoriesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$AddStoriesErrorStateImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$AddStoriesErrorStateImpl implements AddStoriesErrorState {
  const _$AddStoriesErrorStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AddStoriesState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStoriesErrorStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AddStoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddStoriesErrorStateImplCopyWith<_$AddStoriesErrorStateImpl>
  get copyWith =>
      __$$AddStoriesErrorStateImplCopyWithImpl<_$AddStoriesErrorStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function(String message) loaded,
    required TResult Function() loading,
    required TResult Function() none,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function(String message)? loaded,
    TResult? Function()? loading,
    TResult? Function()? none,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function(String message)? loaded,
    TResult Function()? loading,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddStoriesErrorState value) error,
    required TResult Function(AddStoriesLoadedState value) loaded,
    required TResult Function(AddStoriesLoadingState value) loading,
    required TResult Function(AddStoriesNoneState value) none,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddStoriesErrorState value)? error,
    TResult? Function(AddStoriesLoadedState value)? loaded,
    TResult? Function(AddStoriesLoadingState value)? loading,
    TResult? Function(AddStoriesNoneState value)? none,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddStoriesErrorState value)? error,
    TResult Function(AddStoriesLoadedState value)? loaded,
    TResult Function(AddStoriesLoadingState value)? loading,
    TResult Function(AddStoriesNoneState value)? none,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class AddStoriesErrorState implements AddStoriesState {
  const factory AddStoriesErrorState(final String message) =
      _$AddStoriesErrorStateImpl;

  String get message;

  /// Create a copy of AddStoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddStoriesErrorStateImplCopyWith<_$AddStoriesErrorStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddStoriesLoadedStateImplCopyWith<$Res> {
  factory _$$AddStoriesLoadedStateImplCopyWith(
    _$AddStoriesLoadedStateImpl value,
    $Res Function(_$AddStoriesLoadedStateImpl) then,
  ) = __$$AddStoriesLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$AddStoriesLoadedStateImplCopyWithImpl<$Res>
    extends _$AddStoriesStateCopyWithImpl<$Res, _$AddStoriesLoadedStateImpl>
    implements _$$AddStoriesLoadedStateImplCopyWith<$Res> {
  __$$AddStoriesLoadedStateImplCopyWithImpl(
    _$AddStoriesLoadedStateImpl _value,
    $Res Function(_$AddStoriesLoadedStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddStoriesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$AddStoriesLoadedStateImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$AddStoriesLoadedStateImpl implements AddStoriesLoadedState {
  const _$AddStoriesLoadedStateImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'AddStoriesState.loaded(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStoriesLoadedStateImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of AddStoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddStoriesLoadedStateImplCopyWith<_$AddStoriesLoadedStateImpl>
  get copyWith =>
      __$$AddStoriesLoadedStateImplCopyWithImpl<_$AddStoriesLoadedStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function(String message) loaded,
    required TResult Function() loading,
    required TResult Function() none,
  }) {
    return loaded(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function(String message)? loaded,
    TResult? Function()? loading,
    TResult? Function()? none,
  }) {
    return loaded?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function(String message)? loaded,
    TResult Function()? loading,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddStoriesErrorState value) error,
    required TResult Function(AddStoriesLoadedState value) loaded,
    required TResult Function(AddStoriesLoadingState value) loading,
    required TResult Function(AddStoriesNoneState value) none,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddStoriesErrorState value)? error,
    TResult? Function(AddStoriesLoadedState value)? loaded,
    TResult? Function(AddStoriesLoadingState value)? loading,
    TResult? Function(AddStoriesNoneState value)? none,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddStoriesErrorState value)? error,
    TResult Function(AddStoriesLoadedState value)? loaded,
    TResult Function(AddStoriesLoadingState value)? loading,
    TResult Function(AddStoriesNoneState value)? none,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class AddStoriesLoadedState implements AddStoriesState {
  const factory AddStoriesLoadedState(final String message) =
      _$AddStoriesLoadedStateImpl;

  String get message;

  /// Create a copy of AddStoriesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddStoriesLoadedStateImplCopyWith<_$AddStoriesLoadedStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddStoriesLoadingStateImplCopyWith<$Res> {
  factory _$$AddStoriesLoadingStateImplCopyWith(
    _$AddStoriesLoadingStateImpl value,
    $Res Function(_$AddStoriesLoadingStateImpl) then,
  ) = __$$AddStoriesLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddStoriesLoadingStateImplCopyWithImpl<$Res>
    extends _$AddStoriesStateCopyWithImpl<$Res, _$AddStoriesLoadingStateImpl>
    implements _$$AddStoriesLoadingStateImplCopyWith<$Res> {
  __$$AddStoriesLoadingStateImplCopyWithImpl(
    _$AddStoriesLoadingStateImpl _value,
    $Res Function(_$AddStoriesLoadingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddStoriesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddStoriesLoadingStateImpl implements AddStoriesLoadingState {
  const _$AddStoriesLoadingStateImpl();

  @override
  String toString() {
    return 'AddStoriesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStoriesLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function(String message) loaded,
    required TResult Function() loading,
    required TResult Function() none,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function(String message)? loaded,
    TResult? Function()? loading,
    TResult? Function()? none,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function(String message)? loaded,
    TResult Function()? loading,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddStoriesErrorState value) error,
    required TResult Function(AddStoriesLoadedState value) loaded,
    required TResult Function(AddStoriesLoadingState value) loading,
    required TResult Function(AddStoriesNoneState value) none,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddStoriesErrorState value)? error,
    TResult? Function(AddStoriesLoadedState value)? loaded,
    TResult? Function(AddStoriesLoadingState value)? loading,
    TResult? Function(AddStoriesNoneState value)? none,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddStoriesErrorState value)? error,
    TResult Function(AddStoriesLoadedState value)? loaded,
    TResult Function(AddStoriesLoadingState value)? loading,
    TResult Function(AddStoriesNoneState value)? none,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class AddStoriesLoadingState implements AddStoriesState {
  const factory AddStoriesLoadingState() = _$AddStoriesLoadingStateImpl;
}

/// @nodoc
abstract class _$$AddStoriesNoneStateImplCopyWith<$Res> {
  factory _$$AddStoriesNoneStateImplCopyWith(
    _$AddStoriesNoneStateImpl value,
    $Res Function(_$AddStoriesNoneStateImpl) then,
  ) = __$$AddStoriesNoneStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddStoriesNoneStateImplCopyWithImpl<$Res>
    extends _$AddStoriesStateCopyWithImpl<$Res, _$AddStoriesNoneStateImpl>
    implements _$$AddStoriesNoneStateImplCopyWith<$Res> {
  __$$AddStoriesNoneStateImplCopyWithImpl(
    _$AddStoriesNoneStateImpl _value,
    $Res Function(_$AddStoriesNoneStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of AddStoriesState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$AddStoriesNoneStateImpl implements AddStoriesNoneState {
  const _$AddStoriesNoneStateImpl();

  @override
  String toString() {
    return 'AddStoriesState.none()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddStoriesNoneStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) error,
    required TResult Function(String message) loaded,
    required TResult Function() loading,
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? error,
    TResult? Function(String message)? loaded,
    TResult? Function()? loading,
    TResult? Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? error,
    TResult Function(String message)? loaded,
    TResult Function()? loading,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddStoriesErrorState value) error,
    required TResult Function(AddStoriesLoadedState value) loaded,
    required TResult Function(AddStoriesLoadingState value) loading,
    required TResult Function(AddStoriesNoneState value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddStoriesErrorState value)? error,
    TResult? Function(AddStoriesLoadedState value)? loaded,
    TResult? Function(AddStoriesLoadingState value)? loading,
    TResult? Function(AddStoriesNoneState value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddStoriesErrorState value)? error,
    TResult Function(AddStoriesLoadedState value)? loaded,
    TResult Function(AddStoriesLoadingState value)? loading,
    TResult Function(AddStoriesNoneState value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class AddStoriesNoneState implements AddStoriesState {
  const factory AddStoriesNoneState() = _$AddStoriesNoneStateImpl;
}
