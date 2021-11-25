import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/screens/widgets/app_bar.dart';
import 'package:flea_fair/screens/widgets/favourite_item_widget.dart';
import 'package:flea_fair/screens/widgets/share_delete_menu.dart';
import 'package:flea_fair/screens/widgets/slideable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  var noOfSelected = 0;
  
  void changeSelected(int value){
    setState(() {
      noOfSelected += value;
    });
  }

  void deleteSelected(){
    if(noOfSelected>0){
      setState(() {
        favouriteItemList.removeWhere((element) => element.isSelected == true);
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
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top:10,left: 20,bottom: 10),
            child: Text(
              'Favourites',
              style: TextStyle(
                fontSize: 24,
                fontFamily: fontExtraBold,
                color: Colors.black87,
              ),
            ),
          ),
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
         ...buildFavouriteList(),
        ],
      ),
      floatingActionButton:Visibility(
        visible: noOfSelected>0,
        child: ShareDeleteMenu(deleteSelected: deleteSelected,),
      ) ,
    );
  }


  List<Widget> buildFavouriteList(){
    return favouriteItemList.map((e) =>SlideAbleWidget(
      isFavourite: true,
      favouriteItemWidget: FavouriteItemWidget(
        changeSelected: changeSelected,
        inSelectedState: inSelectedState,
        item: e,toggleAddCartBtn: (){
        // todo: replace e with actual object
          setState(() {
            if(e.addedToCart){
              e.addedToCart = false;
            }else{
              e.addedToCart = true;
            }
          });
        },),deleteItem:(){
          setState(() {
            favouriteItemList.remove(e);
          });
        },
      )
    ).toList();
  }
}
