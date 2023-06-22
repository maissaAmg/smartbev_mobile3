import 'package:flutter/material.dart';
import 'package:login/Models/my_user.dart';
import 'package:login/Services/login_service.dart';
import 'package:login/Services/user_service.dart';
import 'package:login/Utils/token_manager.dart';

class UserViewModel with ChangeNotifier {
  MyUser? _user;
  bool _isLoading = false;
  String _error = '';
  String? _token;

  bool get isLoading => _isLoading;
  String get error => _error;
  MyUser? get user => _user;
  String? get token => _token;

  Future<String> loginVM(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();
      _token = await login(email, password);
      if (_token != null) {
        String tok = _token ?? '';
        await TokenManager.setToken(tok);
      }

      print("Here is the token from the viewmodel");
      print(_token);
      print(this.token);
      if (_token != null) {
        String tok = _token ?? '';
        print("this is tok {$tok}");
        Future<MyUser?> user = getUserInfo(tok);
      }
      _isLoading = false;
      notifyListeners();
      return 'success';
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to log into your account: $e';
      notifyListeners();
      return 'failure';
    }
  }

  Future<void> getUserInfoVM(String token) async {
    try {
      _isLoading = true;
      notifyListeners();
      print("getUserInfoVM before calling the API");
      _user = await getUserInfo(token);
      print("after getUserInfo after API");
      print(" this is the user email : ${_user?.email}");
      print(_user?.nom);
      print(_user?.prenom);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to load user info: $e';
      notifyListeners();
    }
  }

  void modifyAccountVM(int id, String token, String email, String password,
      String sexe, String nom, String prenom, String role) async {
    try {
      _isLoading = true;
      notifyListeners();
      await modifyAccount(id, token, email, password, sexe, nom, prenom, role);
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = 'Failed to modify account: $e';
      notifyListeners();
    }
  }
}
