import 'package:flutter/material.dart';
import 'package:peemoti/application/constants.dart';

class MyPic extends StatefulWidget {
  const MyPic({super.key});

  @override
  State<MyPic> createState() => _MyPicState();
}

class _MyPicState extends State<MyPic> with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late Animation _animationStart;
  late Animation _animationEnd;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _animationStart = TweenSequence<Alignment>([
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1),
    ]).animate(_animationController);
    _animationEnd = TweenSequence<Alignment>([
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomRight, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomLeft, end: Alignment.topLeft),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topLeft, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topRight, end: Alignment.bottomRight),
          weight: 1),
    ]).animate(_animationController);
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) => Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                colors: const [
                  Color(0xff3BCFD4),
                  Color(0xffFC9305),
                  Color(0xffF20094),
                ],
                begin: _animationStart.value,
                end: _animationEnd.value,
              ),
              boxShadow: const [
                BoxShadow(
                    color: Color(0xff3BCFD4),
                    blurRadius: 10,
                    offset: Offset(0, 0)),
                BoxShadow(
                    color: Color(0xffFC9305),
                    blurRadius: 10,
                    offset: Offset(0, 0))
              ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              AssetsConstants.fishing,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
