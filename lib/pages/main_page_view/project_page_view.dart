import 'package:flutter/material.dart';
import 'package:peemoti/application/utils.dart';
import 'package:peemoti/models/project_info.dart';
import 'package:peemoti/widgets/project.dart';

class ProjectPageView extends StatelessWidget {
  const ProjectPageView({super.key});

  final projects = const [
    ProjectInfo(
        title: 'Simple Epub Editor',
        description:
            'An app helps bookworms can change some info of .epub file (ebook file). User can change book\'s cover from user\'s gallery. User also can change book\'s name and author',
        techs: ['Flutter', 'Dart', 'BloC'],
        url: 'https://github.com/trungkien71297/nagn_2'),
    ProjectInfo(
        title: 'Currency converter',
        description:
            'An app can convert curreny between 2 type of currency. It also can synchronize newest exchange rates and save local to convert offline',
        techs: ['Flutter', 'Dart', 'BloC'],
        url: 'https://github.com/trungkien71297/nagn_1'),
    ProjectInfo(
        title: 'Food Recipe',
        description:
            'App suggests recipes everyday for user to make many wonderful foods. User can save their favourite recipes.',
        techs: ['Flutter', 'Dart', 'Provider', 'Clean Architecture'],
        url: 'https://github.com/trungkien71297/food_recipe'),
    ProjectInfo(
        title: 'My Portfolio',
        description: 'This website, my portfolio was writen by Flutter',
        techs: ['Flutter Web', 'Dart'],
        url: 'https://github.com/trungkien71297/peemoti_portfolio'),
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width - 40;
    double width = 400;
    if (getSize(context) == 1) {
      width = screenWidth < 300 ? 300 : screenWidth;
    } else if (getSize(context) == 2) {
      width = screenWidth / 2 - 20;
    } else if (getSize(context) == 3) {
      width = screenWidth / 3 - 20;
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
      child: Wrap(
        children: projects
            .map((e) => Project(
                  project: e,
                  width: width,
                ))
            .toList(),
      ),
    );
  }
}
