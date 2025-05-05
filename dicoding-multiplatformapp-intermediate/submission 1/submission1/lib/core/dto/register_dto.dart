import 'dart:convert';

class RegisterDto {
  String? name;
  String? email;
  String? password;

  RegisterDto({this.name, this.email, this.password});

  Map<String, dynamic> toMap() {
    return {'name': name, 'email': email, 'password': password};
  }

  factory RegisterDto.fromMap(Map<String, dynamic> map) {
    return RegisterDto(
      name: map['name'],
      email: map['email'],
      password: map['password'],
    );
  }

  String toJson() => json.encode(toMap());
}
