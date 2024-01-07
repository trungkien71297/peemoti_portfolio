import 'package:flutter/material.dart';
import 'package:peemoti/application/constants.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          border: Border.all(
              width: 5, color: Theme.of(context).colorScheme.secondary),
          image: const DecorationImage(
              image: AssetImage(AssetsConstants.self),
              fit: BoxFit.fitWidth,
              alignment: FractionalOffset.topCenter)),
    );
  }
}
