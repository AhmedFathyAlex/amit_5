// import 'package:amit_5/main.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// class Screen2 extends StatelessWidget {
//   const Screen2({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(),
//       body:  Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text('You have pushed the button this many times:'),
//             Consumer<Counter>(
//               builder: (context, counter, child) => Text(
//                 '${counter.value}',
//                 style: Theme.of(context).textTheme.headlineMedium,
//               ),
//             ),
//           ],
//         ),
//       ),
//        floatingActionButton: FloatingActionButton(
//         onPressed: () {
          
//          context.read<Counter>().increment();
//         },
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }