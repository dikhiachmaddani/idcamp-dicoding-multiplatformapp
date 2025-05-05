import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:submission1/core/dto/auth_response.dart';
import 'package:submission1/core/dto/base.dart';
import 'package:submission1/core/dto/login_dto.dart';
import 'package:submission1/core/dto/register_dto.dart';
import 'package:submission1/core/static/static_app.dart';

class AuthRepository {
  final String stateKey = StaticApp.stateKey;
  final String tokenKey = StaticApp.tokenKey;
  final String baseUrl = StaticApp.baseUrl;

  Future<bool> clearToken() async {
    final preferences = await _preference();
    await Future.delayed(const Duration(seconds: 2));
    return preferences.setString(tokenKey, "");
  }

  Future<bool> isLoggedIn() async {
    final preferences = await _preference();
    await Future.delayed(const Duration(seconds: 2));
    return preferences.getBool(stateKey) ?? false;
  }

  Future<AuthResponse> login(LoginDto userCredentials) async {
    final preferences = await _preference();
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await post(
        Uri.parse("$baseUrl/login"),
        body: jsonDecode(userCredentials.toJson()),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        AuthResponse responseBody = AuthResponse.fromMap(
          jsonDecode(response.body),
        );
        await preferences.setString(
          tokenKey,
          responseBody.loginResult?.token ?? "",
        );
        await preferences.setBool(stateKey, true);
        return responseBody;
      } else {
        String error =
            AuthResponse.fromMap(jsonDecode(response.body)).message.toString();
        throw error;
      }
    } on AuthResponse catch (e) {
      throw Exception('Terjadi Kesalahan Server : $e');
    }
  }

  Future<bool> logout() async {
    final preferences = await _preference();
    await Future.delayed(const Duration(seconds: 2));
    return preferences.setBool(stateKey, false);
  }

  Future<Base> register(RegisterDto user) async {
    await Future.delayed(const Duration(seconds: 2));
    try {
      final response = await post(
        Uri.parse("$baseUrl/register"),
        body: jsonDecode(user.toJson()),
      );

      if (response.statusCode == 201 || response.statusCode == 200) {
        Base responseBody = Base.fromMap(jsonDecode(response.body));
        return responseBody;
      } else {
        String error =
            Base.fromMap(jsonDecode(response.body)).message.toString();
        throw error;
      }
    } on Base catch (e) {
      throw Exception('Terjadi Kesalahan Server : $e');
    }
  }

  Future<SharedPreferences> _preference() async {
    return await SharedPreferences.getInstance();
  }
}
