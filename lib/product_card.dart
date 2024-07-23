import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
          margin: EdgeInsets.all(15),
          padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
          height: 320,
          width: 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            children: [
              Image.network("https://static.nike.com/a/images/t_PDP_1280_v1/f_auto,q_auto:eco/99486859-0ff3-46b4-949b-2d16af2ad421/custom-nike-dunk-high-by-you-shoes.png",height:150),
              SizedBox(height: 15,),
              Row(
                children: [
                  Text("Jacket",style: TextStyle(fontWeight: FontWeight.w600),),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text("150 EGP",style: TextStyle(fontWeight: FontWeight.w600),),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Text("150 EGP",style: TextStyle(color: Colors.grey,decoration: TextDecoration.lineThrough),),
                ],
              ),
              SizedBox(height: 5,),
              Row(
                children: [
                  Container(
                    width: 120,
                    height: 30,
                    decoration: BoxDecoration(color: Colors.green,borderRadius: BorderRadius.circular(5)),
                    child: Center(child: Text("Buy now",style: TextStyle(color: Colors.white),)),
                  ),
                  SizedBox(width: 10,),
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(color: Colors.grey.shade300,borderRadius: BorderRadius.circular(5)),
                    child: Center(child: Icon(Icons.add)),
                  ),
                ],
              )
            ],
          ),
        );
  }
}