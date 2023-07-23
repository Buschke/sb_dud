import 'package:flutter/material.dart';

class Tankverwalter extends StatelessWidget {
  const Tankverwalter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tankverwalter Seite'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: Text('Willkommen auf der Tankverwalter Seite!')),
      ),
    );
  }
}
