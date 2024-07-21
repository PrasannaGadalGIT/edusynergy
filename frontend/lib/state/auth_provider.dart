import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  String? _token;
  String? _userId;
  String? _username;
  String? get token => _token;
  String? get userId => _userId;
  String? get username => _username;

  void setAuthData(String token, String userId, String username) {
    _token = token;
    _userId = userId;
    _username = username;
    notifyListeners();
  }

  void clearAuthData() {
    _token = null;
    _userId = null;
    _username = null;
    notifyListeners();
  }
}
