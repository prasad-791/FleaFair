import 'package:flea_fair/models/bottom_nav_bar_item.dart';
import 'package:flea_fair/models/drawer_item.dart';
import 'package:flea_fair/models/favourite_item.dart';
import 'package:flea_fair/models/grid_item.dart';
import 'package:flea_fair/models/home_item.dart';
import 'package:flea_fair/models/shopping_cart_item.dart';
import 'package:flea_fair/models/trade_history_item.dart';
import 'package:flutter/material.dart';

Color primaryBlue = Color.fromARGB(255, 25, 9, 60);
Color primaryGrey = Color.fromARGB(255, 169,169,169);
Color primaryGreyLight = Color.fromARGB(255,184,184,184);
Color primaryWhite = Colors.white;
Color primaryGold = Color.fromARGB(255, 247, 174, 133);

Color primaryBlueLight = Colors.indigo;

List<BoxShadow> shadowList = [BoxShadow(color: Colors.grey,offset: const Offset(1.0,1.0,),blurRadius: 0.0,spreadRadius: 0.0,)];
Border customBorder = Border.all(color: Colors.grey,width:0.0);

final List<DrawerItem> drawerItemList = [
  DrawerItem(title: 'Home', icon: Icons.home,index: 0),
  DrawerItem(title: 'Favourites', icon: Icons.favorite,index: 1),
  DrawerItem(title: "Shopping Cart", icon: Icons.shopping_cart,index: 2),
  DrawerItem(title: 'Trade History', icon: Icons.history,index: 3),
  DrawerItem(title: 'About Us', icon: Icons.info_outline,index: 4),
  DrawerItem(title: 'Sign Out', icon: Icons.exit_to_app,index: 5),
];

final List<BottomNavBarItem> bottomNavBarItemList = [
  BottomNavBarItem(index: 0, icon: Icons.home),
  BottomNavBarItem(index: 1, icon: Icons.add_circle_outline_sharp),
  BottomNavBarItem(index: 2, icon: Icons.notifications)
];

final String fontBlack = 'NunitoSansBlack';
final String fontExtraBold = 'NunitoSansExtraBold';
final String fontBold = 'NunitoSansBold';
final String fontBoltItalic = 'NunitoSansBoldItalic';
final String fontSemiBold = 'NunitoSansSemiBold';
final String fontSemiBoldItalic = 'NunitoSansSemiBoldItalic';



// Temporary Lists
List<FavouriteItem> favouriteItemList = [
  FavouriteItem(productID: '', imagePath: 'assets/images/apron.jpeg', productTitle: 'WorkShop Apron', productDescription: 'WorkShop Apron used for 1 year', productPrice: 60.0,addedToCart: false,isSelected: false),
  FavouriteItem(productID: '', imagePath: 'assets/images/books.jpeg', productTitle: 'Engineering Books', productDescription: 'Engineering books for 3rd year', productPrice: 1258.0,addedToCart: false,isSelected: false),
  FavouriteItem(productID: '', imagePath: 'assets/images/edraw.jpg', productTitle: 'Engineering Drawing Box for Second Year', productDescription: 'Box used for 1 year', productPrice: 250.0,addedToCart: false,isSelected: false),
  FavouriteItem(productID: '', imagePath: 'assets/images/laptop.jpg', productTitle: 'Apple MacBook pro', productDescription: 'MacBook Pro used for 2 years', productPrice: 35000.0,addedToCart: false,isSelected: false),
  FavouriteItem(productID: '', imagePath: 'assets/images/apron.jpeg', productTitle: 'WorkShop Apron', productDescription: 'WorkShop Apron used for 1 year', productPrice: 60.0,addedToCart: false,isSelected: false),
  FavouriteItem(productID: '', imagePath: 'assets/images/books.jpeg', productTitle: 'Engineering Books', productDescription: 'Engineering books for 3rd year', productPrice: 1258.0,addedToCart: false,isSelected: false),
  FavouriteItem(productID: '', imagePath: 'assets/images/edraw.jpg', productTitle: 'Engineering Drawing Box', productDescription: 'Box used for 1 year', productPrice: 250.0,addedToCart: false,isSelected: false),
  FavouriteItem(productID: '', imagePath: 'assets/images/laptop.jpg', productTitle: 'Apple MacBook pro', productDescription: 'MacBook Pro used for 2 years', productPrice: 35000.0,addedToCart: false,isSelected: false),
];

