import 'package:flea_fair/configurations/config.dart';
import 'package:flutter/material.dart';

class DrawerBtn extends StatelessWidget {

  final Function openDrawer;

  DrawerBtn({Key? key,required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("HELLO TAPPED");
        openDrawer();
      },
      child: Container(
        height: 40.0,
        width: 40.0,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: shadowList,
          border: customBorder,
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage('assets/images/menu.png'),
          ),

          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
