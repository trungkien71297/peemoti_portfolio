import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peemoti/application/utils.dart';
import 'package:peemoti/models/project_info.dart';

class Project extends StatefulWidget {
  const Project({super.key, required this.project, this.width = 300});
  final ProjectInfo project;
  final double width;
  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  bool onEnter = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          onEnter = true;
        });
      },
      onExit: (event) {
        setState(() {
          onEnter = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          height: 300,
          width: widget.width,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                  offset: onEnter ? const Offset(-5, 0) : Offset.zero,
                  blurRadius: onEnter ? 20 : 10,
                ),
                BoxShadow(
                  color: Theme.of(context).colorScheme.onSurface,
                  offset: onEnter ? const Offset(0, 5) : Offset.zero,
                  blurRadius: onEnter ? 20 : 10,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.surfaceVariant),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                widget.project.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Divider(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              Expanded(
                child: Text(widget.project.description),
              ),
              Wrap(
                spacing: 5,
                runSpacing: 5,
                children: widget.project.techs
                    .map((e) => Chip(
                          label: Text(e),
                        ))
                    .toList(),
              ),
              Divider(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              Row(children: [
                InkWell(
                  onTap: () {
                    launchUrlString(widget.project.url);
                  },
                  child: const Icon(
                    FontAwesomeIcons.github,
                    color: Colors.black,
                    size: 20,
                  ),
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
