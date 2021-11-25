
class FavouriteItem{
  final String productID;
  final String imagePath;
  final String productTitle;
  final String productDescription;
  final double productPrice;
  late bool addedToCart = false;
  late bool isSelected = false;

  FavouriteItem({required this.productID,required this.imagePath,required this.productTitle,
    required this.productDescription,required this.productPrice,required this.addedToCart,required this.isSelected});
}