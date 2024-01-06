import 'package:flutter/material.dart';
import 'package:peemoti/application/utils.dart';
import 'package:peemoti/widgets/introduce.dart';
import 'package:peemoti/widgets/my_music.dart';
import 'package:peemoti/widgets/my_pic.dart';

class HomePageView extends StatelessWidget {
  const HomePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(50),
      child: getSize(context) == 1 ? _oneCol() : _threeCol(context),
    );
  }

  _oneCol() {
    return ListView(
      children: const [
        Introduce(),
        MyPic(),
        MyMusic(),
      ],
    );
  }

  _threeCol(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Expanded(child: Introduce()),
        const SizedBox(
          width: 5,
        ),
        SizedBox(
          width: 300,
          height: size.height,
          child: const Column(
            children: [
              Expanded(flex: 2, child: MyMusic()),
              SizedBox(
                height: 5,
              ),
              Expanded(flex: 1, child: MyPic()),
            ],
          ),
        )
      ],
    );
  }
}
