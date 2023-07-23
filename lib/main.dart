import 'package:flutter/material.dart';
import 'osternrechner.dart';  // Aktualisierter Import
import 'tankverwalter.dart';  // Aktualisierter Import

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(builder: (context) =>
        Scaffold(
          appBar: AppBar(
            title: const Text('Home Page'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),  // Abstand hinzufügen
                ElevatedButton.icon(
                  icon: const Icon(Icons.date_range, size: 30),  // Symbol für Osternrechner
                  label: const Text('Go to Oster Page'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OsterPage()),
                    );
                  },
                ),
                SizedBox(height: 50),  // Abstand hinzufügen
                ElevatedButton.icon(
                  icon: const Icon(Icons.local_gas_station, size: 30),  // Symbol für Tankverwalter
                  label: const Text('Go to Tankverwalter'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Tankverwalter()),  // Aktualisierter Seitenname
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
