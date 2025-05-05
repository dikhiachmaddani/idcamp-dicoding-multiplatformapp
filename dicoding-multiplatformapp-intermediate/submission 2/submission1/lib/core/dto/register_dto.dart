import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_dto.freezed.dart';
part 'register_dto.g.dart';

@freezed
class RegisterDto with _$RegisterDto {
  const factory RegisterDto({
    required String name,
    required String email,
    required String password,
  }) = _RegisterDto;

  factory RegisterDto.fromJson(json) => _$RegisterDtoFromJson(json);
}
