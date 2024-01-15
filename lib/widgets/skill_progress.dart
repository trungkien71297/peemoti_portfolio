import 'package:flutter/material.dart';
import 'package:peemoti/application/app.dart';

class SkillProgress extends StatelessWidget {
  const SkillProgress(
      {super.key,
      required this.icon,
      required this.title,
      required this.progress});
  final String icon;
  final String title;
  final double progress;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          icon,
          height: 30,
          color: App.instance.themeMode == ThemeMode.dark
              ? Colors.white
              : Colors.black,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title),
            Container(
              height: 10,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(10)),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final width = constraints.maxWidth * progress;
                  return TweenAnimationBuilder<double>(
                    duration: const Duration(seconds: 2),
                    tween: Tween(begin: 0, end: width),
                    curve: Curves.bounceOut,
                    builder: (context, value, child) => Container(
                      height: 10,
                      width: value,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              colors: [
                                Color(0xff3BCFD4),
                                Color(0xffFC9305),
                                Color(0xffF20094),
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight)),
                    ),
                  );
                },
              ),
            )
          ],
        ))
      ],
    );
  }
}
