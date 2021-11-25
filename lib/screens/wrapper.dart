import 'package:flea_fair/screens/authentication/authenticate.dart';
import 'package:flea_fair/screens/toggle_screen/toggle_screen.dart';
import 'package:flutter/material.dart';

//ignore: must_be_immutable
class Wrapper extends StatefulWidget {
  Wrapper({Key? key}) : super(key: key);

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  bool isSignedIn = false;

  @override
  Widget build(BuildContext context) {
    // return ToggleScreen();
    return isSignedIn ? ToggleScreen(logOut: (){
      setState(() {
        isSignedIn = false;
      });
    },) :Authenticate(signInSuccess: (){
        setState(() {
            isSignedIn = true;
        });
    },);
    // return Navigator.pushNamed(context, '/toggle');
  }
}
