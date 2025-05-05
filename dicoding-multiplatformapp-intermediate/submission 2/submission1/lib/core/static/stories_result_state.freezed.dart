// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stories_result_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StoriesResultState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function(List<Stories> data) loaded,
    required TResult Function() loading,
    required TResult Function() none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function(List<Stories> data)? loaded,
    TResult? Function()? loading,
    TResult? Function()? none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function(List<Stories> data)? loaded,
    TResult Function()? loading,
    TResult Function()? none,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(StoriesErrorState value) error,
    required TResult Function(StoriesLoadedState value) loaded,
    required TResult Function(StoriesLoadingState value) loading,
    required TResult Function(StoriesNoneState value) none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoriesErrorState value)? error,
    TResult? Function(StoriesLoadedState value)? loaded,
    TResult? Function(StoriesLoadingState value)? loading,
    TResult? Function(StoriesNoneState value)? none,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoriesErrorState value)? error,
    TResult Function(StoriesLoadedState value)? loaded,
    TResult Function(StoriesLoadingState value)? loading,
    TResult Function(StoriesNoneState value)? none,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoriesResultStateCopyWith<$Res> {
  factory $StoriesResultStateCopyWith(
    StoriesResultState value,
    $Res Function(StoriesResultState) then,
  ) = _$StoriesResultStateCopyWithImpl<$Res, StoriesResultState>;
}

/// @nodoc
class _$StoriesResultStateCopyWithImpl<$Res, $Val extends StoriesResultState>
    implements $StoriesResultStateCopyWith<$Res> {
  _$StoriesResultStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$StoriesErrorStateImplCopyWith<$Res> {
  factory _$$StoriesErrorStateImplCopyWith(
    _$StoriesErrorStateImpl value,
    $Res Function(_$StoriesErrorStateImpl) then,
  ) = __$$StoriesErrorStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$StoriesErrorStateImplCopyWithImpl<$Res>
    extends _$StoriesResultStateCopyWithImpl<$Res, _$StoriesErrorStateImpl>
    implements _$$StoriesErrorStateImplCopyWith<$Res> {
  __$$StoriesErrorStateImplCopyWithImpl(
    _$StoriesErrorStateImpl _value,
    $Res Function(_$StoriesErrorStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? error = null}) {
    return _then(
      _$StoriesErrorStateImpl(
        null == error
            ? _value.error
            : error // ignore: cast_nullable_to_non_nullable
                as String,
      ),
    );
  }
}

/// @nodoc

class _$StoriesErrorStateImpl implements StoriesErrorState {
  const _$StoriesErrorStateImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'StoriesResultState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoriesErrorStateImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoriesErrorStateImplCopyWith<_$StoriesErrorStateImpl> get copyWith =>
      __$$StoriesErrorStateImplCopyWithImpl<_$StoriesErrorStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function(List<Stories> data) loaded,
    required TResult Function() loading,
    required TResult Function() none,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function(List<Stories> data)? loaded,
    TResult? Function()? loading,
    TResult? Function()? none,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function(List<Stories> data)? loaded,
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
    required TResult Function(StoriesErrorState value) error,
    required TResult Function(StoriesLoadedState value) loaded,
    required TResult Function(StoriesLoadingState value) loading,
    required TResult Function(StoriesNoneState value) none,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoriesErrorState value)? error,
    TResult? Function(StoriesLoadedState value)? loaded,
    TResult? Function(StoriesLoadingState value)? loading,
    TResult? Function(StoriesNoneState value)? none,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoriesErrorState value)? error,
    TResult Function(StoriesLoadedState value)? loaded,
    TResult Function(StoriesLoadingState value)? loading,
    TResult Function(StoriesNoneState value)? none,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class StoriesErrorState implements StoriesResultState {
  const factory StoriesErrorState(final String error) = _$StoriesErrorStateImpl;

  String get error;

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoriesErrorStateImplCopyWith<_$StoriesErrorStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoriesLoadedStateImplCopyWith<$Res> {
  factory _$$StoriesLoadedStateImplCopyWith(
    _$StoriesLoadedStateImpl value,
    $Res Function(_$StoriesLoadedStateImpl) then,
  ) = __$$StoriesLoadedStateImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Stories> data});
}

/// @nodoc
class __$$StoriesLoadedStateImplCopyWithImpl<$Res>
    extends _$StoriesResultStateCopyWithImpl<$Res, _$StoriesLoadedStateImpl>
    implements _$$StoriesLoadedStateImplCopyWith<$Res> {
  __$$StoriesLoadedStateImplCopyWithImpl(
    _$StoriesLoadedStateImpl _value,
    $Res Function(_$StoriesLoadedStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? data = null}) {
    return _then(
      _$StoriesLoadedStateImpl(
        null == data
            ? _value._data
            : data // ignore: cast_nullable_to_non_nullable
                as List<Stories>,
      ),
    );
  }
}

/// @nodoc

class _$StoriesLoadedStateImpl implements StoriesLoadedState {
  const _$StoriesLoadedStateImpl(final List<Stories> data) : _data = data;

