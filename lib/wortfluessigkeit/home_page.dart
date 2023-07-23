import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List<String> history;

  const HomePage({required this.history, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int total = history.length;
    int correct =
        history.where((element) => element.contains('Correct!')).length;
    double percentage = total != 0 ? (correct / total) * 100 : 0;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Stats', style: Theme.of(context).textTheme.headlineMedium),
          const SizedBox(height: 16),
          Text('Total words: $total',
              style: Theme.of(context).textTheme.titleLarge),
          Text('Correct words: $correct',
              style: Theme.of(context).textTheme.titleLarge),
          Text('Accuracy: ${percentage.toStringAsFixed(2)}%',
              style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Text('History', style: Theme.of(context).textTheme.headlineMedium),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(top: 8),
              itemCount: history.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 8),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade200,
                  ),
                  child: Text(history[index],
                      style: Theme.of(context).textTheme.bodyLarge),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}