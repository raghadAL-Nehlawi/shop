import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/Orders.dart';
import 'package:shop/providers/Products.dart';
import 'package:shop/providers/cart.dart';
import 'package:shop/screens/CartScreen.dart';
import 'package:shop/screens/GridProduct.dart';
import 'package:shop/screens/OrderScreen.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Products()),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Orders())
      ],
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => GridList(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
        },
      ),
    );
  }
}
