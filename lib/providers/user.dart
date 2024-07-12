import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dana_kedua/models/user.dart';

class UserProvider with ChangeNotifier {
  final List<User> _users = [
    User(
        username: "regan edric",
        email: "regan@mikroskil.com",
        password: "reganteng123"),
    User(
        username: "calvin winata",
        email: "winata@mikroskil.com",
        password: "winateng123"),
    User(
        username: "calvin wijaya",
        email: "wijaya@mikroskil.com",
        password: "wijateng123"),
  ];

  User? _loggedInUser;
  File? _profileImage;

  List<User> get users => _users;
  User? get loggedInUser => _loggedInUser;
  File? get profileImage => _profileImage;

  void register(String username, String email, String password) {
    final newUser = User(
      username: username,
      email: email,
      password: password,
    );
    _users.add(newUser);
    notifyListeners();
  }

  bool isEmailRegistered(String email) {
    return _users.any((user) => user.email == email);
  }

  bool login(String email, String password) {
    final user = _users.firstWhere((user) => user.email == email,
        orElse: () => User(username: '', email: '', password: ''));
    if (user.password.isNotEmpty && user.password == password) {
      _loggedInUser = user;
      notifyListeners();
      return true;
    }
    return false;
  }

  void updateProfileImage(File image) {
    _profileImage = image;
    notifyListeners();
  }

  void updateProfile(
      {required String username,
      required String dob,
      required String residence}) {
    if (_loggedInUser != null) {
      _loggedInUser!.username = username;
      _loggedInUser!.birth = dob;
      _loggedInUser!.address = residence;
      notifyListeners();
    }
  }
}
