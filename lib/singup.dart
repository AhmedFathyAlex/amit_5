import 'package:amit_5/app_text_field.dart';
import 'package:amit_5/ecommerce.dart';
import 'package:amit_5/our_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUp extends StatelessWidget {
   SignUp({super.key});
   GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /*
            TextFormField(
              // validator: (value) {
              //   if(value!.contains('@')){
              //     return null;
              //   }else{
              //     return 'Wrong email';
              //   }
              // },
               decoration: const InputDecoration(
          border:  OutlineInputBorder(),
          hintText: 'email'
        ),
            ),
            TextFormField(
              obscureText: true,
              // validator: (value) {
              //   if(value!.length >= 6){
              //     return null;
              //   }else{
              //     return 'weak password';
              //   }
              // },
               decoration: const InputDecoration(
          border:  OutlineInputBorder(),
          hintText: 'password'
        ),
            ),
            */
            OurButton(fun: () {

              //  if(formKey.currentState!.validate()){
              //   SharedPreferences storage = await SharedPreferences.getInstance();
              //   storage.setString('email','' );

              //  }
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return Ecommerce();
              }));  
            }, btnText: 'Sign Up')
          ],
        ),
      ),
    );
  }
}