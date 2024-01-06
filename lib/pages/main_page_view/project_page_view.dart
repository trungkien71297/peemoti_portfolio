import 'package:flutter/material.dart';
import 'package:peemoti/application/utils.dart';
import 'package:peemoti/widgets/project.dart';

class ProjectPageView extends StatelessWidget {
  const ProjectPageView({super.key});

  @override
  Widget build(BuildContext context) {
    var crossAxisCount = 1;
    if (getSize(context) == 2) {
      crossAxisCount = 2;
    } else if (getSize(context) == 3) {
      crossAxisCount = 3;
    }

    return GridView.count(
      padding: const EdgeInsets.all(50),
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      childAspectRatio: 5 / 3,
      children: const [
        Project(),
        Project(),
        Project(),
        Project(),
      ],
    );
  }
}
