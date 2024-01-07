import 'package:flutter/material.dart';

class TextWithIcon extends StatelessWidget {
  const TextWithIcon({super.key, required this.icon, required this.text});
  final IconData icon;
  final Widget text;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 15,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(child: text)
      ],
    );
  }
}
