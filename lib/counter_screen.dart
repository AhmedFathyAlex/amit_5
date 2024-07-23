import 'package:flutter/material.dart';
class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){
                  setState(() {
                    counter--;
                  });
                }, 
                child: Icon(Icons.remove)),
                Text('$counter'),
                TextButton(onPressed: (){
                  setState(() {
                    counter++;
                  });
                }, 
                child: Icon(Icons.add)),
              ],
            ),
            )
    );
  }
}
