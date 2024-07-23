import 'package:amit_5/counter_cubit/cubit.dart';
import 'package:amit_5/counter_cubit/states.dart';
import 'package:amit_5/counter_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async{
  runApp( MyApp(),);
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Counter(),
    );
  }
}
