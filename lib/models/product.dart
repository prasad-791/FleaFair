class Product{
  final String productID;
  final List<String> images;
  final String productTitle;
  final String productDescription;
  final double productPrice;
  late bool addedToCart = false;
  late bool isFav = false;

  Product({required this.productID,required this.images,required this.productTitle,
    required this.productDescription,required this.productPrice,required this.addedToCart, required this.isFav});
}