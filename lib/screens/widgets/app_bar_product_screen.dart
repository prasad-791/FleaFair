import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/screens/shoppingcartscreen/shopping_cart_screen.dart';
import 'package:flutter/material.dart';

class ProductScreenAppBar extends StatelessWidget {
  final Function goBack;
  final bool isFromProductScreen;

  const ProductScreenAppBar(
      {Key? key, required this.goBack, required this.isFromProductScreen})
      : super(key: key);

  Widget backBtn() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
        border: customBorder,
        boxShadow: shadowList
      ),
      child: Icon(
        Icons.arrow_back_ios_new_rounded,
        color: Colors.black,
        size: 20,
      ),
    );
  }

  Widget cartBtn() {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
          border: customBorder,
          boxShadow: shadowList
      ),
      child: Icon(
        Icons.shopping_cart_rounded,
        color: primaryBlueLight,
        size: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              goBack();
            },
            child: backBtn(),
          ),
          Visibility(
            visible: isFromProductScreen,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ShoppingCartScreen(isFromProductScreen: true),
                  )
                );
              },
              child: cartBtn(),
            ),
          )
        ],
      ),
    );
  }
}
