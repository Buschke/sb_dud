import 'package:flutter/material.dart';
import 'osternrechner.dart';
import 'tankverwalter.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text('Hauptseite'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50),
                ElevatedButton.icon(
                  icon: const Icon(Icons.date_range, size: 30),
                  label: const Text('Osternrechner'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OsterPage()),
                    );
                  },
                ),
                SizedBox(height: 50),
                ElevatedButton.icon(
                  icon: const Icon(Icons.local_gas_station, size: 30),
                  label: const Text('Tankverwalter'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Tankverwalter()),
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
