import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Project extends StatefulWidget {
  const Project({super.key});

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
              const Text(
                'Simple Epub Editor',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Divider(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const Expanded(
                child: Text(
                    'Ứng dụng để chỉnh sửa 1 số thông tin của file epub: Tác giả, tên sách, cover'),
              ),
              Divider(
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              const Row(children: [
                Icon(
                  FontAwesomeIcons.github,
                  color: Colors.black,
                  size: 30,
                )
              ])
            ],
          ),
        ),
      ),
    );
  }
}
