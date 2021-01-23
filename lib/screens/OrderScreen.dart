import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/Orders.dart';
import 'package:shop/widgets/MainDrawer.dart';
import 'package:shop/widgets/OrderItemWidget.dart';

class OrdersScreen extends StatelessWidget {
  static const String routeName = '/ordersScreen';

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text('Orders'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: ListView.builder(
        itemCount: orders.orders.length,
        itemBuilder: (ctx, i) {
          return ChangeNotifierProvider.value(
            value: orders.orders[i],
            child: OrderItemWidget(),
          );
        },
      ),
    );
  }
}
