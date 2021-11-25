import 'package:flea_fair/screens/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  void openDrawer(){
    ZoomDrawer.of(context)!.toggle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0,
        title: BuildAppBar(openDrawer: openDrawer),
      ),
      body: Center(child: Text("About Us Page")),
    );
  }
}
