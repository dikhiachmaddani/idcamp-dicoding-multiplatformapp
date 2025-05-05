// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'stories_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

StoriesListResponse _$StoriesListResponseFromJson(Map<String, dynamic> json) {
  return _StoriesListResponse.fromJson(json);
}

/// @nodoc
mixin _$StoriesListResponse {
  bool get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Stories> get listStory => throw _privateConstructorUsedError;

  /// Serializes this StoriesListResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoriesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoriesListResponseCopyWith<StoriesListResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoriesListResponseCopyWith<$Res> {
  factory $StoriesListResponseCopyWith(
    StoriesListResponse value,
    $Res Function(StoriesListResponse) then,
  ) = _$StoriesListResponseCopyWithImpl<$Res, StoriesListResponse>;
  @useResult
  $Res call({bool error, String message, List<Stories> listStory});
}

/// @nodoc
class _$StoriesListResponseCopyWithImpl<$Res, $Val extends StoriesListResponse>
    implements $StoriesListResponseCopyWith<$Res> {
  _$StoriesListResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoriesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? listStory = null,
  }) {
    return _then(
      _value.copyWith(
            error:
                null == error
                    ? _value.error
                    : error // ignore: cast_nullable_to_non_nullable
                        as bool,
            message:
                null == message
                    ? _value.message
                    : message // ignore: cast_nullable_to_non_nullable
                        as String,
            listStory:
                null == listStory
                    ? _value.listStory
                    : listStory // ignore: cast_nullable_to_non_nullable
                        as List<Stories>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StoriesListResponseImplCopyWith<$Res>
    implements $StoriesListResponseCopyWith<$Res> {
  factory _$$StoriesListResponseImplCopyWith(
    _$StoriesListResponseImpl value,
    $Res Function(_$StoriesListResponseImpl) then,
  ) = __$$StoriesListResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool error, String message, List<Stories> listStory});
}

/// @nodoc
class __$$StoriesListResponseImplCopyWithImpl<$Res>
    extends _$StoriesListResponseCopyWithImpl<$Res, _$StoriesListResponseImpl>
    implements _$$StoriesListResponseImplCopyWith<$Res> {
  __$$StoriesListResponseImplCopyWithImpl(
    _$StoriesListResponseImpl _value,
    $Res Function(_$StoriesListResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoriesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
    Object? message = null,
    Object? listStory = null,
  }) {
    return _then(
      _$StoriesListResponseImpl(
        error:
            null == error
                ? _value.error
                : error // ignore: cast_nullable_to_non_nullable
                    as bool,
        message:
            null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                    as String,
        listStory:
            null == listStory
                ? _value._listStory
                : listStory // ignore: cast_nullable_to_non_nullable
                    as List<Stories>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$StoriesListResponseImpl implements _StoriesListResponse {
  const _$StoriesListResponseImpl({
    required this.error,
    required this.message,
    required final List<Stories> listStory,
  }) : _listStory = listStory;

  factory _$StoriesListResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoriesListResponseImplFromJson(json);

  @override
  final bool error;
  @override
  final String message;
  final List<Stories> _listStory;
  @override
  List<Stories> get listStory {
    if (_listStory is EqualUnmodifiableListView) return _listStory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_listStory);
  }

  @override
  String toString() {
    return 'StoriesListResponse(error: $error, message: $message, listStory: $listStory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoriesListResponseImpl &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality().equals(
              other._listStory,
              _listStory,
            ));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    error,
    message,
    const DeepCollectionEquality().hash(_listStory),
  );

  /// Create a copy of StoriesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoriesListResponseImplCopyWith<_$StoriesListResponseImpl> get copyWith =>
      __$$StoriesListResponseImplCopyWithImpl<_$StoriesListResponseImpl>(
        this,
        _$identity,
      );

  @override
  Map<String, dynamic> toJson() {
    return _$$StoriesListResponseImplToJson(this);
  }
}

abstract class _StoriesListResponse implements StoriesListResponse {
  const factory _StoriesListResponse({
    required final bool error,
    required final String message,
    required final List<Stories> listStory,
  }) = _$StoriesListResponseImpl;

  factory _StoriesListResponse.fromJson(Map<String, dynamic> json) =
      _$StoriesListResponseImpl.fromJson;

  @override
  bool get error;
  @override
  String get message;
  @override
  List<Stories> get listStory;

  /// Create a copy of StoriesListResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoriesListResponseImplCopyWith<_$StoriesListResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
