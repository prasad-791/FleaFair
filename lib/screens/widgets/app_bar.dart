import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/screens/widgets/drawer_btn.dart';
import 'package:flea_fair/screens/widgets/profile_btn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildAppBar extends StatelessWidget {

  final Function openDrawer;

  const BuildAppBar({Key? key,required this.openDrawer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        DrawerBtn(openDrawer: openDrawer),
        Spacer(flex: 1),
        Text(
          'Flea Fair',
          style: GoogleFonts.sansita(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: primaryBlueLight,
              fontStyle: FontStyle.italic),
        ),
        Spacer(flex: 1),
        ProfileButton(),
      ],
    );
  }
}
