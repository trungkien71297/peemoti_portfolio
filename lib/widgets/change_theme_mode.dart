import 'package:flutter/material.dart';
import 'package:peemoti/application/app.dart';

class ChangeThemeMode extends StatelessWidget {
  const ChangeThemeMode({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: App.instance.themeMode,
      builder: (context, value, child) => Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          const Icon(
            Icons.dark_mode,
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Switch(
              value: value == ThemeMode.light,
              onChanged: (value) {
                App.instance.themeMode.value =
                    value ? ThemeMode.light : ThemeMode.dark;
              }),
          const SizedBox(
            width: 5,
          ),
          const Icon(Icons.light_mode, size: 20),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
