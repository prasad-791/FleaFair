import 'package:carousel_slider/carousel_slider.dart';
import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/models/product.dart';
import 'package:flea_fair/models/product_screen_arguments.dart';
import 'package:flea_fair/screens/widgets/app_bar_product_screen.dart';
import 'package:flea_fair/screens/widgets/wishlist_cart_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductScreen extends StatefulWidget {
  static const routeName = '/product';
  const ProductScreen({Key? key}) : super(key: key);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

  int currIndex=0;
  final controller = CarouselController();
  late Product item = Product(
    productID: '',
    images: [],
    productTitle: '',
    productDescription: '',
    productPrice: 00,
    addedToCart: false,
    isFav: false,
  );

  Widget buildImage(String path,int index){
    return InteractiveViewer(
      scaleEnabled: true,
      panEnabled: false,
      maxScale: 2,
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(path),
            fit: BoxFit.fill
          ),
          borderRadius: BorderRadius.circular(5),
          // boxShadow: shadowList,
          border: customBorder,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget buildCarousel(var height){
    return CarouselSlider.builder(
        carouselController: controller,
        itemCount: item.images.length,
        itemBuilder: (context,index,realIndex){
          final path = item.images[index];
          return buildImage(path,index);
        },
        options: CarouselOptions(
          height: height*0.35,
          autoPlay: true,
            // autoPlay: false,
          enlargeCenterPage: true,
          autoPlayInterval: Duration(seconds: 8),
          onPageChanged: (index,reason){
            setState(() {
              currIndex = index;
            });
          }
        ),
    );
  }

  Widget buildIndicator(){
    return AnimatedSmoothIndicator(
        activeIndex: currIndex,
        count: item.images.length,
        effect: JumpingDotEffect(
          dotWidth: 15,
          dotHeight: 7,
          activeDotColor: primaryBlueLight,
          dotColor: primaryGreyLight
        ),
    );
  }

  Widget buildButton(IconData data,String value,Color bgColor,Color color,var width){
    return Container(
      width: width*0.5,
      color: bgColor,
      padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              data,
              color: color,
            ),
            SizedBox(width: width*0.02,),
            Text(
              value,
              style: TextStyle(
                color: color,
                fontSize: 18,
                fontFamily: fontSemiBold,
              ),
            )
          ],
        ),
      ),
    );
  }


  Widget buildDescription(var height, var width){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(right: 10,top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5)),
        color: Colors.white,
        border: customBorder,
        boxShadow: [
          BoxShadow(color: primaryGreyLight,spreadRadius: 0,blurRadius: 0,offset: const Offset(1.5, 2.0)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height*0.01,),
          Text(
            'Description:',
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 16,
              fontFamily: fontSemiBold,
            ),
          ),
          SizedBox(height: height*0.005,),
          Text(
            item.productDescription,
            maxLines: 10,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontFamily: fontSemiBold,
            ),
          ),
          SizedBox(height: height*0.03,),
        ],
      ),
    );
  }

  Widget bottomButtons(var height,var width){
    return Container(
      decoration: BoxDecoration(
        border: customBorder,
      ),
      child: Row(
        children: [
            GestureDetector(onTap: (){

            },child: buildButton(Icons.call,'Call',Colors.white,Colors.green,width),),
            GestureDetector(onTap: (){

            },child: buildButton(Icons.send,'Ask for deal',primaryBlueLight,Colors.white,width),),
        ],
      ),
    );
  }

  Widget buildInfoContainer(var height,var width){
    return Container(
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
        color: Colors.white,
      ),
      child: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                  child: Text(
                    item.productTitle,
                    maxLines: 2,
                    style: TextStyle(
                      color: primaryBlueLight,
                      fontSize: 24,
                      fontFamily: fontBlack,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top:10,left: 20,right: 20),
                  child: Text(
                    'Rs. ${item.productPrice}/-',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 20,
                      fontFamily: fontBold,
                    ),
                  ),
                ),
                SizedBox(height: height*0.03,),
                bottomButtons(height, width),
                buildDescription(height, width),
              ],
            ),
          ),
      ),
    );
  }
  

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)!.settings.arguments as ProductScreenArguments;

    setState(() {
      item = args.product;
    });

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
        title: ProductScreenAppBar(goBack: (){
          Navigator.pop(context);
        },
        isFromProductScreen: true,),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: height*0.04,),
            buildCarousel(height),
            SizedBox(height: height*0.02,),
            buildIndicator(),
            SizedBox(height: height*0.03,),
            buildInfoContainer(height, width),
          ],
        ),
      ),
      floatingActionButton: WishlistCartMenu(
        isFavourite: item.isFav,
        isAddedToCart: item.addedToCart,
        onClickCart: (){
          setState(() {
            item.addedToCart = !item.addedToCart;
          });
        },
        onClickFav: (){
          setState(() {
            item.isFav = !item.isFav;
          });
        },
      ),
    );
  }
}
