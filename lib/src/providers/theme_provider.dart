import 'package:flutter/material.dart';
import '../theme/themes.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;
  ThemeData get currentTheme => _isDarkMode ? Themes.darkTheme : Themes.lightTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
}

// Consumer<ThemeProvider>(
//   builder: (context, provider, child) {
//     return IconButton(
//       icon: Icon(provider.isDarkMode ? Icons.light_mode : Icons.dark_mode),
//       onPressed: () => provider.toggleTheme(),
//     );
//   },
// );