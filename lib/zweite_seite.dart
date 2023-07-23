import 'package:flutter/material.dart';

class ZweiteSeite extends StatelessWidget {
  const ZweiteSeite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Zweite Seite'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(child: Text('Willkommen auf der zweiten Seite!')),
      ),
    );
  }
}
