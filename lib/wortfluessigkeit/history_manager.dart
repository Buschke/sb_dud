// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'my_app_page.dart';

class HistoryManager extends StatefulWidget {
  const HistoryManager({Key? key}) : super(key: key);

  @override
  _HistoryManagerState createState() => _HistoryManagerState();
}

class _HistoryManagerState extends State<HistoryManager> {
  List<String> history = [];

  void addToHistory(String entry) {
    setState(() {
      history.add(entry);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyAppPage(addToHistory: addToHistory, history: history);
  }
}