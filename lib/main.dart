import 'package:flutter/material.dart';
import 'osternrechner.dart';  // Aktualisierter Import
import 'zweite_seite.dart';

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
                  icon: const Icon(Icons.pageview, size: 30),  // Symbol für Zweite Seite
                  label: const Text('Go to Zweite Seite'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ZweiteSeite()),
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
