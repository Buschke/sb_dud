import 'package:flutter/material.dart';
import 'home_page.dart';
import 'learnphase_page.dart';
import 'exam_page.dart';

class MyAppPage extends StatefulWidget {
  final Function(String) addToHistory;
  final List<String> history;

  const MyAppPage({required this.addToHistory, required this.history, Key? key})
      : super(key: key);

  @override
  State<MyAppPage> createState() => _MyAppPageState();
}

class _MyAppPageState extends State<MyAppPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetOptions = <Widget>[
      HomePage(history: widget.history),
      LearnphasePage(addToHistory: widget.addToHistory),
      ExamPage(addToHistory: widget.addToHistory),
    ];

    void onItemTapped(int index) {
      setState(() {
        _selectedIndex = index;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('MedAT-H Wortflüssigkeit'),
      ),
      body: widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Start',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Lernphase',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment_turned_in),
            label: 'Examensphase',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Theme.of(context).primaryColorDark,
        onTap: onItemTapped,
      ),
    );
  }
}