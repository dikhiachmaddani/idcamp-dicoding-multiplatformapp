// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detail_stories_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$DetailStoriesResultState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function(Stories data) loaded,
    required TResult Function() loading,
    required TResult Function() none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function(Stories data)? loaded,
    TResult? Function()? loading,
    TResult? Function()? none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function(Stories data)? loaded,
    TResult Function()? loading,
    TResult Function()? none,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailStoriesErrorState value) error,
    required TResult Function(DetailStoriesLoadedState value) loaded,
    required TResult Function(DetailStoriesLoadingState value) loading,
    required TResult Function(DetailStoriesNoneState value) none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailStoriesErrorState value)? error,
    TResult? Function(DetailStoriesLoadedState value)? loaded,
    TResult? Function(DetailStoriesLoadingState value)? loading,
    TResult? Function(DetailStoriesNoneState value)? none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailStoriesErrorState value)? error,
    TResult Function(DetailStoriesLoadedState value)? loaded,
    TResult Function(DetailStoriesLoadingState value)? loading,
    TResult Function(DetailStoriesNoneState value)? none,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailStoriesResultStateCopyWith<$Res> {
  factory $DetailStoriesResultStateCopyWith(
    DetailStoriesResultState value,
    $Res Function(DetailStoriesResultState) then,
  ) = _$DetailStoriesResultStateCopyWithImpl<$Res, DetailStoriesResultState>;
}

/// @nodoc
class _$DetailStoriesResultStateCopyWithImpl<
  $Res,
  $Val extends DetailStoriesResultState
