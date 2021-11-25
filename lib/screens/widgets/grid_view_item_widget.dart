import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/models/grid_item.dart';
import 'package:flutter/material.dart';

// ignore:must_be_immutable
class GridViewItemWidget extends StatelessWidget {

  late GridItem item;

  GridViewItemWidget({Key? key,required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: MediaQuery.of(context).size.width*0.41,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(5),
            height: 100,
            child: Image(image: AssetImage(item.imagePath)),
          ),
          Text(
            item.productName,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              color: primaryBlueLight,
              fontSize: 12,
              fontFamily: fontBlack,
            ),
          ),
          SizedBox(height: 5,),
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              item.productDescription,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Colors.black,
                fontSize: 10,
                fontFamily: fontSemiBold,
              ),
            ),
          ),
          SizedBox(height: 5,),
          Container(
            // padding: EdgeInsets.only(left: 10),
            child: Text(
              'Rs. ${item.productPrice}/-',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: TextStyle(
                color: Colors.green,
                fontSize: 12,
                fontFamily: fontBold,
              ),
            ),
          ),
          SizedBox(height: 5,),
        ],
      ),
    );
  }
}
