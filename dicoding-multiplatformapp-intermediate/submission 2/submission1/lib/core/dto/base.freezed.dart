// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'base.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

Base _$BaseFromJson(Map<String, dynamic> json) {
  return _Base.fromJson(json);
}

/// @nodoc
mixin _$Base {
  String get message => throw _privateConstructorUsedError;
  bool get error => throw _privateConstructorUsedError;

  /// Serializes this Base to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Base
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BaseCopyWith<Base> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BaseCopyWith<$Res> {
  factory $BaseCopyWith(Base value, $Res Function(Base) then) =
      _$BaseCopyWithImpl<$Res, Base>;
  @useResult
  $Res call({String message, bool error});
}

/// @nodoc
class _$BaseCopyWithImpl<$Res, $Val extends Base>
    implements $BaseCopyWith<$Res> {
  _$BaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Base
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? error = null}) {
    return _then(
      _value.copyWith(
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
            error:
                null == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BaseImplCopyWith<$Res> implements $BaseCopyWith<$Res> {
  factory _$$BaseImplCopyWith(
    _$BaseImpl value,
    $Res Function(_$BaseImpl) then,
  ) = __$$BaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message, bool error});
}

/// @nodoc
class __$$BaseImplCopyWithImpl<$Res>
    extends _$BaseCopyWithImpl<$Res, _$BaseImpl>
    implements _$$BaseImplCopyWith<$Res> {
  __$$BaseImplCopyWithImpl(_$BaseImpl _value, $Res Function(_$BaseImpl) _then)
    : super(_value, _then);

  /// Create a copy of Base
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null, Object? error = null}) {
    return _then(
      _$BaseImpl(
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as bool,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$BaseImpl implements _Base {
  const _$BaseImpl({required this.message, required this.error});

  factory _$BaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BaseImplFromJson(json);

  @override
  final String message;
  @override
  final bool error;

  @override
  String toString() {
    return 'Base(message: $message, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BaseImpl &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.error, error) || other.error == error));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, message, error);

  /// Create a copy of Base
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BaseImplCopyWith<_$BaseImpl> get copyWith =>
      __$$BaseImplCopyWithImpl<_$BaseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BaseImplToJson(this);
  }
}

abstract class _Base implements Base {
  const factory _Base({
    required final String message,
    required final bool error,
  }) = _$BaseImpl;

  factory _Base.fromJson(Map<String, dynamic> json) = _$BaseImpl.fromJson;

  @override
  String get message;
  @override
  bool get error;

  /// Create a copy of Base
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BaseImplCopyWith<_$BaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
