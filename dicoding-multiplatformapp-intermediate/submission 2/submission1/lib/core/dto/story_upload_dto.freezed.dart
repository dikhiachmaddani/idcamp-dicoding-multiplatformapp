// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'story_upload_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$StoryUploadDto {
  String get description => throw _privateConstructorUsedError;
  File get photo => throw _privateConstructorUsedError;

  /// Create a copy of StoryUploadDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoryUploadDtoCopyWith<StoryUploadDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoryUploadDtoCopyWith<$Res> {
  factory $StoryUploadDtoCopyWith(
    StoryUploadDto value,
    $Res Function(StoryUploadDto) then,
  ) = _$StoryUploadDtoCopyWithImpl<$Res, StoryUploadDto>;
  @useResult
  $Res call({String description, File photo});
}

/// @nodoc
class _$StoryUploadDtoCopyWithImpl<$Res, $Val extends StoryUploadDto>
    implements $StoryUploadDtoCopyWith<$Res> {
  _$StoryUploadDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoryUploadDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? description = null, Object? photo = null}) {
    return _then(
      _value.copyWith(
            description:
                null == description
                    ? _value.description
                    : description // ignore: cast_nullable_to_non_nullable
                        as String,
            photo:
                null == photo
                    ? _value.photo
                    : photo // ignore: cast_nullable_to_non_nullable
                        as File,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$StoryUploadDtoImplCopyWith<$Res>
    implements $StoryUploadDtoCopyWith<$Res> {
  factory _$$StoryUploadDtoImplCopyWith(
    _$StoryUploadDtoImpl value,
    $Res Function(_$StoryUploadDtoImpl) then,
  ) = __$$StoryUploadDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String description, File photo});
}

/// @nodoc
class __$$StoryUploadDtoImplCopyWithImpl<$Res>
    extends _$StoryUploadDtoCopyWithImpl<$Res, _$StoryUploadDtoImpl>
    implements _$$StoryUploadDtoImplCopyWith<$Res> {
  __$$StoryUploadDtoImplCopyWithImpl(
    _$StoryUploadDtoImpl _value,
    $Res Function(_$StoryUploadDtoImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of StoryUploadDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? description = null, Object? photo = null}) {
    return _then(
      _$StoryUploadDtoImpl(
        description:
            null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                    as String,
        photo:
            null == photo
                ? _value.photo
                : photo // ignore: cast_nullable_to_non_nullable
                    as File,
      ),
    );
  }
}

/// @nodoc

class _$StoryUploadDtoImpl implements _StoryUploadDto {
  const _$StoryUploadDtoImpl({required this.description, required this.photo});

  @override
  final String description;
  @override
  final File photo;

  @override
  String toString() {
    return 'StoryUploadDto(description: $description, photo: $photo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoryUploadDtoImpl &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description, photo);

  /// Create a copy of StoryUploadDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoryUploadDtoImplCopyWith<_$StoryUploadDtoImpl> get copyWith =>
      __$$StoryUploadDtoImplCopyWithImpl<_$StoryUploadDtoImpl>(
        this,
        _$identity,
      );
}

abstract class _StoryUploadDto implements StoryUploadDto {
  const factory _StoryUploadDto({
    required final String description,
    required final File photo,
  }) = _$StoryUploadDtoImpl;

  @override
  String get description;
  @override
  File get photo;

  /// Create a copy of StoryUploadDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoryUploadDtoImplCopyWith<_$StoryUploadDtoImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
