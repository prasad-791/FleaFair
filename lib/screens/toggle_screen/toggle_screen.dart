import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/screens/aboutusscreen/about_us.dart';
import 'package:flea_fair/screens/favouritescreen/favourite_screen.dart';
import 'package:flea_fair/screens/mainscreen/mainscreen.dart';
import 'package:flea_fair/screens/shoppingcartscreen/shopping_cart_screen.dart';
import 'package:flea_fair/screens/toggle_screen/menu_screen.dart';
import 'package:flea_fair/screens/tradehistory/trade_history_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class ToggleScreen extends StatefulWidget {

  final Function logOut;
  const ToggleScreen({Key? key,required this.logOut}) : super(key: key);

  @override
  _ToggleScreenState createState() => _ToggleScreenState();
}

class _ToggleScreenState extends State<ToggleScreen> {

  int currentItem = 0;
  bool isDragging = false;

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
        style: DrawerStyle.Style1,
        // slideWidth: MediaQuery.of(context).size.width*0.40,     // for style6
        slideWidth: MediaQuery.of(context).size.width*0.70,
        showShadow: true,
        backgroundColor: primaryGreyLight,
        angle: 0,
        borderRadius: 40,
        menuScreen: Builder(
          builder:(context) => MenuScreen(
            currentItem: currentItem,
            onSelectedItem: (item){
              if(item==5){
                widget.logOut();
              }else{
                setState(() {
                  currentItem = item;
                  ZoomDrawer.of(context)!.close();
                });
              }
            },
          ),
        ),
        mainScreen: Builder(
            builder: (context) => WillPopScope(
              onWillPop: () async{
                if(ZoomDrawer.of(context)!.isOpen()){
                  ZoomDrawer.of(context)!.close();
                  return false;
                }else{
                  return true;
                }
              },
              child: GestureDetector(
                onTap: (){ ZoomDrawer.of(context)!.close();},
                onHorizontalDragStart: (details)=> isDragging = true,
                  onHorizontalDragUpdate: (details) {
                    if(!isDragging) return ;

                    const delta = 1;
                    if(details.delta.dx > delta){
                        ZoomDrawer.of(context)!.open();
                    }else{
                        ZoomDrawer.of(context)!.close();
                    }
                    isDragging = false;
                  },
                  child: getScreens(currentItem),
              ),
            ),
        ),
    );
  }

  Widget getScreens(int index){
    switch(index){
      case 0: return MainScreen();
      case 1: return FavouriteScreen(isFromProductScreen: false);
      case 2: return ShoppingCartScreen(isFromProductScreen: false);
      case 3: return TradeHistoryScreen(isFromProductScreen: false);
      case 4: return AboutUsScreen();
      default:
        return MainScreen();
    }
  }
}
