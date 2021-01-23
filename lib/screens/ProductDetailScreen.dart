import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/Products.dart';

class ProductDetailScreen extends StatelessWidget {
  final String routeName = '/productdetainsceen';
  final String productID;

  ProductDetailScreen({this.productID});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Products>(context).findById(productID);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(product.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              product.imgUrl,
              fit: BoxFit.cover,
            ),
            Text(
              'Price: ' + product.price.toString() +'\$',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            SizedBox(height: 20,),
            Text(
              'description: ' + product.description,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
