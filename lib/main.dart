import 'package:dies_und_das/einkaufshelfer/einkaufshelfer.dart';
import 'package:flutter/material.dart';
import 'osternrechner/osternrechner.dart';
import 'tankverwalter/tankverwalter.dart';
import 'wortfluessigkeit/history_manager.dart';
import 'physikplot/physikplot_tv4.dart';
import 'einkaufshelfer/einkaufshelfer.dart';

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
            title: const Text('Home Page'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 50),
                ElevatedButton.icon(
                  icon: const Icon(Icons.date_range,
                      size: 30), // Symbol für Osternrechner
                  label: const Text('Gaußscher Ostern-Rechner'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OsterPage()),
                    );
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton.icon(
                  icon: const Icon(Icons.local_gas_station,
                      size: 30), // Symbol für Tankverwalter
                  label: const Text('Tankverwalter'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Tankverwalter()),
                    );
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton.icon(
                  icon: const Icon(Icons.record_voice_over,
                      size: 30), // Symbol für Wortflüssigkeit
                  label: const Text('Wortflüssigkeit'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HistoryManager()),
                    );
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton.icon(
                  icon: const Icon(Icons.auto_awesome,
                      size: 30), // Symbol for Physikplot TV4
                  label: const Text('P II - TV 4'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PhysikplotTV4()),
                    );
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton.icon(
                  icon: const Icon(Icons.shopping_cart, size: 30),
                  label: const Text('Einkaufshelfer'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Einkaufshelfer()),
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
