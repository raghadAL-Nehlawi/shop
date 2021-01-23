import 'package:flutter/material.dart';
import 'package:shop/screens/OrderScreen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: Text('Option'),
            backgroundColor: Theme.of(context).primaryColor,
            automaticallyImplyLeading: false,
          ),
          Divider(
            height: 25,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
            child: ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('GO TO SHOP PAGE'),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(OrdersScreen.routeName);
            },
            child: ListTile(
              leading: Icon(Icons.assignment_outlined),
              title: Text('GO TO ORDER PAGE'),
            ),
          ),
        ],
      ),
    );
  }
}
