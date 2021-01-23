import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/Orders.dart';
import 'package:shop/widgets/CartItemWidget.dart';

class OrderItemWidget extends StatefulWidget {
  bool expand = false;

  @override
  _OrderItemWidgetState createState() => _OrderItemWidgetState();
}

class _OrderItemWidgetState extends State<OrderItemWidget> {
  @override
  Widget build(BuildContext context) {
    final order = Provider.of<OrderItem>(context);
    return widget.expand
        ? Column(
            children: [
              ListTile(
                title: Text(order.total.toString()),
                subtitle:
                    Text(DateFormat('DD/MM/yyyy hh:mm').format(order.time)),
                trailing: IconButton(
                  icon: Icon(Icons.expand_less),
                  onPressed: () {
                    setState(() {
                      widget.expand = false;
                    });
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                height: min(order.cartItems.length * 50.0 + 10, 100),
                child: ListView.builder(
                  itemCount: order.cartItems.length,
                  itemBuilder: (ctx, i) {
                    return Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            order.cartItems[i].title,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${order.cartItems[i].quantity}x \$${order.cartItems[i].price}',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          )
        : ListTile(
            title: Text(order.total.toString()),
            subtitle: Text(DateFormat('DD/MM/yyyy hh:mm').format(order.time)),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {
                setState(() {
                  widget.expand = true;
                });
              },
            ),
          );
  }
}
