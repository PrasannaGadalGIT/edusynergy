import 'package:flutter/material.dart';

class NotificationSettingsProvider extends ChangeNotifier {
  bool _pushNotificationsEnabled = true; // Default value
  bool _emailNotificationsEnabled = true; // Default value

  bool get pushNotificationsEnabled => _pushNotificationsEnabled;
  bool get emailNotificationsEnabled => _emailNotificationsEnabled;

  void togglePushNotifications(bool isEnabled) {
    _pushNotificationsEnabled = isEnabled;
    notifyListeners();
  }

  void toggleEmailNotifications(bool isEnabled) {
    _emailNotificationsEnabled = isEnabled;
    notifyListeners();
  }
}
