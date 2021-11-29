import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/models/product.dart';
import 'package:flea_fair/models/product_screen_arguments.dart';
import 'package:flea_fair/models/shopping_cart_item.dart';
import 'package:flea_fair/screens/productscreen/product_screen.dart';
import 'package:flutter/material.dart';

class ShoppingCartItemWidget extends StatefulWidget {

  final ShoppingCartItem item;
  final Function inSelectedState;
  final ValueChanged<int> changeSelected;

  const ShoppingCartItemWidget({Key? key,required this.item,required this.inSelectedState, required this.changeSelected}) : super(key: key);

  @override
  _ShoppingCartItemWidgetState createState() => _ShoppingCartItemWidgetState();
}

class _ShoppingCartItemWidgetState extends State<ShoppingCartItemWidget> {

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
        margin: EdgeInsets.only(top: 8),
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
            Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: shadowList,
              ),
              child: Text(
                'x${widget.item.noOfItems}',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: fontBold,
                    fontSize: 13
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
