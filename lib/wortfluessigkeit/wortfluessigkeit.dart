import 'package:flutter/material.dart';
import 'history_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SB MedAT-H Wortflüssigkeit',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const HistoryManager(),
    );
  }
}