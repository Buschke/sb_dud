import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const PhysikplotTV4());
}

class PhysikplotTV4 extends StatelessWidget {
  const PhysikplotTV4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TV4: Frequenzabhängigkeit der Netto-Spannung'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ScatterChart(
            ScatterChartData(
              minX: 500,
              maxX: 1000,
              minY: 0,
              maxY: 250,
              scatterSpots: [
                ScatterSpot(980, 8.511),
                ScatterSpot(881, 20.452),
                ScatterSpot(856, 37.591),
                ScatterSpot(834, 115.467),
                ScatterSpot(818, 242.990),
                ScatterSpot(810, 157.287),
                ScatterSpot(801, 105.887),
                ScatterSpot(778, 60.417),
                ScatterSpot(718, 37.737),
                ScatterSpot(671, 18.055),
                ScatterSpot(630, 10.754),
                ScatterSpot(582, 7.285),
                ScatterSpot(528, 8.748),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
