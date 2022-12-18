import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isObscure = true;
  bool _isChecked = false;
  User? currentUser;

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
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: username, password: password);
      currentUser = credential.user;
      isLoading = false;
      notifyListeners();
      return currentUser != null;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == "invalid-email") {
        print("invalid-email");
      } else if (e.code == "user-not-found") {
        print("user-not-found");
      } else if (e.code == "wrong-password") {
        print("wrong-password");
      }
      isLoading = false;
      notifyListeners();
      return false;
    }
  }

  bool getLoggedInUser() {
    currentUser = FirebaseAuth.instance.currentUser;
    return currentUser != null;
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
