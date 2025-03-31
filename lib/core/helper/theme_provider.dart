import 'package:flutter/material.dart';

import '../../config/theme/colors.dart';

class ThemeProvider with ChangeNotifier {
  ThemeMode _selectedThemeMode = ThemeMode.light;

  ThemeMode get selectedThemeMode => _selectedThemeMode;

  setSelectedThemeMode(ThemeMode themeMode) {
    _selectedThemeMode = themeMode;
    AColors(themeMode);
    notifyListeners();
  }
}