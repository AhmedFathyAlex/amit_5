import 'package:amit_5/product_card.dart';
import 'package:flutter/material.dart';

class Ecommerce extends StatelessWidget {
   Ecommerce({super.key});
    bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(context: context,
         builder:(context) {
         return Container(
            width: double.infinity,
            height: 300,
          );
        },);
      }),
      backgroundColor: Colors.green,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(children: [
                ProductCard(),
                ProductCard(),
              ],),
              Row(children: [
                ProductCard(),
                ProductCard(),
              ],),
              Row(children: [
                ProductCard(),
                ProductCard(),
              ],),
              Row(children: [
                ProductCard(),
                ProductCard(),
              ],),
            ],
          ),
        )),
    );
  }
}
