import 'package:amit_5/model/cartModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: Text('Cart'),),
      body: Center(child: Consumer<CartModel>(builder: (context, cart, child) {
        var list = cart.cartItems;
        return ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            var item = list[index];
            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.price.toString()),
              leading: CircleAvatar(
                child: Text(item.itemId.toString()),
              ),
              trailing: TextButton(
                child: Text('remove'),
                onPressed: () {
                  context.read<CartModel>().removeFromItem(item);
                },
              ),
            );
          },
        );
      },
      ),
      ),
    );
  }
}