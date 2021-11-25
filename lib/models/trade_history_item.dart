class TradeHistoryItem{
  final String productID;
  final String imagePath;
  final String productTitle;
  final String productDescription;
  final double productPrice;
  late bool isSelected = false;

  TradeHistoryItem({required this.productID,required this.imagePath,required this.productTitle,
    required this.productDescription,required this.productPrice,required this.isSelected});
}