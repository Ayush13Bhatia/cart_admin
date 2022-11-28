import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isObscure = true;
  bool _isChecked = false;

  bool get isObscure => _isObscure;
  bool get isChecked => _isChecked;

  bool isLoading = false;

  toggleObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  toggleChecked(bool checked) {
    _isChecked = checked;
    notifyListeners();
  }

  Future<bool> login(String username, String password) async {
    isLoading = true;
    notifyListeners();
    await Future.delayed(const Duration(seconds: 3), () {});
    isLoading = false;
    notifyListeners();
    return false;
  }
}
