import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/Product.dart';
import 'package:shop/providers/Products.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/screens/CartScreen.dart';
import 'package:shop/widgets/ProductWdiget.dart';

enum OnSelectedItem {
  All,
  Favorite,
}

class GridList extends StatefulWidget {
  @override
  _GridListState createState() => _GridListState();
}

class _GridListState extends State<GridList> {
  bool showFavorite = false;

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context, listen: true);

    List<Product> products;
    showFavorite
        ? products = productsData.favoriteItems
        : products = productsData.items;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Shop"),
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.of(context).pushNamed(CartScreen.routeName);
            },
          ),
          PopupMenuButton(
            onSelected: (onSelected) {
              setState(() {
                if (onSelected == OnSelectedItem.Favorite)
                  showFavorite = true;
                else
                  showFavorite = false;
              });
            },
            itemBuilder: (ctx) => [
              PopupMenuItem(
                child: Text('All product'),
                value: OnSelectedItem.All,
              ),
              PopupMenuItem(
                child: Text('Favorite'),
                value: OnSelectedItem.Favorite,
              )
            ],
          )
        ],
      ),
      body: GridView.builder(
        itemCount: products.length,
        padding: EdgeInsets.all(5),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 2,
        ),
        itemBuilder: (ctx, i) => MultiProvider(
          providers: [
            ChangeNotifierProvider.value(
              value: products[i],
            ),
            // ChangeNotifierProvider.value(value: Cart())
          ],
          child: ProductWidget(),
        ),
      ),
    );
  }
}
