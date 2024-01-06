import 'package:flutter/material.dart';

class App {
  static final App _app = App._internal();
  factory App() {
    return _app;
  }
  static App get instance => _app;
  App._internal();
  final ValueNotifier<ThemeMode> themeMode = ValueNotifier(ThemeMode.dark);
}
