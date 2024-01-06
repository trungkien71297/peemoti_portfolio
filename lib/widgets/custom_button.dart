import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({super.key, required this.onPressed, required this.child});
  final void Function() onPressed;
  final Widget child;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
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
          tween: Tween(begin: Alignment.bottomLeft, end: Alignment.bottomRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomRight, end: Alignment.topRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topRight, end: Alignment.topLeft),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topLeft, end: Alignment.bottomLeft),
          weight: 1),
    ]).animate(_animationController);
    _animationEnd = TweenSequence<Alignment>([
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topRight, end: Alignment.topLeft),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.topLeft, end: Alignment.bottomLeft),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomLeft, end: Alignment.bottomRight),
          weight: 1),
      TweenSequenceItem(
          tween: Tween(begin: Alignment.bottomRight, end: Alignment.topRight),
          weight: 1),
    ]).animate(_animationController);
    _animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Container(
          height: 40,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.tertiary,
                  Theme.of(context).colorScheme.onTertiary
                ],
                begin: _animationStart.value,
                end: _animationEnd.value,
              )),
          child: ElevatedButton(
            onPressed: widget.onPressed,
            style: ElevatedButton.styleFrom(
                elevation: 2,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent),
            child: widget.child,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
