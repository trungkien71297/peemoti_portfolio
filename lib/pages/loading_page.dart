import 'package:flutter/material.dart';
import 'package:peemoti/application/constants.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> sizeAnimation;
  late Animation<double> rotationAnimation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    sizeAnimation = Tween<double>(begin: 0, end: 100).animate(CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubicEmphasized));
    rotationAnimation = CurvedAnimation(
        parent: animationController, curve: Curves.easeInOutCubicEmphasized);
    playAnimation();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  void playAnimation() async {
    await animationController.forward();
    await animationController.reverse();
    if (context.mounted) {
      Navigator.popAndPushNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: animationController,
          builder: (context, child) => RotationTransition(
            turns: rotationAnimation,
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.red.withOpacity(0.5),
                        spreadRadius: 8,
                        blurRadius: 50,
                        offset: const Offset(0, 0))
                  ]),
              child: Image.asset(
                AssetsConstants.logo,
                width: sizeAnimation.value,
                height: sizeAnimation.value,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
