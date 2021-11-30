import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/models/home_item.dart';
import 'package:flea_fair/screens/widgets/app_bar_product_screen.dart';
import 'package:flea_fair/screens/widgets/home_screen_product_widget.dart';
import 'package:flutter/material.dart';

class ViewAllScreen extends StatelessWidget {
  const ViewAllScreen({Key? key}) : super(key: key);

  List<Widget> buildViewAllList(){
    return gridItemList.map((e){
      return HomeItemWidget(item: HomeItem(productID: e.productID,imagePath: e.imagePath,
      productTitle: e.productName,productDescription: e.productDescription,productPrice: e.productPrice));
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: ProductScreenAppBar(goBack: (){
          Navigator.pop(context);
        }, isFromProductScreen: false,
        ),
      ),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top:10,left: 20,bottom: 10),
            child: Text(
              'Latest Products',
              style: TextStyle(
                fontSize: 24,
                fontFamily: fontExtraBold,
                color: Colors.black87,
              ),
            ),
          ),
          ...buildViewAllList(),
        ],
      ),
    );
  }
}
