import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/models/product.dart';
import 'package:flea_fair/models/product_screen_arguments.dart';
import 'package:flea_fair/screens/productscreen/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flea_fair/models/trade_history_item.dart';

class TradeHistoryItemWidget extends StatefulWidget {

  final TradeHistoryItem item;
  final Function inSelectedState;
  final ValueChanged<int> changeSelected;

  const TradeHistoryItemWidget({Key? key,required this.item, required this.inSelectedState,required this.changeSelected}) : super(key: key);

  @override
  _TradeHistoryItemWidgetState createState() => _TradeHistoryItemWidgetState();
}

class _TradeHistoryItemWidgetState extends State<TradeHistoryItemWidget> {

  void toggleSelectedState(){
    if(widget.item.isSelected == true){
      widget.changeSelected(-1);
    }else{
      widget.changeSelected(1);
    }
    setState(() {
      widget.item.isSelected = !widget.item.isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onLongPress: (){
        toggleSelectedState();
      },
      onTap: (){
        if(widget.inSelectedState() == true){
          toggleSelectedState();
        }else{
          Navigator.pushNamed(context, ProductScreen.routeName,arguments: ProductScreenArguments(product: Product(
            productID: '',
            images: imagePaths,
            productTitle: widget.item.productTitle,
            productDescription: widget.item.productDescription,
            productPrice: widget.item.productPrice,
            addedToCart: false,
            isFav: false,
          )));
        }
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 4),
        padding: EdgeInsets.only(top: 5,bottom: 5),
        height: MediaQuery.of(context).size.height*0.15,
        width: double.infinity,
        decoration: BoxDecoration(
          color: widget.item.isSelected ? Colors.grey[300] : Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width*0.30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: shadowList,
                image: DecorationImage(
                  image: AssetImage(widget.item.imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.50,
                  child: Text(
                    widget.item.productTitle,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    softWrap: false,
                    style: TextStyle(
                      fontFamily: fontBlack,
                      color: primaryBlueLight,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.45,
                  child: Text(
                    widget.item.productDescription,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                    style: TextStyle(
                      fontFamily: fontSemiBold,
                      fontSize: 10,
                      color: primaryGrey,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Rs. ${widget.item.productPrice}/-',
                  style: TextStyle(
                    fontFamily: fontBold,
                    fontSize: 12,
                    color: Colors.green,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  softWrap: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
