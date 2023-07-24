import 'package:flutter/material.dart';
import 'osternrechner.dart';
import 'tankverwalter/tankverwalter.dart';
import 'wortfluessigkeit/history_manager.dart';  // Neuer Import

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
                const SizedBox(height: 50),  // Abstand hinzufügen
                ElevatedButton.icon(
                  icon: const Icon(Icons.date_range, size: 30),  // Symbol für Osternrechner
                  label: const Text('Gaußscher Ostern-Rechner'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const OsterPage()),
                    );
                  },
                ),
                const SizedBox(height: 50),  // Abstand hinzufügen
                ElevatedButton.icon(
                  icon: const Icon(Icons.local_gas_station, size: 30),  // Symbol für Tankverwalter
                  label: const Text('Tankverwalter'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const Tankverwalter()),
                    );
                  },
                ),
                const SizedBox(height: 50),  // Abstand hinzufügen
                ElevatedButton.icon(
                  icon: const Icon(Icons.record_voice_over, size: 30),  // Symbol für Wortflüssigkeit
                  label: const Text('Wortflüssigkeit'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HistoryManager()),
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
