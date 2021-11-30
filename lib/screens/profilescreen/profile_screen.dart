import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/screens/favouritescreen/favourite_screen.dart';
import 'package:flea_fair/screens/shoppingcartscreen/shopping_cart_screen.dart';
import 'package:flea_fair/screens/tradehistory/trade_history_screen.dart';
import 'package:flea_fair/screens/widgets/placeholder_toast.dart';
import 'package:flea_fair/screens/widgets/profile_app_bar.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {

  const ProfileScreen({Key? key}) : super(key: key);

  Widget buildBackgroundContainer(var height, var width) {
    return Container(
      color: Colors.transparent,
      child: Align(
        alignment: Alignment.topCenter,
        child: CustomPaint(
          painter: BackGround(),
          child: Container(
            height: height * 0.4,
            width: width,
          ),
        ),
      ),
    );
  }

  Widget buildProfileIcon(var height, var width){
    return Container(
        padding: EdgeInsets.all(10),
        height: height*0.15,
        width: width*0.32,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: shadowList,
          border: customBorder
        ),
      child: Image(
        fit: BoxFit.fill,
        image: AssetImage('assets/images/logo_name.png'),
      ),
    );
  }

  Widget buildForegroundContainer(var height, var width){
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: height*0.13,),
            buildProfileIcon(height, width),
            SizedBox(height: height*0.03,),
            Column(
                children: [
                  Text('UserName of the User',style: TextStyle(color: Colors.black,fontFamily: fontBold,fontSize: 18.0)),
                  Text('Email of the User',style: TextStyle(color: Colors.grey[500],fontFamily: fontSemiBold,fontSize: 14.0,)),
                ]
            ),
          ],
        ),
    );
  }

  Widget buildInfoRow(var height,var width,String key,int value){
    return Container(
      color: Colors.transparent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
              key,
              softWrap: true,
              style: TextStyle(
                color: Colors.grey[600],
                fontFamily: fontSemiBold,
                fontSize: 14,
              ),
            ),
          SizedBox(height: height*0.005,),
          Text(
            value.toString(),
            style: TextStyle(
              color: Colors.black,
              fontFamily: fontExtraBold,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildGoToButton(String val){
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: customBorder,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            val,
            style: TextStyle(
              color: Colors.black,
              fontFamily: fontSemiBold,
              fontSize: 16
            ),
          ),
          Icon(
            Icons.arrow_right,
            color: Colors.black,
            size: 30,
          )
        ],
      ),
    );
  }


  Widget buildBottomButton(String val,IconData iconData,Color bg,Color color,var w){
    return Container(
      color: bg,
      padding: EdgeInsets.symmetric(vertical: 15,horizontal: 20),
      child: Row(
        children: [
          Text(
            val,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontFamily: fontBold,
            ),
          ),
          SizedBox(width: w,),
          Icon(
            iconData,
            color: color,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[100],
        elevation: 0,
        title: ProfileScreenAppBar(
          goBack: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,top: 20,bottom: 10),
              height: height*0.45,
              decoration: BoxDecoration(
                color: Colors.grey[100],
                border: customBorder,
                boxShadow: [
                  BoxShadow(color: primaryGreyLight,offset: Offset(1.0,1.0)),
                ]
              ),
              child: Stack(
                children: [
                  buildBackgroundContainer(height, width),
                  buildForegroundContainer(height,width),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(5),
                // border: customBorder
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                    buildInfoRow(height, width,'Purchased',5),
                    buildInfoRow(height, width,'Owned',2),
                    buildInfoRow(height, width,'Favorites',15),
                    buildInfoRow(height, width,'Shopping Cart',10),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 10),
              padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
              decoration: BoxDecoration(

              ),
              child: Column(
                children: [
                  GestureDetector(onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavouriteScreen(isFromProductScreen: true),
                        )
                    );
                    },
                    child: buildGoToButton('Go to Favorites'),
                  ),
                  SizedBox(height: height*0.02,),
                  GestureDetector(onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ShoppingCartScreen(isFromProductScreen: true),
                        )
                    );
                  },
                    child: buildGoToButton('Go to Shopping Cart'),
                  ),
                  SizedBox(height: height*0.02,),
                  GestureDetector(onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TradeHistoryScreen(isFromProductScreen: true),
                        )
                    );
                  },
                    child: buildGoToButton('Go to Trade History'),
                  ),
                  SizedBox(height: height*0.02,),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15,right: 10,bottom: 25),
              decoration: BoxDecoration(
                color: primaryBlueLight,
                border: customBorder
              ),
              child: Row(
                children: [
                  GestureDetector(onTap: (){
                    showToast('Account Deleted');
                  },child: buildBottomButton('Delete Account', Icons.delete, Colors.white, primaryBlueLight,width*0.005)),
                  GestureDetector(onTap: (){

                  },child: buildBottomButton('Sign Out', Icons.exit_to_app, primaryBlueLight, Colors.white,width*0.015)),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}



class BackGround extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = new LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [primaryBlueLight, primaryBlueLight],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = new Paint()
      ..shader = gradient.createShader(colorBounds);

    Path path = Path();
    path.moveTo(0, size.height/2.3);
    path.lineTo(0, size.height/1.2);
    path.lineTo(size.width, size.height/2);
    path.lineTo(size.width, size.height/8);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}