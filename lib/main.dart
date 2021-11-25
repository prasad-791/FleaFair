import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/screens/splashscreen.dart';
import 'package:flea_fair/screens/toggle_screen/toggle_screen.dart';
import 'package:flea_fair/screens/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(
  //     statusBarColor: Colors.grey[100],
  //   ),
  // );
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/wrapper': (context) =>  Wrapper(),
        '/toggle': (context) => ToggleScreen(logOut:(){}),
      },
    );
  }
}

