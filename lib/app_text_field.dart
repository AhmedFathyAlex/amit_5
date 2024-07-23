import 'package:flutter/material.dart';

class AppTextFeild extends StatelessWidget {
  const AppTextFeild({super.key , required this.hint, this.isPassword = false, required this.contr});

  final String hint;
  final bool isPassword;
  final TextEditingController contr;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal:  20.0,vertical: 10),
      child:  TextField(
        controller: contr,
      obscureText: isPassword,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: hint
        ),
      ),
    );
  }
}