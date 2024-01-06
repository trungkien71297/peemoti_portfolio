import 'package:flutter/material.dart';

class ChangeLanguageMode extends StatefulWidget {
  const ChangeLanguageMode({super.key});
  @override
  State<ChangeLanguageMode> createState() => _ChangeLanguageModeState();
}

class _ChangeLanguageModeState extends State<ChangeLanguageMode> {
  final languages = const {'vi': 'Tiếng Việt', 'en': 'English'};
  String code = 'en';
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: DropdownButtonFormField(
          value: code,
          decoration: const InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.translate,
              size: 15,
            ),
          ),
          isExpanded: true,
          focusColor: Colors.transparent,
          items: languages.entries
              .map((e) => DropdownMenuItem(
                  value: e.key,
                  child: Text(
                    e.value,
                    style: const TextStyle(fontSize: 12),
                  )))
              .toList(),
          onChanged: (value) {
            setState(() {
              code = value ?? 'en';
            });
          }),
    );
  }
}
