import 'package:flutter/material.dart';

class OurButton extends StatelessWidget {
  void Function() fun;
  String? Function(String?)? myValidator;
  String btnText;
   OurButton({super.key, required this.fun,required this.btnText});

  @override
  Widget build(BuildContext context) {
    return  InkWell(
              onTap: fun,
               child: Container(
                margin: EdgeInsets.all (15),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.38,
                height: 60,
                color: Colors.blue,
                child: Text(btnText,
                style: TextStyle(color: Colors.white,fontSize: 30),),
               ),
             );
  }
}