  final List<Stories> _data;
  @override
  List<Stories> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'StoriesResultState.loaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoriesLoadedStateImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoriesLoadedStateImplCopyWith<_$StoriesLoadedStateImpl> get copyWith =>
      __$$StoriesLoadedStateImplCopyWithImpl<_$StoriesLoadedStateImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function(List<Stories> data) loaded,
    required TResult Function() loading,
    required TResult Function() none,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function(List<Stories> data)? loaded,
    TResult? Function()? loading,
    TResult? Function()? none,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function(List<Stories> data)? loaded,
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
    required TResult Function(StoriesErrorState value) error,
    required TResult Function(StoriesLoadedState value) loaded,
    required TResult Function(StoriesLoadingState value) loading,
    required TResult Function(StoriesNoneState value) none,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoriesErrorState value)? error,
    TResult? Function(StoriesLoadedState value)? loaded,
    TResult? Function(StoriesLoadingState value)? loading,
    TResult? Function(StoriesNoneState value)? none,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoriesErrorState value)? error,
    TResult Function(StoriesLoadedState value)? loaded,
    TResult Function(StoriesLoadingState value)? loading,
    TResult Function(StoriesNoneState value)? none,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class StoriesLoadedState implements StoriesResultState {
  const factory StoriesLoadedState(final List<Stories> data) =
      _$StoriesLoadedStateImpl;

  List<Stories> get data;

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoriesLoadedStateImplCopyWith<_$StoriesLoadedStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$StoriesLoadingStateImplCopyWith<$Res> {
  factory _$$StoriesLoadingStateImplCopyWith(
    _$StoriesLoadingStateImpl value,
    $Res Function(_$StoriesLoadingStateImpl) then,
  ) = __$$StoriesLoadingStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StoriesLoadingStateImplCopyWithImpl<$Res>
    extends _$StoriesResultStateCopyWithImpl<$Res, _$StoriesLoadingStateImpl>
    implements _$$StoriesLoadingStateImplCopyWith<$Res> {
  __$$StoriesLoadingStateImplCopyWithImpl(
    _$StoriesLoadingStateImpl _value,
    $Res Function(_$StoriesLoadingStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StoriesLoadingStateImpl implements StoriesLoadingState {
  const _$StoriesLoadingStateImpl();

  @override
  String toString() {
    return 'StoriesResultState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoriesLoadingStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function(List<Stories> data) loaded,
    required TResult Function() loading,
    required TResult Function() none,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function(List<Stories> data)? loaded,
    TResult? Function()? loading,
    TResult? Function()? none,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function(List<Stories> data)? loaded,
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
    required TResult Function(StoriesErrorState value) error,
    required TResult Function(StoriesLoadedState value) loaded,
    required TResult Function(StoriesLoadingState value) loading,
    required TResult Function(StoriesNoneState value) none,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoriesErrorState value)? error,
    TResult? Function(StoriesLoadedState value)? loaded,
    TResult? Function(StoriesLoadingState value)? loading,
    TResult? Function(StoriesNoneState value)? none,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoriesErrorState value)? error,
    TResult Function(StoriesLoadedState value)? loaded,
    TResult Function(StoriesLoadingState value)? loading,
    TResult Function(StoriesNoneState value)? none,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class StoriesLoadingState implements StoriesResultState {
  const factory StoriesLoadingState() = _$StoriesLoadingStateImpl;
}

/// @nodoc
abstract class _$$StoriesNoneStateImplCopyWith<$Res> {
  factory _$$StoriesNoneStateImplCopyWith(
    _$StoriesNoneStateImpl value,
    $Res Function(_$StoriesNoneStateImpl) then,
  ) = __$$StoriesNoneStateImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StoriesNoneStateImplCopyWithImpl<$Res>
    extends _$StoriesResultStateCopyWithImpl<$Res, _$StoriesNoneStateImpl>
    implements _$$StoriesNoneStateImplCopyWith<$Res> {
  __$$StoriesNoneStateImplCopyWithImpl(
    _$StoriesNoneStateImpl _value,
    $Res Function(_$StoriesNoneStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoriesResultState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$StoriesNoneStateImpl implements StoriesNoneState {
  const _$StoriesNoneStateImpl();

  @override
  String toString() {
    return 'StoriesResultState.none()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StoriesNoneStateImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String error) error,
    required TResult Function(List<Stories> data) loaded,
    required TResult Function() loading,
    required TResult Function() none,
  }) {
    return none();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String error)? error,
    TResult? Function(List<Stories> data)? loaded,
    TResult? Function()? loading,
    TResult? Function()? none,
  }) {
    return none?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String error)? error,
    TResult Function(List<Stories> data)? loaded,
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
    required TResult Function(StoriesErrorState value) error,
    required TResult Function(StoriesLoadedState value) loaded,
    required TResult Function(StoriesLoadingState value) loading,
    required TResult Function(StoriesNoneState value) none,
  }) {
    return none(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(StoriesErrorState value)? error,
    TResult? Function(StoriesLoadedState value)? loaded,
    TResult? Function(StoriesLoadingState value)? loading,
    TResult? Function(StoriesNoneState value)? none,
  }) {
    return none?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(StoriesErrorState value)? error,
    TResult Function(StoriesLoadedState value)? loaded,
    TResult Function(StoriesLoadingState value)? loading,
    TResult Function(StoriesNoneState value)? none,
    required TResult orElse(),
  }) {
    if (none != null) {
      return none(this);
    }
    return orElse();
  }
}

abstract class StoriesNoneState implements StoriesResultState {
  const factory StoriesNoneState() = _$StoriesNoneStateImpl;
}
