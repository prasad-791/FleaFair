import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/models/grid_item.dart';
import 'package:flea_fair/screens/widgets/grid_view_item_widget.dart';
import 'package:flea_fair/screens/widgets/home_screen_product_widget.dart';
import 'package:flea_fair/screens/widgets/search_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;


    Widget buildViewAllButton(){
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
        decoration: BoxDecoration(
          color: primaryBlueLight,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          'View all',
          style: TextStyle(
            color: Colors.white,
            fontFamily: fontBold,
            fontSize: 14
          ),
        ),
      );
    }

    Widget buildGridHeader(){
      return Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
          padding: EdgeInsets.symmetric(horizontal: 5,vertical: 5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Latest Products',
                style: TextStyle(
                  color: primaryBlueLight,
                  fontFamily: fontBlack,
                  fontSize: 18,
                ),
              ),
              GestureDetector(onTap: (){},child: buildViewAllButton(),),
            ],
          ),
      );
    }

    Widget buildGridRow(GridItem item1, GridItem item2){
      return IntrinsicHeight(
        child: Row(
          children: [
            GridViewItemWidget(item: item1),
            VerticalDivider(thickness: 1,color: Colors.grey[300],),
            GridViewItemWidget(item: item2),
          ],
        ),
      );
    }

    Widget buildCustomGridView(){
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Column(
          children: [
            buildGridRow(gridItemList[0], gridItemList[1]),
            Container(margin:EdgeInsets.symmetric(horizontal: 10),child: Divider(thickness: 1,color: Colors.grey[300],)),
            buildGridRow(gridItemList[2], gridItemList[3]),
          ],
        ),
      );
    }

    Widget buildLatestProductGrid(){
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: shadowList,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            buildGridHeader(),
            SizedBox(height: 10,),
            buildCustomGridView(),
            SizedBox(height: 10,),
          ],
        ),
      );
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top:20,left: 30),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Find what you need !!',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: fontExtraBold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SearchBar(),
            buildLatestProductGrid(),
            ...buildHomeList(),
          ],
        )
      ),
    );
  }

  List<Widget> buildHomeList(){
    return homeItemList.map((e){
      return HomeItemWidget(item: e);
    }).toList();
  }
}
