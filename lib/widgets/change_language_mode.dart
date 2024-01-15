import 'package:flutter/material.dart';
import 'package:peemoti/application/application.dart';

class ChangeLanguageMode extends StatelessWidget {
  const ChangeLanguageMode({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: App.instance,
      builder: (context, child) => Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          const Text('Vi'),
          const SizedBox(
            width: 5,
          ),
          Switch(
              value: App.instance.languageSystem == LanguageSystem.en,
              onChanged: (value) {
                App.instance.onChangeLanguage(
                    value ? LanguageSystem.en : LanguageSystem.vi);
              }),
          const SizedBox(
            width: 5,
          ),
          const Text('En'),
          const SizedBox(
            width: 5,
          ),
        ],
      ),
    );
  }
}
