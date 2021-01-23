import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/Orders.dart';

class OrderItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderItem>(context);
    return Card(
      elevation: 10,
      child: ListTile(
        title: Text(order.total.toString()),
        subtitle: Text(DateFormat('DD/MM/yyyy hh:mm').format(order.time)),
        trailing: IconButton(
          icon: Icon(Icons.arrow_drop_down),
          onPressed: () {},
        ),
      ),
    );
  }
}
