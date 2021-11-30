import 'package:flea_fair/configurations/config.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String val){
    Fluttertoast.showToast(
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.grey,
        textColor: primaryBlueLight,
        fontSize: 20,
        msg: val,
    );
}