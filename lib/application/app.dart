import 'package:flutter/material.dart';
import 'package:peemoti/application/application.dart';

class App with ChangeNotifier {
  static final App _app = App._internal();
  factory App() {
    return _app;
  }
  //Getter
  static App get instance => _app;
  ThemeMode get themeMode => _themeMode;
  LanguageSystem get languageSystem => _languageSystem;

  App._internal();
  ThemeMode _themeMode = ThemeMode.dark;
  LanguageSystem _languageSystem = LanguageSystem.vi;

  void onChangeLanguage(LanguageSystem language) {
    _languageSystem = language;
    notifyListeners();
  }

  void onChangeTheme(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
