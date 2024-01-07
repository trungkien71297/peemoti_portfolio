import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peemoti/application/constants.dart';
import 'package:peemoti/widgets/text_with_icon.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Theme.of(context).colorScheme.tertiary),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Contact', style: StyleConstant.header1),
            const Spacer(),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => launchUrlString(AppConstants.phoneUrl),
                child: const TextWithIcon(
                    icon: FontAwesomeIcons.phone,
                    text: Text('+84 98 7347 404')),
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => launchUrlString(AppConstants.mailUrl),
                child: const TextWithIcon(
                    icon: FontAwesomeIcons.envelope,
                    text: Text('trungkien71297@outlook.com')),
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => launchUrlString(AppConstants.linkedInUrl),
                child: const TextWithIcon(
                    icon: FontAwesomeIcons.linkedin, text: Text('in/peemoti')),
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => launchUrlString(AppConstants.githubUrl),
                child: const TextWithIcon(
                    icon: FontAwesomeIcons.github,
                    text: Text('/trungkien71297')),
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => launchUrlString(AppConstants.twitterUrl),
                child: const TextWithIcon(
                    icon: FontAwesomeIcons.twitter, text: Text('/peemoti')),
              ),
            ),
            const Spacer(),
          ]),
    );
  }
}
