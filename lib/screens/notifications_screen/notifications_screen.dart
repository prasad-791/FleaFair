
import 'package:flea_fair/configurations/config.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Center(
        child: Text(
            'Notifications Page',
          style: TextStyle(
            fontFamily: fontBlack,
            fontSize: 32,
          ),
        ),
      ),
    );
  }
}
