import 'package:flea_fair/configurations/config.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {

  final int currentItem;
  final ValueChanged<int> onSelectedItem;

  const MenuScreen({Key? key,required this.currentItem, required this.onSelectedItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: primaryBlue,
      body: Container(
        margin: EdgeInsets.only(top: 40.0,bottom: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
            children: [
              topContainer(),
              SizedBox(height: 60.0),
              Column(children: buildDrawerItems()),
              // bottomContainer(),
            ]
        ),
      ),
    );
  }

  List<Widget> buildDrawerItems(){
    return drawerItemList.map((item) => ListTile(
      selected: currentItem == item.index,
      leading: Icon(
          item.icon,
          color: item.index==currentItem ? primaryGold : primaryWhite,
      ),
      title: Text(
        item.title,
        style: TextStyle(
          color: item.index==currentItem ? primaryGold : primaryWhite,
          fontSize: 16,
          fontFamily: item.index==currentItem ? fontBlack : fontBold,
        ),
      ),
      onTap: (){
        onSelectedItem(item.index);
        print(item.index);
      },
    )).toList();
  }

  Widget topContainer(){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        children: [
          CircleAvatar(
            child: Icon(Icons.person,color: Colors.black,),
            backgroundColor: primaryWhite,
            radius: 30.0,
          ),
          SizedBox(width: 20.0),
          Column(
              children: [
                Text('Name of the User',style: TextStyle(color: Colors.white,fontFamily: fontExtraBold,fontSize: 18.0)),
                Text('Email of the User',style: TextStyle(color: primaryGrey,fontFamily: fontExtraBold,fontSize: 14.0,)),
              ])
        ],
      ),
    );
  }

}

