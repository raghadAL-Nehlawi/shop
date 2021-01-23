import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/Orders.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/widgets/CartItemWidget.dart';
import 'package:shop/widgets/MainDrawer.dart';

class CartScreen extends StatelessWidget {
  static const String routeName = '/cartscreen';

  @override
  Widget build(BuildContext context) {
    final cartItems = Provider.of<Cart>(context);
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text('MY CART'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      cartItems.total.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                  FlatButton(
                    textColor: Theme.of(context).primaryColor,
                    child: Text('Order Now'),
                    onPressed: () {
                      orders.addOrderToList(
                          cartItems.items.values.toList(), cartItems.total);
                      cartItems.clear();
                    },
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartItems.items.values.toList().length,
              itemBuilder: (ctx, i) {
                return CartItemWidget(
                  cartItem: cartItems.items.values.toList()[i],
                  keyItem: cartItems.items.keys.toList()[i],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