>
    implements $DetailStoriesResultStateCopyWith<$Res> {
  _$DetailStoriesResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DetailStoriesResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$DetailStoriesErrorStateImplCopyWith<$Res> {
  factory _$$DetailStoriesErrorStateImplCopyWith(
    _$DetailStoriesErrorStateImpl value,
    $Res Function(_$DetailStoriesErrorStateImpl) then,
  ) = __$$DetailStoriesErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$DetailStoriesErrorStateImplCopyWithImpl<$Res>
    extends
        _$DetailStoriesResultStateCopyWithImpl<
          $Res,
          _$DetailStoriesErrorStateImpl
        >
    implements _$$DetailStoriesErrorStateImplCopyWith<$Res> {
  __$$DetailStoriesErrorStateImplCopyWithImpl(
    _$DetailStoriesErrorStateImpl _value,
    $Res Function(_$DetailStoriesErrorStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailStoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$DetailStoriesErrorStateImpl(
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$DetailStoriesErrorStateImpl implements DetailStoriesErrorState {
  const _$DetailStoriesErrorStateImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'DetailStoriesResultState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStoriesErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of DetailStoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailStoriesErrorStateImplCopyWith<_$DetailStoriesErrorStateImpl>
  get copyWith => __$$DetailStoriesErrorStateImplCopyWithImpl<
    _$DetailStoriesErrorStateImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function(Stories data) loaded,
    required TResult Function() loading,
    required TResult Function() none,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function(Stories data)? loaded,
    TResult? Function()? loading,
    TResult? Function()? none,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function(Stories data)? loaded,
    TResult Function()? loading,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailStoriesErrorState value) error,
    required TResult Function(DetailStoriesLoadedState value) loaded,
    required TResult Function(DetailStoriesLoadingState value) loading,
    required TResult Function(DetailStoriesNoneState value) none,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailStoriesErrorState value)? error,
    TResult? Function(DetailStoriesLoadedState value)? loaded,
    TResult? Function(DetailStoriesLoadingState value)? loading,
    TResult? Function(DetailStoriesNoneState value)? none,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailStoriesErrorState value)? error,
    TResult Function(DetailStoriesLoadedState value)? loaded,
    TResult Function(DetailStoriesLoadingState value)? loading,
    TResult Function(DetailStoriesNoneState value)? none,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class DetailStoriesErrorState implements DetailStoriesResultState {
  const factory DetailStoriesErrorState(final String error) =
      _$DetailStoriesErrorStateImpl;

  String get error;

  /// Create a copy of DetailStoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailStoriesErrorStateImplCopyWith<_$DetailStoriesErrorStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailStoriesLoadedStateImplCopyWith<$Res> {
  factory _$$DetailStoriesLoadedStateImplCopyWith(
    _$DetailStoriesLoadedStateImpl value,
    $Res Function(_$DetailStoriesLoadedStateImpl) then,
  ) = __$$DetailStoriesLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Stories data});

  $StoriesCopyWith<$Res> get data;
}

/// @nodoc
class __$$DetailStoriesLoadedStateImplCopyWithImpl<$Res>
    extends
        _$DetailStoriesResultStateCopyWithImpl<
          $Res,
          _$DetailStoriesLoadedStateImpl
        >
    implements _$$DetailStoriesLoadedStateImplCopyWith<$Res> {
  __$$DetailStoriesLoadedStateImplCopyWithImpl(
    _$DetailStoriesLoadedStateImpl _value,
    $Res Function(_$DetailStoriesLoadedStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailStoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$DetailStoriesLoadedStateImpl(
        null == data
            ? _value.data
            : data // ignore: cast_nullable_to_non_nullable
                as Stories,
      ),
    );
  }

  /// Create a copy of DetailStoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StoriesCopyWith<$Res> get data {
    return $StoriesCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$DetailStoriesLoadedStateImpl implements DetailStoriesLoadedState {
  const _$DetailStoriesLoadedStateImpl(this.data);

  @override
  final Stories data;

  @override
  String toString() {
    return 'DetailStoriesResultState.loaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStoriesLoadedStateImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of DetailStoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailStoriesLoadedStateImplCopyWith<_$DetailStoriesLoadedStateImpl>
  get copyWith => __$$DetailStoriesLoadedStateImplCopyWithImpl<
    _$DetailStoriesLoadedStateImpl
  >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function(Stories data) loaded,
    required TResult Function() loading,
    required TResult Function() none,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function(Stories data)? loaded,
    TResult? Function()? loading,
    TResult? Function()? none,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function(Stories data)? loaded,
    TResult Function()? loading,
    TResult Function()? none,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DetailStoriesErrorState value) error,
    required TResult Function(DetailStoriesLoadedState value) loaded,
    required TResult Function(DetailStoriesLoadingState value) loading,
    required TResult Function(DetailStoriesNoneState value) none,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailStoriesErrorState value)? error,
    TResult? Function(DetailStoriesLoadedState value)? loaded,
    TResult? Function(DetailStoriesLoadingState value)? loading,
    TResult? Function(DetailStoriesNoneState value)? none,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailStoriesErrorState value)? error,
    TResult Function(DetailStoriesLoadedState value)? loaded,
    TResult Function(DetailStoriesLoadingState value)? loading,
    TResult Function(DetailStoriesNoneState value)? none,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class DetailStoriesLoadedState implements DetailStoriesResultState {
  const factory DetailStoriesLoadedState(final Stories data) =
      _$DetailStoriesLoadedStateImpl;

  Stories get data;

  /// Create a copy of DetailStoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DetailStoriesLoadedStateImplCopyWith<_$DetailStoriesLoadedStateImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DetailStoriesLoadingStateImplCopyWith<$Res> {
  factory _$$DetailStoriesLoadingStateImplCopyWith(
    _$DetailStoriesLoadingStateImpl value,
    $Res Function(_$DetailStoriesLoadingStateImpl) then,
  ) = __$$DetailStoriesLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DetailStoriesLoadingStateImplCopyWithImpl<$Res>
    extends
        _$DetailStoriesResultStateCopyWithImpl<
          $Res,
          _$DetailStoriesLoadingStateImpl
        >
    implements _$$DetailStoriesLoadingStateImplCopyWith<$Res> {
  __$$DetailStoriesLoadingStateImplCopyWithImpl(
    _$DetailStoriesLoadingStateImpl _value,
    $Res Function(_$DetailStoriesLoadingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailStoriesResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DetailStoriesLoadingStateImpl implements DetailStoriesLoadingState {
  const _$DetailStoriesLoadingStateImpl();

  @override
  String toString() {
    return 'DetailStoriesResultState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStoriesLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function(Stories data) loaded,
    required TResult Function() loading,
    required TResult Function() none,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function(Stories data)? loaded,
    TResult? Function()? loading,
    TResult? Function()? none,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function(Stories data)? loaded,
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
    required TResult Function(DetailStoriesErrorState value) error,
    required TResult Function(DetailStoriesLoadedState value) loaded,
    required TResult Function(DetailStoriesLoadingState value) loading,
    required TResult Function(DetailStoriesNoneState value) none,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailStoriesErrorState value)? error,
    TResult? Function(DetailStoriesLoadedState value)? loaded,
    TResult? Function(DetailStoriesLoadingState value)? loading,
    TResult? Function(DetailStoriesNoneState value)? none,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailStoriesErrorState value)? error,
    TResult Function(DetailStoriesLoadedState value)? loaded,
    TResult Function(DetailStoriesLoadingState value)? loading,
    TResult Function(DetailStoriesNoneState value)? none,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class DetailStoriesLoadingState implements DetailStoriesResultState {
  const factory DetailStoriesLoadingState() = _$DetailStoriesLoadingStateImpl;
}

/// @nodoc
abstract class _$$DetailStoriesNoneStateImplCopyWith<$Res> {
  factory _$$DetailStoriesNoneStateImplCopyWith(
    _$DetailStoriesNoneStateImpl value,
    $Res Function(_$DetailStoriesNoneStateImpl) then,
  ) = __$$DetailStoriesNoneStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DetailStoriesNoneStateImplCopyWithImpl<$Res>
    extends
        _$DetailStoriesResultStateCopyWithImpl<
          $Res,
          _$DetailStoriesNoneStateImpl
        >
    implements _$$DetailStoriesNoneStateImplCopyWith<$Res> {
  __$$DetailStoriesNoneStateImplCopyWithImpl(
    _$DetailStoriesNoneStateImpl _value,
    $Res Function(_$DetailStoriesNoneStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DetailStoriesResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$DetailStoriesNoneStateImpl implements DetailStoriesNoneState {
  const _$DetailStoriesNoneStateImpl();

  @override
  String toString() {
    return 'DetailStoriesResultState.none()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailStoriesNoneStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function(Stories data) loaded,
    required TResult Function() loading,
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function(Stories data)? loaded,
    TResult? Function()? loading,
    TResult? Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function(Stories data)? loaded,
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
    required TResult Function(DetailStoriesErrorState value) error,
    required TResult Function(DetailStoriesLoadedState value) loaded,
    required TResult Function(DetailStoriesLoadingState value) loading,
    required TResult Function(DetailStoriesNoneState value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DetailStoriesErrorState value)? error,
    TResult? Function(DetailStoriesLoadedState value)? loaded,
    TResult? Function(DetailStoriesLoadingState value)? loading,
    TResult? Function(DetailStoriesNoneState value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DetailStoriesErrorState value)? error,
    TResult Function(DetailStoriesLoadedState value)? loaded,
    TResult Function(DetailStoriesLoadingState value)? loading,
    TResult Function(DetailStoriesNoneState value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class DetailStoriesNoneState implements DetailStoriesResultState {
  const factory DetailStoriesNoneState() = _$DetailStoriesNoneStateImpl;
}
