
class ShoppingCartItem{
  final String productID;
  final String imagePath;
  final String productTitle;
  final String productDescription;
  final double productPrice;
  final int noOfItems;
  late bool isSelected = false;
  ShoppingCartItem({required this.productID, required this.imagePath, required this.productTitle, required this.productDescription, required this.productPrice, required this.noOfItems,required this.isSelected});
}