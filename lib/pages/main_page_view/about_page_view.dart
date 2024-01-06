import 'package:flutter/material.dart';
import 'package:peemoti/widgets/custom_button.dart';

class AboutPageView extends StatelessWidget {
  const AboutPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomButton(onPressed: () {}, child: const Text('Download CV')),
    );
  }
}
