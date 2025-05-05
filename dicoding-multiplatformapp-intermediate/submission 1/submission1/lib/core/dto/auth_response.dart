import 'dart:convert';

import 'package:submission1/core/model/login.dart';

class AuthResponse {
  String? message;
  bool? error;
  Login? loginResult;
  AuthResponse({this.message, this.error, this.loginResult});

  factory AuthResponse.fromJson(String source) =>
      AuthResponse.fromMap(json.decode(source) as Map<String, dynamic>);

  factory AuthResponse.fromMap(Map<String, dynamic> map) {
    return AuthResponse(
      message: map['message'] != null ? map['message'] as String : null,
      error: map['error'] != null ? map['error'] as bool : null,
      loginResult:
          map['loginResult'] != null
              ? Login.fromMap(map['loginResult'] as Map<String, dynamic>)
              : null,
    );
  }

  @override
  String toString() =>
      'AuthResponse(message: $message, error: $error, loginResult: $loginResult)';
}
