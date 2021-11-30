import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/screens/widgets/app_bar.dart';
import 'package:flea_fair/screens/widgets/app_bar_product_screen.dart';
import 'package:flea_fair/screens/widgets/share_delete_menu.dart';
import 'package:flea_fair/screens/widgets/trade_history_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

class TradeHistoryScreen extends StatefulWidget {

  final bool isFromProductScreen;

  const TradeHistoryScreen({Key? key, required this.isFromProductScreen}) : super(key: key);

  @override
  _TradeHistoryScreenState createState() => _TradeHistoryScreenState();
}

class _TradeHistoryScreenState extends State<TradeHistoryScreen> {
  void openDrawer(){
    ZoomDrawer.of(context)!.toggle();
  }

  bool isOrderedProductsVisible = true;
  bool isPurchasedProductsVisible = false;

  var noOfOrderedSelected = 0;
  var noOfPurchasedSelected = 0;

  void changeOrderedSelected(int value){
    setState(() {
      noOfOrderedSelected += value;
    });
  }
  bool inSelectedStateOrdered(){
    return noOfOrderedSelected > 0 || noOfPurchasedSelected > 0 ? true : false;
  }

  void changePurchasedSelected(int value){
    setState(() {
      noOfPurchasedSelected += value;
    });
  }
  bool inSelectedStatePurchased(){
    return noOfPurchasedSelected > 0 || noOfOrderedSelected>0 ? true : false;
  }

  void deleteSelected(){
    if(noOfOrderedSelected>0){
      setState(() {
        orderedProductsList.removeWhere((element) => element.isSelected == true);
        noOfOrderedSelected = 0;
      });
      print("Deleted");
    }
    if(noOfPurchasedSelected>0){
      setState(() {
        purchasedProductsList.removeWhere((element) => element.isSelected == true);
        noOfPurchasedSelected = 0;
      });
      print("Deleted");
    }

    if(purchasedProductsList.isEmpty){
      setState(() {
        isPurchasedProductsVisible = !isPurchasedProductsVisible;
      });
    }

    if(orderedProductsList.isEmpty){
      setState(() {
        isOrderedProductsVisible = !isOrderedProductsVisible;
      });
    }

  }

  Widget buildDropDownContainer(String value,bool isVisible){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: shadowList
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            value,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: fontBold,
            ),
          ),
          Icon(
            isVisible==false ? Icons.keyboard_arrow_down_rounded : Icons.keyboard_arrow_up_rounded,
            color: Colors.black,
          ),
        ],
      ),
    );
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
        title: widget.isFromProductScreen== true ? ProductScreenAppBar(goBack: (){
          Navigator.pop(context);
        }, isFromProductScreen: false,
          ):BuildAppBar(openDrawer: openDrawer),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top:20,left: 20,bottom: 10),
                child: Text(
                  'Trade History',
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: fontExtraBold,
                    color: Colors.black87,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20,bottom: 20,right: 5),
                child: Text(
                  'Tap and hold to see various actions',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: fontSemiBold,
                    color: primaryGrey,
                  ),
                ),
              ),
              GestureDetector(onTap: (){
                setState(() {
                  isPurchasedProductsVisible = !isPurchasedProductsVisible;
                });
              },child: buildDropDownContainer('Purchased Products',isPurchasedProductsVisible)),
              Visibility(
                  visible: isPurchasedProductsVisible,
                  child: Column(
                    children: buildPurchasedList(),
                  )
              ),
              SizedBox(height: 5,),
              GestureDetector(onTap: (){
                setState(() {
                  isOrderedProductsVisible = !isOrderedProductsVisible;
                });
              },child: buildDropDownContainer('Ordered Products',isOrderedProductsVisible)),
              Visibility(
                  visible: isOrderedProductsVisible,
                  child: Column(
                    children: buildOrderedList(),
                  )
              ),
              SizedBox(height: 5,),
            ],
          ),
        ),
      ),
      floatingActionButton:Visibility(
        visible: noOfOrderedSelected>0 || noOfPurchasedSelected>0,
        child: ShareDeleteMenu(deleteSelected: deleteSelected,),
      ) ,
    );
  }

  List<Widget> buildOrderedList(){
    return orderedProductsList.map((e){
      return TradeHistoryItemWidget(item: e,inSelectedState: inSelectedStateOrdered,changeSelected: changeOrderedSelected,);
    }).toList();
  }

  List<Widget> buildPurchasedList(){
    return purchasedProductsList.map((e){
      return TradeHistoryItemWidget(item: e,inSelectedState: inSelectedStatePurchased,changeSelected: changePurchasedSelected,);
    }).toList();
  }


}
