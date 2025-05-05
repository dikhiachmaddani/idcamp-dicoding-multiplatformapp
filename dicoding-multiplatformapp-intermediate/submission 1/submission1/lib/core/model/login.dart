import 'dart:convert';

class Login {
  String? user;
  String? name;
  String? token;
  Login({this.user, this.name, this.token});

  factory Login.fromJson(String source) =>
      Login.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Login.fromMap(Map<String, dynamic> map) {
    return Login(
      user: map['user'] != null ? map['user'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  @override
  int get hashCode => user.hashCode ^ name.hashCode ^ token.hashCode;

  @override
  bool operator ==(covariant Login other) {
    if (identical(this, other)) return true;

    return other.user == user && other.name == name && other.token == token;
  }

  Login copyWith({String? user, String? name, String? token}) {
    return Login(
      user: user ?? this.user,
      name: name ?? this.name,
      token: token ?? this.token,
    );
  }

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'user': user, 'name': name, 'token': token};
  }

  @override
  String toString() => 'Login(user: $user, name: $name, token: $token)';
}
