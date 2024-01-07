import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peemoti/application/constants.dart';
import 'package:peemoti/widgets/text_with_icon.dart';

class Interests extends StatelessWidget {
  const Interests({super.key});

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
            Text(
              'Interests',
              style: StyleConstant.header1,
            ),
            Spacer(),
            TextWithIcon(
                icon: FontAwesomeIcons.gamepad, text: Text('Dota 2, PES')),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            TextWithIcon(
                icon: FontAwesomeIcons.film, text: Text('Watching moive')),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            TextWithIcon(
                icon: FontAwesomeIcons.futbol, text: Text('Manchester United')),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            TextWithIcon(icon: FontAwesomeIcons.book, text: Text('Reading')),
            Divider(
              indent: 10,
              endIndent: 10,
            ),
            TextWithIcon(
                icon: FontAwesomeIcons.music, text: Text('Listening music')),
            Spacer(),
          ]),
    );
  }
}
