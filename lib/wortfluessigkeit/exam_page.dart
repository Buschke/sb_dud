// ignore_for_file: library_private_types_in_public_api

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ExamPage extends StatefulWidget {
  final Function(String) addToHistory;
  const ExamPage({required this.addToHistory, Key? key}) : super(key: key);

  @override
  _ExamPageState createState() => _ExamPageState();
}

class _ExamPageState extends State<ExamPage> {
  late List<TextEditingController> _controllers;
  List<String>? randomWords;
  List<String>? shuffledWords;
  List<String> _results = [];
  final Random _random = Random(); // Reuse same instance
  Timer? _timer;
  int _timeRemaining = 20 * 60; // 20 minutes in seconds
  bool _examStarted = false;
  final List<String> shuffledNouns = List.from(nouns)
    ..shuffle(); // Shuffled once

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(15, (index) => TextEditingController());
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void startExam() {
    randomWords =
        List.generate(15, (index) => shuffledNouns[index].toUpperCase());
    shuffledWords = randomWords!.map((word) => shuffleWord(word)).toList();
    _results = [];
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_timeRemaining == 0) {
        timer.cancel();
        showResults();
      } else {
        setState(() {
          _timeRemaining--;
        });
      }
    });
    setState(() {
      _examStarted = true;
    });
  }

  String shuffleWord(String word) {
    List<String> letters = word.split('');
    letters.shuffle(_random); // Use the same random instance
    return letters.join();
  }

  void showResults() {
    int correct = 0;
    for (int i = 0; i < 15; i++) {
      if (_controllers[i].text.toUpperCase() == randomWords![i]) {
        correct++;
        _results.add(
            'Word: ${randomWords![i]}, Shuffled: ${shuffledWords![i]}, User Entry: ${_controllers[i].text}, Correct!');
      } else {
        _results.add(
            'Word: ${randomWords![i]}, Shuffled: ${shuffledWords![i]}, User Entry: ${_controllers[i].text}, Incorrect!');
      }
    }
    _results.add('You got $correct out of 15 words correct.');
    setState(() {
      _examStarted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exam'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Time Remaining: ${_timeRemaining ~/ 60}:${(_timeRemaining % 60).toString().padLeft(2, '0')}',
              style: const TextStyle(fontSize: 18.0),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ..._examStarted
                  ? [
                      Center(
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width *
                              0.8, // Adjust this value to set the table width
                          child: Table(
                            columnWidths: const {
                              0: FlexColumnWidth(0.8), // Shuffled words column
                              1: FlexColumnWidth(1.2), // Text field column
                            },
                            children: List.generate(
                              15,
                              (index) => TableRow(
                                children: [
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        shuffledWords![index],
                                        style: const TextStyle(fontSize: 24),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                        controller: _controllers[index],
                                        decoration: InputDecoration(
                                          border: const OutlineInputBorder(),
                                          labelText: 'Enter word ${index + 1}',
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ]
                  : _results
                      .map((result) => RichText(
                            text: TextSpan(
                              text: result.contains(',')
                                  ? result.substring(0, result.lastIndexOf(','))
                                  : result,
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: result.endsWith('Correct!')
                                      ? ' Correct!'
                                      : ' Incorrect!',
                                  style: TextStyle(
                                    color: result.endsWith('Correct!')
                                        ? Colors.green
                                        : Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ))
                      .toList(),
              const SizedBox(height: 10),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (!_examStarted) {
                      startExam();
                    } else {
                      _timer?.cancel();
                      showResults();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    minimumSize: const Size(200, 50),
                  ),
                  child: Text(_examStarted ? 'Finish' : 'Start'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
