import 'package:circular_menu/circular_menu.dart';
import 'package:flea_fair/configurations/config.dart';
import 'package:flutter/material.dart';

class WishlistCartMenu extends StatelessWidget {

  final bool isFavourite;
  final bool isAddedToCart;
  final Function onClickCart;
  final Function onClickFav;

  const WishlistCartMenu({Key? key,required this.isFavourite, required this.isAddedToCart,required this.onClickCart, required this.onClickFav}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return CircularMenu(
      alignment: Alignment.bottomRight,
      toggleButtonColor: primaryBlueLight,
      toggleButtonBoxShadow: shadowList,
      toggleButtonSize: 30,

      items: [
        CircularMenuItem(
          iconSize: 25,
          boxShadow: shadowList,
          color: primaryBlueLight,
          iconColor: Colors.white,
          onTap: (){
            onClickCart();
          },
          icon: isAddedToCart == true ? Icons.remove_shopping_cart_rounded: Icons.add_shopping_cart_rounded,
        ),
        CircularMenuItem(
          iconSize: 25,
          boxShadow: shadowList,
          color: primaryBlueLight,
          iconColor: isFavourite == true? Colors.red: Colors.white,
          onTap: (){
            onClickFav();
          },
          icon: Icons.favorite,
        )
      ],
    );
  }
}
