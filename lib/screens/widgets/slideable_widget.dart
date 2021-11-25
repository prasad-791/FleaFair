import 'package:flea_fair/configurations/config.dart';
import 'package:flea_fair/screens/widgets/favourite_item_widget.dart';
import 'package:flea_fair/screens/widgets/shopping_cart_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';


//ignore: must_be_immutable
class SlideAbleWidget extends StatefulWidget {
  late FavouriteItemWidget favouriteItemWidget;
  late ShoppingCartItemWidget shoppingCartItemWidget;
  final bool isFavourite;
  final Function deleteItem;
  SlideAbleWidget({Key? key,required this.isFavourite,required this.favouriteItemWidget,required this.deleteItem}) : super(key: key);
  SlideAbleWidget.fromShoppingCart({Key? key,required this.isFavourite,required this.shoppingCartItemWidget,required this.deleteItem}) : super(key: key);

  @override
  _SlideAbleWidgetState createState() => _SlideAbleWidgetState();
}

class _SlideAbleWidgetState extends State<SlideAbleWidget> {
  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.20,
      child: widget.isFavourite ? widget.favouriteItemWidget : widget.shoppingCartItemWidget,
      secondaryActions: [
        IconSlideAction(
          caption: 'Share',
          color: Colors.transparent,
          icon: Icons.share,
          foregroundColor: primaryBlueLight,
          onTap: (){},
        ),
        IconSlideAction(
          caption: 'Delete',
          color: Colors.transparent,
          icon: Icons.delete,
          foregroundColor: Colors.black,
          onTap: (){
            widget.deleteItem();
          },
        ),
      ],
    );
  }
}
