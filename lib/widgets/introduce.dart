import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:peemoti/application/constants.dart';
import 'package:peemoti/application/utils.dart';

class Introduce extends StatefulWidget {
  const Introduce({super.key});

  @override
  State<Introduce> createState() => _IntroduceState();
}

class _IntroduceState extends State<Introduce>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  late final AnimationController _animationController;
  late Animation _animation;
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.elasticInOut));
    _animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              return ShaderMask(
                shaderCallback: (bounds) => LinearGradient(stops: [
                  _animation.value - 0.5,
                  _animation.value,
                  _animation.value + 0.5
                ], colors: const [
                  Color(0xff3BCFD4),
                  Color(0xffFC9305),
                  Color(0xffF20094),
                ]).createShader(bounds),
                child: Text(
                  'NGUYỄN TRUNG KIÊN',
                  style: TextStyle(
                      fontFamily: AppConstants.font1,
                      fontSize: getSize(context) == 1 ? 30 : 50,
                      color: Colors.white),
                ),
              );
            }),
        ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: const Text(AppConstants.introduceParagraph)),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: const Row(
            children: [
              Icon(
                Icons.keyboard_double_arrow_right,
                size: 30,
              ),
              Expanded(
                child: Divider(
                  thickness: 3,
                  endIndent: 10,
                ),
              ),
              Text(
                'Follow me',
                style: TextStyle(fontFamily: AppConstants.font2, fontSize: 30),
              ),
              Expanded(
                child: Divider(
                  indent: 10,
                  thickness: 3,
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                launchUrlString(AppConstants.githubUrl);
              },
              style: IconButton.styleFrom(
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              icon: const Icon(FontAwesomeIcons.github),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                launchUrlString(AppConstants.linkedInUrl);
              },
              style: IconButton.styleFrom(
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              icon: const Icon(FontAwesomeIcons.linkedin),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                launchUrlString(AppConstants.twitterUrl);
              },
              style: IconButton.styleFrom(
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              icon: const Icon(FontAwesomeIcons.twitter),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
              onPressed: () {
                launchUrlString(AppConstants.phoneUrl);
              },
              style: IconButton.styleFrom(
                  side: BorderSide(
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              icon: const Icon(FontAwesomeIcons.phone),
            ),
          ],
        )
      ],
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
