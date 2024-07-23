import 'package:amit_5/model/cartModel.dart';
import 'package:amit_5/model/itemModel.dart';
import 'package:amit_5/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogScreen extends StatelessWidget {
  CatalogScreen({super.key});
  List<ItemModel> items = [
    ItemModel(name: 'test', price: 12),
    ItemModel(name: 'test1', price: 12),
    ItemModel(name: 'test2', price: 12),
    ItemModel(name: 'test3', price: 12),
    ItemModel(name: 'test4', price: 12),
    ItemModel(name: 'test5', price: 12),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shop'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return CartScreen();
                    },
                  ),
                );
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (context, index) {
            var item = items[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.price.toString()),
              leading: CircleAvatar(
                child: Text(item.itemId.toString()),
              ),
              trailing: TextButton(
                child: Text('Add'),
                onPressed: () {
                  context.read<CartModel>().addToCart(item);
                },
              ),
            );
          },
          itemCount: items.length,
        ),
      ),
    );
  }
}
