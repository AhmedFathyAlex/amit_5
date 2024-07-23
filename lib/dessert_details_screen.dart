
import 'package:amit_5/dessert_model.dart';
import 'package:flutter/material.dart';

class DessertDetailsScreen extends StatelessWidget {
  const DessertDetailsScreen({super.key, required this.dessert});
    final Dessert dessert;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page for ${dessert.name}'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 250,
                  height: 250,
                  child: Image.asset(dessert.imageUrl),
                ),
              ),
              Text(dessert.name, style: Theme.of(context).textTheme.titleLarge),
              Text(dessert.description, style: Theme.of(context).textTheme.titleMedium),
            ],
      ),
    ),
    );
  }
}
