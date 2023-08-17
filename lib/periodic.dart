// import 'package:flutter/material.dart';

// class PeriodicTableScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Periodic Table'),
//       ),
//       body: Center(
//         child: GridView.builder(
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 18, // Adjust the count as needed
//           ),
//           itemBuilder: (BuildContext context, int index) {
//             return Container(
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.grey),
//               ),
//               child: Center(
//                 child: Text(
//                   'Element $index',
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
