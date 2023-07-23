// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'dart:math';

class LearnphasePage extends StatefulWidget {
  final Function(String) addToHistory;
  const LearnphasePage({required this.addToHistory, Key? key})
      : super(key: key);

  @override
  _LearnphasePageState createState() => _LearnphasePageState();
}

String shuffleWord(String word) {
  List<String> letters = word.split('');
  letters.shuffle(Random());
  return letters.join();
}

class _LearnphasePageState extends State<LearnphasePage> {
  final TextEditingController _controller = TextEditingController();
  String randomWord = (List.from(nouns)..shuffle()).first.toUpperCase();
  final Random random = Random();

  String _message = '';
  Color _messageColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    String shuffledWord = shuffleWord(randomWord);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(shuffledWord,
              style:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          SizedBox(
            width: 200,
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter the word',
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (_controller.text.toUpperCase() == randomWord) {
                  _message = 'Correct!';
                  _messageColor = Colors.green;
                  widget.addToHistory(
                      'Word: $randomWord, Shuffled: $shuffledWord, User Entry: ${_controller.text}, Correct!');
                } else {
                  _message = 'Incorrect! The correct word was $randomWord.';
                  _messageColor = Colors.red;
                  widget.addToHistory(
                      'Word: $randomWord, Shuffled: $shuffledWord, User Entry: ${_controller.text}, Incorrect!');
                }
              });
            },
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              minimumSize: const Size(200, 50),
            ),
            child: const Text('Check'),
          ),
          const SizedBox(height: 20),
          Text(_message, style: TextStyle(color: _messageColor)),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              setState(() {
                randomWord = (List.from(nouns)..shuffle()).first.toUpperCase();
                _message = '';
                _controller.clear();
              });
            },
            style: ElevatedButton.styleFrom(
              textStyle: const TextStyle(fontSize: 20),
              minimumSize: const Size(200, 50),
            ),
            child: const Text('Next Word'),
          ),
        ],
      ),
    );
  }
}
