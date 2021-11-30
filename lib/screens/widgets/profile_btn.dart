import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/screens/widgets/placeholder_toast.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {


  const ProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '/profile');
        // showToast('This feature will be available shortly!');
      },
      child: Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: primaryBlueLight,
          borderRadius: BorderRadius.all(Radius.circular(14.0)),
        ),
        child: Icon(Icons.person,color: Colors.white,),
      ),
    );
  }
}
