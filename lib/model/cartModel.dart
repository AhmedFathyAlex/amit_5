import 'package:amit_5/model/itemModel.dart';
import 'package:flutter/material.dart';

class CartModel with ChangeNotifier{
  List<ItemModel> cartItems = [];

  void addToCart(ItemModel item){
    cartItems.add(item);
    notifyListeners();
  }

  void removeFromItem(ItemModel item){
    cartItems.remove(item);
    notifyListeners();
  }
}