List<ShoppingCartItem> shoppingCartItemList = [
  ShoppingCartItem(productID: '', imagePath: 'assets/images/apron.jpeg', productTitle: 'WorkShop Apron', productDescription: 'WorkShop Apron used for 1 year',productPrice: 60.0, noOfItems: 3,isSelected: false),
  ShoppingCartItem(productID: '', imagePath: 'assets/images/books.jpeg', productTitle: 'Engineering Books', productDescription: 'Engineering books for 3rd year',productPrice: 1258.0, noOfItems: 4,isSelected: false),
  ShoppingCartItem(productID: '', imagePath: 'assets/images/edraw.jpg', productTitle: 'Engineering Drawing Box for Second Year', productDescription: 'Box used for 1 year',productPrice: 250.0, noOfItems: 2,isSelected: false),
  ShoppingCartItem(productID: '', imagePath: 'assets/images/laptop.jpg', productTitle: 'Apple MacBook pro', productDescription:'MacBook Pro used for 2 years',productPrice: 35000.0, noOfItems: 1,isSelected: false),
  ShoppingCartItem(productID: '', imagePath: 'assets/images/apron.jpeg', productTitle: 'WorkShop Apron', productDescription: 'WorkShop Apron used for 1 year',productPrice: 60.0, noOfItems: 3,isSelected: false),
  ShoppingCartItem(productID: '', imagePath: 'assets/images/books.jpeg', productTitle: 'Engineering Books', productDescription: 'Engineering books for 3rd year',productPrice: 1258.0, noOfItems: 4,isSelected: false),
  ShoppingCartItem(productID: '', imagePath: 'assets/images/edraw.jpg', productTitle: 'Engineering Drawing Box for Second Year', productDescription: 'Box used for 1 year',productPrice: 250.0, noOfItems: 2,isSelected: false),
  ShoppingCartItem(productID: '', imagePath: 'assets/images/laptop.jpg', productTitle: 'Apple MacBook pro', productDescription:'MacBook Pro used for 2 years',productPrice: 35000.0, noOfItems: 1,isSelected: false),
];

List<HomeItem> homeItemList = [
  HomeItem(productID: '', imagePath: 'assets/images/apron.jpeg', productTitle: 'WorkShop Apron', productDescription: 'WorkShop Apron used for 1 year', productPrice: 60.0),
  HomeItem(productID: '', imagePath: 'assets/images/books.jpeg', productTitle: 'Engineering Books', productDescription: 'Engineering books for 3rd year', productPrice: 1258.0),
  HomeItem(productID: '', imagePath: 'assets/images/edraw.jpg', productTitle: 'Engineering Drawing Box for Second Year', productDescription: 'Box used for 1 year', productPrice: 250.0),
  HomeItem(productID: '', imagePath: 'assets/images/laptop.jpg', productTitle: 'Apple MacBook pro', productDescription: 'MacBook Pro used for 2 years', productPrice: 35000.0),
  HomeItem(productID: '', imagePath: 'assets/images/apron.jpeg', productTitle: 'WorkShop Apron', productDescription: 'WorkShop Apron used for 1 year', productPrice: 60.0),
  HomeItem(productID: '', imagePath: 'assets/images/books.jpeg', productTitle: 'Engineering Books', productDescription: 'Engineering books for 3rd year', productPrice: 1258.0),
  HomeItem(productID: '', imagePath: 'assets/images/edraw.jpg', productTitle: 'Engineering Drawing Box', productDescription: 'Box used for 1 year', productPrice: 250.0),
  HomeItem(productID: '', imagePath: 'assets/images/laptop.jpg', productTitle: 'Apple MacBook pro', productDescription: 'MacBook Pro used for 2 years', productPrice: 35000.0),
];

List<GridItem> gridItemList = [
  GridItem(productID:'',imagePath: 'assets/images/apron.jpeg', productName: 'Engineering Apron', productDescription: 'Engineering Workshop Apron for First Year Engineering', productPrice: 75),
  GridItem(productID:'',imagePath: 'assets/images/books.jpeg',productName: 'Engineering Books', productDescription: 'Engineering books for 3rd year', productPrice: 1258.0),
  GridItem(productID:'',imagePath: 'assets/images/edraw.jpg', productName: 'Engineering Drawing Box for Second Year', productDescription: 'Box used for 1 year', productPrice: 250.0),
  GridItem(productID:'',imagePath: 'assets/images/laptop.jpg', productName: 'Apple MacBook pro', productDescription: 'MacBook Pro used for 2 years', productPrice: 35000.0),
  GridItem(productID:'',imagePath: 'assets/images/apron.jpeg', productName: 'Engineering Apron', productDescription: 'Engineering Workshop Apron for First Year Engineering', productPrice: 75),
  GridItem(productID:'',imagePath: 'assets/images/books.jpeg',productName: 'Engineering Books', productDescription: 'Engineering books for 3rd year', productPrice: 1258.0),
  GridItem(productID:'',imagePath: 'assets/images/edraw.jpg', productName: 'Engineering Drawing Box for Second Year', productDescription: 'Box used for 1 year', productPrice: 250.0),
  GridItem(productID:'',imagePath: 'assets/images/laptop.jpg', productName: 'Apple MacBook pro', productDescription: 'MacBook Pro used for 2 years', productPrice: 35000.0),
];

