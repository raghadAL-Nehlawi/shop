import 'package:flutter/cupertino.dart';
import 'package:shop/providers/cart.dart';

class OrderItem with ChangeNotifier {
  String id;
  List<CartItem> cartItems;
  double total;
  DateTime time;

  OrderItem({this.id, this.cartItems, this.total, this.time});
}

class Orders with ChangeNotifier {
  List<OrderItem> _ordersList = [];

  List<OrderItem> get orders {
    return [..._ordersList];
  }

  void addOrderToList(List<CartItem> cartItems, double total) {
    _ordersList.add(OrderItem(
        id: DateTime.now().toString(),
        cartItems: cartItems,
        time: DateTime.now(),
        total: total));
    notifyListeners();
  }
}
