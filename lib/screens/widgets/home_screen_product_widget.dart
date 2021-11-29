import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/models/home_item.dart';
import 'package:flea_fair/models/product.dart';
import 'package:flea_fair/models/product_screen_arguments.dart';
import 'package:flea_fair/screens/productscreen/product_screen.dart';
import 'package:flutter/material.dart';

class HomeItemWidget extends StatelessWidget {

  final HomeItem item;

  const HomeItemWidget({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductScreen.routeName,arguments: ProductScreenArguments(product: Product(
          productID: '',
          images: imagePaths,
          productTitle: item.productTitle,
          productDescription: item.productDescription,
          productPrice: item.productPrice,
          addedToCart: false,
          isFav: false,
        )));
      },
      child: Container(
          height: MediaQuery.of(context).size.height*0.175,
          width: double.infinity,
          color: Colors.transparent,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.92,
                margin: EdgeInsets.only(left: 10,top: 15,bottom: 15,right: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: shadowList,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(width: MediaQuery.of(context).size.width*0.30),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width*0.50,
                              child: Text(
                                item.productTitle,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: false,
                                style: TextStyle(
                                    fontFamily: fontBlack,
                                    color: primaryBlueLight,
                                  ),
                                ),
                            ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width*0.45,
                            child: Text(
                                item.productDescription,
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
                          Text(
                              'Price: Rs. ${item.productPrice}/-',
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
              ),
              Container(
                margin: EdgeInsets.all(10),
                width: MediaQuery.of(context).size.width*0.30,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item.imagePath),
                    fit: BoxFit.contain,
                  ),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20.0),
                  boxShadow: shadowList,
                ),
              ),
            ],
          ),
        ),
    );
  }
}
