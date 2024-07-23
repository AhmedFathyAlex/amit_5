// ignore_for_file: prefer_const_literals_to_create_immutables
import 'dart:convert';

import 'package:amit_5/article_model.dart';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class NewsScreen extends StatefulWidget {

  NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<ArticleModel> articles = [];
  List<Widget> bodies = [
    Center(child: Text('home'),),
    Center(child: Text('buisness'),),
    Center(child: Text('sports'),)
  ];
  int index = 0;
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        currentIndex: index,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Buisness'),
        BottomNavigationBarItem(icon: Icon(Icons.sports_basketball),label: 'Sports'),
      ],),
      body: bodies[index]
       );
  }

  // fetchNews()async{
  //   print('Fetching news....');
  //   var response = await get(Uri.parse('https://newsapi.org/v2/top-headlines?country=eg&apiKey=a6d3520040fc4c378ac9c1ae7807be5c'));
  //   var data = jsonDecode(response.body);
  //   List articlesAsMaps = data['articles'];
  //   print('List before loop ${articles.length}');
  //   for (var element in articlesAsMaps) {
  //     var model = ArticleModel.fromJson(element);
  //     setState(() {
  //      articles.add(model); 
  //     });
      
  //   }
  //   print('List after loop ${articles.length}');
  // }
}
