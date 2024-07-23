import 'package:amit_5/dessert_model.dart';
import 'package:flutter/material.dart';

class DessertsListScreen extends StatelessWidget {
  final List<Dessert> desserts;
  final ValueChanged<Dessert> onTapped;
 
  const DessertsListScreen({
    super.key,
    required this.desserts,
    required this.onTapped,
  });
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Desserts'),
      ),
      body: ListView(
        children: [
          for (var dessert in desserts)
            ListTile(
              trailing: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  width: 72,
                  height: 72,
                  child: Image.asset(dessert.imageUrl),
                ),
              ),
              title: Text(dessert.name),
              subtitle: Text(dessert.description),
              onTap: () => onTapped(dessert),
            )
        ],
      ),
    );
  }
}
