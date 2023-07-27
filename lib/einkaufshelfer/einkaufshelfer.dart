import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../main.dart';

class Einkaufshelfer extends StatelessWidget {
  const Einkaufshelfer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.home),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MainApp()),
              );
            },
          ),
          title: Text('Einkaufshelfer')),
      body: Center(
        child: Text('Hi'),
      ),
    );
  }
}

// class EinkaufshelferApp extends StatelessWidget {
//   const EinkaufshelferApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }

// class EinkaufshelferApp extends StatelessWidget {
//   const EinkaufshelferApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(actions: [

//       ]),
//     );
//   }
// }

// class StartseiteEinkauf extends StatefulWidget {
//   const StartseiteEinkauf({super.key});

//   @override
//   _StartseiteEinkaufZustand createState() => _StartseiteEinkaufZustand();
// }

// class _StartseiteEinkaufZustand extends State<StartseiteEinkauf> {
//   int _ausgewaehlterIndex = 0;
//   final List<String> _optionen = ['ALDI', 'Lidl', 'Rewe'];

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: const CupertinoNavigationBar(
//         middle: Text('Einkaufshilfe'),
//       ),
//       child: Center(
//         child: CupertinoPicker(
//           itemExtent: 32.0,
//           onSelectedItemChanged: (index) {
//             setState(() {
//               _ausgewaehlterIndex = index;
//             });
//           },
//           children: _optionen.map((option) => Text(option)).toList(),
//         ),
//       ),
//     );
//   }
// }
