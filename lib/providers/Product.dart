



import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  String id;
  String name;
  String description;
  double price;
  String imgUrl;
  bool isFavorite ;

  Product(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.imgUrl,
      this.isFavorite = false});

  toggleFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
