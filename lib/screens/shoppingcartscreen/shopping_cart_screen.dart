import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/screens/widgets/app_bar.dart';
import 'package:flea_fair/screens/widgets/share_delete_menu.dart';
import 'package:flea_fair/screens/widgets/shopping_cart_item_widget.dart';
import 'package:flea_fair/screens/widgets/slideable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class ShoppingCartScreen extends StatefulWidget {
  const ShoppingCartScreen({Key? key}) : super(key: key);

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {

  var noOfSelected = 0;

  void changeSelected(int value){
    setState(() {
      noOfSelected += value;
    });
  }

  void deleteSelected(){
    if(noOfSelected>0){
      setState(() {
        shoppingCartItemList.removeWhere((element) => element.isSelected == true);
        noOfSelected = 0;
      });
      print("Deleted");
    }
  }

  bool inSelectedState(){
    return noOfSelected > 0 ? true : false;
  }

  void openDrawer(){
    ZoomDrawer.of(context)!.toggle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: BuildAppBar(openDrawer: openDrawer),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children:[
                // Shopping Cart Text
                Container(
                  margin: EdgeInsets.only(top:10,left: 20,bottom: 10),
                  child: Text(
                    'Shopping Cart',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: fontExtraBold,
                      color: Colors.black87,
                    ),
                  ),
                ),
                // Swipe Tip Text
                Container(
                  margin: EdgeInsets.only(left: 20,bottom: 10),
                  child: Text(
                    '<-- Swipe left on each product to see various actions',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: fontSemiBold,
                      color: primaryGrey,
                    ),
                  ),
                ),
                ...buildShoppingCartList(),
              ],
            ),
          ),

          // Bottom Sticky Container for checkout

          Visibility(
            visible: !(noOfSelected>0),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16,vertical: 6),
              color: Colors.grey[200],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '10 items',
                        style: TextStyle(
                          fontSize: 14,
                          fontFamily: fontBold,
                          color: primaryGrey,
                        ),
                      ),
                      Text(
                        'Rs. 1750/-',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: fontBlack,
                          color: Colors.green,
                        ),
                      )
                    ],
                  ),
                  // Checkout Button
                  checkOutButton(),
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton:Visibility(
        visible: noOfSelected>0,
        child: ShareDeleteMenu(deleteSelected: deleteSelected,),
      ) ,
    );
  }

  Widget checkOutButton(){
    return GestureDetector(
      onTap: (){},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 16),
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: primaryBlueLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Check Out',
              style: TextStyle(
                fontSize: 18,
                fontFamily: fontBlack,
                color: Colors.white,
              ),
            ),
            Icon(
              Icons.navigate_next,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> buildShoppingCartList (){
    return shoppingCartItemList.map((e) => SlideAbleWidget.fromShoppingCart(isFavourite: false,shoppingCartItemWidget: ShoppingCartItemWidget(
        item: e,
        inSelectedState: inSelectedState,
        changeSelected: changeSelected,
    ),
    deleteItem: (){
      setState(() {
        shoppingCartItemList.remove(e);
      });
    },
    )).toList();
  }

}
