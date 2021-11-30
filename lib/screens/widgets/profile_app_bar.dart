import 'package:flea_fair/configurations/config.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreenAppBar extends StatelessWidget {
  final Function goBack;

  const ProfileScreenAppBar(
      {Key? key, required this.goBack})
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              goBack();
            },
            child: backBtn(),
          ),
          Spacer(flex: 3,),
          Text(
            'Profile',
            style: GoogleFonts.sansita(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: primaryBlueLight,
            ),
          ),
          Spacer(flex: 4,),
        ],
      ),
    );
  }
}


