import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/Product.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/screens/ProductDetailScreen.dart';

class ProductWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Product product = Provider.of<Product>(context, listen: false);
    final Cart cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ProductDetailScreen(
                productID: product.id,
              ),
            ),
          );
        },
        child: GridTile(
          child: Image.network(
            product.imgUrl,
            fit: BoxFit.cover,
          ),
          footer: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GridTileBar(
              leading: Consumer<Product>(
                builder: (ctx, product, child) => IconButton(
                  onPressed: () {
                    product.toggleFavorite();
                  },
                  icon: product.isFavorite
                      ? Icon(
                          Icons.favorite,
                          color: Theme.of(context).accentColor,
                        )
                      : Icon(
                          Icons.favorite_border,
                          color: Theme.of(context).accentColor,
                        ),
                ),
              ),
              trailing: IconButton(
                icon: Icon(
                  Icons.shopping_cart_rounded,
                  color: Theme.of(context).accentColor,
                ),
                onPressed: () {
                  cart.addToCart(product.id, product.price, product.name);
                  print(cart.items.length);
                },
              ),
              title: Text(
                product.name,
                textAlign: TextAlign.center,
              ),
              subtitle: Text(product.price.toString()),
              backgroundColor: Colors.black45,
            ),
          ),
        ),
      ),
    );
  }
}
