import 'package:flutter/material.dart';
import 'package:peemoti/application/constants.dart';
import 'package:peemoti/widgets/avatar.dart';
import 'package:peemoti/widgets/contact.dart';
import 'package:peemoti/widgets/infomation.dart';
import 'package:peemoti/widgets/interests.dart';
import 'package:peemoti/widgets/technical_skill.dart';

import '../../application/utils.dart';

class AboutPageView extends StatelessWidget {
  const AboutPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return getSize(context) == 1 ? _mobile() : _large(context);
  }

  _mobile() {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Text(
              'ABOUT ME',
              style: StyleConstant.header2,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 50),
              child: Avatar(),
            ),
            SizedBox(width: double.infinity, height: 250, child: Information()),
            SizedBox(
              height: 20,
            ),
            SizedBox(width: double.infinity, height: 250, child: Contact()),
            SizedBox(
              height: 20,
            ),
            SizedBox(
                width: double.infinity, height: 250, child: TechnicalSkill()),
            SizedBox(
              height: 20,
            ),
            SizedBox(width: double.infinity, height: 250, child: Interests()),
          ],
        ),
      ),
    );
  }

  _large(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          const Text(
            'ABOUT ME',
            style: StyleConstant.header2,
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 50),
            child: Avatar(),
          ),
          SizedBox(
            width: size.width * 0.7,
            height: 250,
            child: const Row(
              children: [
                Expanded(child: Information()),
                SizedBox(
                  width: 20,
                ),
                Expanded(child: Contact())
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: size.width * 0.7,
            height: 250,
            child: const Row(
              children: [
                Expanded(child: TechnicalSkill()),
                SizedBox(
                  width: 20,
                ),
                Expanded(child: Interests())
              ],
            ),
          ),
        ],
      ),
    );
  }
}
