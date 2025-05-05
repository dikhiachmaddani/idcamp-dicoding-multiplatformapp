import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:submission1/core/model/login.dart';

part 'auth_response.freezed.dart';
part 'auth_response.g.dart';

@freezed
class AuthResponse with _$AuthResponse {
  const factory AuthResponse({
    required String message,
    required bool error,
    required Login loginResult,
  }) = _AuthResponse;

  factory AuthResponse.fromJson(json) => _$AuthResponseFromJson(json);
}
