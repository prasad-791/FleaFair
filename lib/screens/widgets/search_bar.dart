import 'package:flea_fair/configurations/config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {

  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(left: width*0.035,right: width*0.035,top: height*0.025,bottom: height*0.025),
      child: CupertinoSearchTextField(
        padding: EdgeInsets.symmetric(horizontal: width*0.03,vertical: height*0.02),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: shadowList,
        ),
        placeholder: 'eg. TechKnowledge',
        placeholderStyle: TextStyle(
          fontFamily: fontSemiBold,
          color: Colors.grey,
        ),
        style: TextStyle(
          fontFamily: fontSemiBold,
          color: Colors.black,
        ),
        itemSize: 20,
        suffixIcon: Icon(Icons.close,color: primaryBlueLight,size: 20,),
        suffixInsets: EdgeInsets.only(right: 10),
        prefixInsets: EdgeInsets.only(left: 10),
        onSubmitted: (value){
            print(value);
          },
        onChanged: (value){
            print(value);
          },
      ),
    );
  }
}
