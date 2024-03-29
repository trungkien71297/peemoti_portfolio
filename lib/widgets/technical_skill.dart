import 'package:flutter/material.dart';
import 'package:peemoti/application/constants.dart';
import 'package:peemoti/widgets/skill_progress.dart';

class TechnicalSkill extends StatelessWidget {
  const TechnicalSkill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.tertiary),
          borderRadius: BorderRadius.circular(15)),
      child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text('Technical skills', style: StyleConstant.header1),
            Spacer(),
            SkillProgress(
                icon: AssetsConstants.flutter, title: 'Flutter', progress: 0.8),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            SkillProgress(
                icon: AssetsConstants.dart, title: 'Dart', progress: 0.8),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            SkillProgress(
                icon: AssetsConstants.ios, title: 'iOS', progress: 0.5),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            SkillProgress(
                icon: AssetsConstants.swift, title: 'Swift', progress: 0.5),
            Spacer(),
          ]),
    );
  }
}
