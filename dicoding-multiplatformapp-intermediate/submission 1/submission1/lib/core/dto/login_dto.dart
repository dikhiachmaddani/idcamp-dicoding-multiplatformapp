import 'dart:convert';

class LoginDto {
  String? email;
  String? password;

  LoginDto({this.email, this.password});

  Map<String, dynamic> toMap() {
    return {'email': email, 'password': password};
  }

  factory LoginDto.fromMap(Map<String, dynamic> map) {
    return LoginDto(email: map['email'], password: map['password']);
  }

  String toJson() => json.encode(toMap());
}