List<TradeHistoryItem> orderedProductsList = [
  TradeHistoryItem(productID: '', imagePath: 'assets/images/apron.jpeg', productTitle: 'WorkShop Apron', productDescription: 'WorkShop Apron used for 1 year', productPrice: 60.0,isSelected: false),
  TradeHistoryItem(productID: '', imagePath: 'assets/images/books.jpeg', productTitle: 'Engineering Books', productDescription: 'Engineering books for 3rd year', productPrice: 1258.0,isSelected: false),
  TradeHistoryItem(productID: '', imagePath: 'assets/images/edraw.jpg', productTitle: 'Engineering Drawing Box for Second Year', productDescription: 'Box used for 1 year', productPrice: 250.0,isSelected: false),
  TradeHistoryItem(productID: '', imagePath: 'assets/images/laptop.jpg', productTitle: 'Apple MacBook pro', productDescription: 'MacBook Pro used for 2 years', productPrice: 35000.0,isSelected: false),
  TradeHistoryItem(productID: '', imagePath: 'assets/images/apron.jpeg', productTitle: 'WorkShop Apron', productDescription: 'WorkShop Apron used for 1 year', productPrice: 60.0,isSelected: false),
  TradeHistoryItem(productID: '', imagePath: 'assets/images/books.jpeg', productTitle: 'Engineering Books', productDescription: 'Engineering books for 3rd year', productPrice: 1258.0,isSelected: false),
  TradeHistoryItem(productID: '', imagePath: 'assets/images/edraw.jpg', productTitle: 'Engineering Drawing Box', productDescription: 'Box used for 1 year', productPrice: 250.0,isSelected: false),
  TradeHistoryItem(productID: '', imagePath: 'assets/images/laptop.jpg', productTitle: 'Apple MacBook pro', productDescription: 'MacBook Pro used for 2 years', productPrice: 35000.0,isSelected: false),
];

List<TradeHistoryItem> purchasedProductsList = [
  TradeHistoryItem(productID: '', imagePath: 'assets/images/apron.jpeg', productTitle: 'WorkShop Apron', productDescription: 'WorkShop Apron used for 1 year', productPrice: 60.0,isSelected: false),
  TradeHistoryItem(productID: '', imagePath: 'assets/images/books.jpeg', productTitle: 'Engineering Books', productDescription: 'Engineering books for 3rd year', productPrice: 1258.0,isSelected: false),
  TradeHistoryItem(productID: '', imagePath: 'assets/images/edraw.jpg', productTitle: 'Engineering Drawing Box for Second Year', productDescription: 'Box used for 1 year', productPrice: 250.0,isSelected: false),
  TradeHistoryItem(productID: '', imagePath: 'assets/images/laptop.jpg', productTitle: 'Apple MacBook pro', productDescription: 'MacBook Pro used for 2 years', productPrice: 35000.0,isSelected: false),
  TradeHistoryItem(productID: '', imagePath: 'assets/images/apron.jpeg', productTitle: 'WorkShop Apron', productDescription: 'WorkShop Apron used for 1 year', productPrice: 60.0,isSelected: false),
  TradeHistoryItem(productID: '', imagePath: 'assets/images/books.jpeg', productTitle: 'Engineering Books', productDescription: 'Engineering books for 3rd year', productPrice: 1258.0,isSelected: false),
  TradeHistoryItem(productID: '', imagePath: 'assets/images/edraw.jpg', productTitle: 'Engineering Drawing Box', productDescription: 'Box used for 1 year', productPrice: 250.0,isSelected: false),
  TradeHistoryItem(productID: '', imagePath: 'assets/images/laptop.jpg', productTitle: 'Apple MacBook pro', productDescription: 'MacBook Pro used for 2 years', productPrice: 35000.0,isSelected: false),
];

List<String> imagePaths = [
  'assets/images/apron.jpeg',
  'assets/images/books.jpeg',
  'assets/images/edraw.jpg',
  'assets/images/laptop.jpg',
  'assets/images/logo_name.png',
];