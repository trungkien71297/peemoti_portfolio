import 'package:flutter/material.dart';
import 'package:peemoti/application/app.dart';

class ChangeThemeMode extends StatelessWidget {
  const ChangeThemeMode({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: App.instance,
      builder: (context, child) => Row(
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
              value: App.instance.themeMode == ThemeMode.light,
              onChanged: (value) {
                App.instance
                    .onChangeTheme(value ? ThemeMode.light : ThemeMode.dark);
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
