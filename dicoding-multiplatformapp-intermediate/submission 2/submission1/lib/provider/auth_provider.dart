import 'package:flutter/material.dart';
import 'package:submission1/core/dto/login_dto.dart';
import 'package:submission1/core/dto/register_dto.dart';
import 'package:submission1/core/repository/auth_repository.dart';

class AuthProvider extends ChangeNotifier {
  final AuthRepository authRepository;

  bool isLoadingLogin = false;
  bool isLoadingLogout = false;
  bool isLoadingRegister = false;
  bool isLoggedIn = false;
  String message = "";

  AuthProvider(this.authRepository);

  Future<bool> login(LoginDto userCredentials) async {
    isLoadingLogin = true;
    notifyListeners();

    try {
      final response = await authRepository.login(userCredentials);
      if (response.error == false) {
        isLoggedIn = await authRepository.isLoggedIn();
        message = response.message.toString();
        isLoadingLogin = false;
        notifyListeners();
        return isLoggedIn;
      } else {
        isLoadingLogin = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      message = e.toString();
      isLoadingLogin = false;
      notifyListeners();
    }

    return false;
  }

  Future<bool> logout() async {
    isLoadingLogout = true;
    notifyListeners();

    final logout = await authRepository.logout();
    if (logout) await authRepository.clearToken();
    isLoggedIn = await authRepository.isLoggedIn();

    isLoadingLogout = false;
    notifyListeners();

    return !isLoggedIn;
  }

  Future<bool> register(RegisterDto user) async {
    isLoadingRegister = true;
    notifyListeners();

    try {
      final response = await authRepository.register(user);
      if (response.error == false) {
        message = response.message.toString();
        isLoadingRegister = false;
        notifyListeners();
        return true;
      } else {
        isLoadingRegister = false;
        notifyListeners();
        return false;
      }
    } catch (e) {
      message = e.toString();
      isLoadingRegister = false;
      notifyListeners();
    }
    return false;
  }
}
