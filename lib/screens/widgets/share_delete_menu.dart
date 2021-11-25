import 'package:circular_menu/circular_menu.dart';
import 'package:flea_fair/configurations/config.dart';
import 'package:flutter/material.dart';

class ShareDeleteMenu extends StatelessWidget {

  final Function deleteSelected;
  const ShareDeleteMenu({Key? key,required this.deleteSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularMenu(
      alignment: Alignment.bottomCenter,
      toggleButtonColor: primaryBlueLight,
      toggleButtonBoxShadow: shadowList,
      toggleButtonSize: 30,

      items: [
        CircularMenuItem(
          boxShadow: shadowList,
          color: primaryBlueLight,
          iconColor: Colors.white,
          onTap: (){},
          icon: Icons.share,
        ),
        CircularMenuItem(
          boxShadow: shadowList,
          color: primaryBlueLight,
          iconColor: Colors.white,
          onTap: (){
            deleteSelected();
          },
          icon: Icons.delete,
        )
      ],
    );
  }
}
