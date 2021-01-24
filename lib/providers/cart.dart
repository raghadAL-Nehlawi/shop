import 'package:flutter/foundation.dart';

class CartItem {
  String id;
  String title;
  double price;
  int quantity;

  CartItem({this.id, this.title, this.price, this.quantity});

  double get allPrice {
    return price * quantity;
  }
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addToCart(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(
          productId,
          (existingItem) => CartItem(
              id: existingItem.id,
              price: existingItem.price,
              title: existingItem.title,
              quantity: existingItem.quantity + 1));
    } else {
      _items[productId] = new CartItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          quantity: 1);
    }

    notifyListeners();
  }

  void removeItem(String key) {
    _items.remove(key);
    notifyListeners();
  }

  double get total {
    double total = 0.0;
    _items.forEach((key, value) {
      total += value.quantity * value.price;
    });
    return total;
  }

  removeAddition(String id) {
    if (!_items.containsKey(id)) return;
    if (_items[id].quantity > 1)
      _items[id].quantity--;
    else
      _items.remove(id);
    notifyListeners();
  }

  clear() {
    _items = {};
  }
}
