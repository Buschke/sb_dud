import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gaußsche Osterformel'),
        ),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Center(child: MeineStartseite()),
        ),
      ),
    );
  }
}

class Osterrechner {
  DateTime berechneOstern(int jahr) {
    int a = jahr % 19;
    int b = jahr % 4;
    int c = jahr % 7;
    int k = jahr ~/ 100;
    int p = (8 * k + 13) ~/ 25;
    int q = k ~/ 4;
    int M = (15 + k - p - q) % 30;
    int d = (19 * a + M) % 30;
    int N = (4 + k - q) % 7;
    int e = (2 * b + 4 * c + 6 * d + N) % 7;
    int os = 22 + d + e;
    if (os > 31) {
      return DateTime(jahr, 4, os - 31);
    } else {
      return DateTime(jahr, 3, os);
    }
  }
}

class MeineStartseite extends StatefulWidget {
  const MeineStartseite({Key? key}) : super(key: key);

  @override
  State<MeineStartseite> createState() => _MeineStartseiteState();
}

class _MeineStartseiteState extends State<MeineStartseite> {
  String platzhalter = '';
  int ausgewaehltesJahr = DateTime.now().year;
  final Osterrechner osterrechner = Osterrechner();
  final FixedExtentScrollController scrollController =
      FixedExtentScrollController(initialItem: DateTime.now().year);

  @override
  Widget build(BuildContext context) {
    List<int> jahresliste = List<int>.generate(2501, (int index) => index);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Hier wird das Osterdatum berechnet.',
            style: TextStyle(fontSize: 20)),
        const SizedBox(height: 20),
        SizedBox(
          height: 150.0,
          child: CupertinoPicker(
            scrollController: scrollController,
            backgroundColor: Colors.white,
            itemExtent: 30,
            onSelectedItemChanged: (int index) {
              setState(() {
                ausgewaehltesJahr = jahresliste[index];
              });
            },
            children:
                jahresliste.map((int value) => Text(value.toString())).toList(),
          ),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            setState(() {
              DateTime osterdatum =
                  osterrechner.berechneOstern(ausgewaehltesJahr);
              platzhalter =
                  'Ostern im Jahr $ausgewaehltesJahr ist am ${osterdatum.day}.${osterdatum.month}.';
            });
          },
          child: const Text('Berechne Osterdatum'),
        ),
        const SizedBox(height: 20),
        Text(platzhalter, style: const TextStyle(fontSize: 18)),
      ],
    );
  }
}
