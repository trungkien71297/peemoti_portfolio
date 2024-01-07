import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peemoti/application/constants.dart';
import 'package:peemoti/widgets/text_with_icon.dart';

class Information extends StatelessWidget {
  const Information({super.key});

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
          Text('Personal info', style: StyleConstant.header1),
          Spacer(),
          TextWithIcon(
              icon: FontAwesomeIcons.idCard, text: Text('Nguyễn Trung Kiên')),
          Divider(
            indent: 10,
            endIndent: 10,
          ),
          TextWithIcon(
              icon: FontAwesomeIcons.cakeCandles, text: Text('07/12/1997')),
          Divider(
            indent: 10,
            endIndent: 10,
          ),
          TextWithIcon(
              icon: FontAwesomeIcons.locationPin,
              text: Text('Ho Chi Minh, Viet Nam')),
          Divider(
            indent: 10,
            endIndent: 10,
          ),
          TextWithIcon(
              icon: FontAwesomeIcons.venusMars, text: Text('Male (he/him)')),
          Spacer(),
        ],
      ),
    );
  }
}
