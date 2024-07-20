import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  double _fontSize = 16.0; // Default font size

  bool get isDarkMode => _isDarkMode;
  double get fontSize => _fontSize;

  ThemeData get themeData {
    return ThemeData(
      brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      textTheme: TextTheme(bodyLarge: TextStyle(fontSize: _fontSize)),
      // You can customize other aspects of the theme here
    );
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void setFontSize(double size) {
    _fontSize = size.clamp(12.0, 22.0); // Ensure font size is between 12 and 22
    notifyListeners();
  }
}
