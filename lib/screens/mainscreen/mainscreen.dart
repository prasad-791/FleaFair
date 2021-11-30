import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/screens/addproductscreen/add_product_screen.dart';
import 'package:flea_fair/screens/homescreen/home_screen.dart';
import 'package:flea_fair/screens/notifications_screen/notifications_screen.dart';
import 'package:flea_fair/screens/widgets/app_bar.dart';
import 'package:flea_fair/screens/widgets/placeholder_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int selectedIndex =0;

  Widget getPages(int index){
    switch(index){
      case 0: return HomeScreen();
      case 1: return AddProductScreen();
      case 2: return NotificationScreen();
      default: return HomeScreen();
    }
  }

  void openDrawer(){
      ZoomDrawer.of(context)!.toggle();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // extendBody: true,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: BuildAppBar(openDrawer: openDrawer),
      ),
      body: getPages(selectedIndex),
      bottomNavigationBar:  CurvedNavigationBar(
        color: primaryWhite,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: primaryBlueLight,
        height: 60,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        index:selectedIndex,
        items: bottomNavBarItemList.map((e) => Icon(
          e.icon,
          color: selectedIndex==e.index ? Colors.white : Colors.black,
          size: 30,
        )).toList(),
        onTap: (index){
          setState((){
            // if(index==2){
            //   selectedIndex = 0;
            //   showToast('This feature will be available shortly');
            // }else{
            //   selectedIndex = index;
            // }
            selectedIndex = index;
          });
        },
      ),
    );
  }
}
