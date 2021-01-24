import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/cart.dart';

class CartItemWidget extends StatelessWidget {
  final CartItem cartItem;
  final String keyItem;

  CartItemWidget({this.cartItem, this.keyItem});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Dismissible(
      confirmDismiss: (_) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text('Do you want remove it?'),
                  actions: [
                    FlatButton(
                      child: Text('Yes'),
                      onPressed: () {
                        Navigator.of(context).pop(true);
                      },
                    ),
                    FlatButton(
                        child: Text('No'),
                        onPressed: () {
                          Navigator.of(context).pop(false);
                        })
                  ],
                ));
      },
      onDismissed: (_) {
        cart.removeItem(keyItem);
      },
      key: ValueKey(cartItem.id),
      direction: DismissDirection.endToStart,
      background: Card(
        elevation: 10,
        child: Container(
          padding: EdgeInsets.all(10),
          color: Colors.red,
          alignment: Alignment.centerRight,
          child: Icon(
            Icons.delete,
            color: Colors.white,
          ),
        ),
      ),
      child: Card(
        elevation: 10,
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Theme.of(context).primaryColor,
            radius: 30,
            child: FittedBox(
              child: Text(
                cartItem.price.toString(),
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
          ),
          title: Text(cartItem.title),
          subtitle: Text('total: ' + cartItem.allPrice.toString()),
          trailing: Text('×' + cartItem.quantity.toString()),
        ),
      ),
    );
  }
}
