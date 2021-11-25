import 'package:flea_fair/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: AnimatedSplashScreen(
        splash: 'assets/images/logo_name.png',
        nextScreen: Wrapper(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.fade,
        backgroundColor: Colors.white,
        duration: 2000,
      ),
    );
  }
}
