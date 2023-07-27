import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_picker/flutter_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class Tankverwalter extends StatefulWidget {
  const Tankverwalter({Key? key}) : super(key: key);

  @override
  _TankverwalterState createState() => _TankverwalterState();
}

class _TankverwalterState extends State<Tankverwalter> {
  int gesamtkilometer = 0;
  int getankteLiter = 0;
  int gefahreneKilometer = 0;
  double literpreis = 1.80;
  SharedPreferences? prefs;
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  List<Map<String, dynamic>> tankvorgaenge = [];

  @override
  void initState() {
    super.initState();
    _loadData();
    _selectedDay = _focusedDay;
  }

  _loadData() async {
    prefs = await SharedPreferences.getInstance();
    setState(() {
      gesamtkilometer = (prefs?.getInt('gesamtkilometer') ?? 200000);
      getankteLiter = (prefs?.getInt('getankteLiter') ?? 0);
      gefahreneKilometer = (prefs?.getInt('gefahreneKilometer') ?? 0);
      literpreis = (prefs?.getDouble('literpreis') ?? 1.80);
      String? tankvorgaengeStr = prefs?.getString('tankvorgaenge');
      if (tankvorgaengeStr != null) {
        tankvorgaenge = List<Map<String, dynamic>>.from(jsonDecode(tankvorgaengeStr));
      }
    });
  }

  _saveData() async {
    await prefs?.setInt('gesamtkilometer', gesamtkilometer);
    await prefs?.setInt('getankteLiter', getankteLiter);
    await prefs?.setInt('gefahreneKilometer', gefahreneKilometer);
    await prefs?.setDouble('literpreis', literpreis);
    await prefs?.setString('tankvorgaenge', jsonEncode(tankvorgaenge));
  }

  double berechneDurchschnittsverbrauch() {
    double gesamtKilometer = 0;
    double gesamtLiter = 0;

    for (var vorgang in tankvorgaenge) {
      gesamtKilometer += vorgang['gefahreneKilometer'];
      gesamtLiter += vorgang['getankteLiter'];
    }

    return gesamtKilometer / gesamtLiter;
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tankverwalter Seite'),
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Text('Willkommen auf der Tankverwalter Seite!',
                  style: TextStyle(fontSize: screenSize.width * 0.05)),
              Text('Gesamtkilometer: $gesamtkilometer',
                  style: TextStyle(fontSize: screenSize.width * 0.04)),
              Picker(
                adapter: NumberPickerAdapter(data: [
                  NumberPickerColumn(begin: 0, end: 999999, onFormatValue: (v) {
                    return v.toString().padLeft(6, '0');
                  }),
                ]),
                selecteds: [gesamtkilometer],
                title: const Text('Bitte wählen Sie den Gesamtkilometerstand'),
                onConfirm: (Picker picker, List value) {
                  setState(() {
                    gesamtkilometer = picker.getSelectedValues()[0];
                    _saveData();
                  });
                }
              ).makePicker(),
              Text('Getankte Liter: $getankteLiter',
                  style: TextStyle(fontSize: screenSize.width * 0.04)),
              Picker(
                adapter: NumberPickerAdapter(data: [
                  const NumberPickerColumn(begin: 0, end: 100, jump: 1),
                ]),
                selecteds: [getankteLiter],
                title: const Text('Bitte wählen Sie die getankten Liter'),
                onConfirm: (Picker picker, List value) {
                  setState(() {
                    getankteLiter = picker.getSelectedValues()[0];
                    _saveData();
                  });
                }
              ).makePicker(),
              Text('Gefahrene Kilometer mit letzter Tankfüllung: $gefahreneKilometer',
                  style: TextStyle(fontSize: screenSize.width * 0.04)),
              Picker(
                adapter: NumberPickerAdapter(data: [
                  const NumberPickerColumn(begin: 0, end: 999999, jump: 1),
                ]),
                selecteds: [gefahreneKilometer],
                title: const Text('Bitte wählen Sie die gefahrenen Kilometer mit letzter Tankfüllung'),
                onConfirm: (Picker picker, List value) {
                  setState(() {
                    gefahreneKilometer = picker.getSelectedValues()[0];
                    _saveData();
                  });
                }
              ).makePicker(),
              Text('Literpreis: $literpreis EUR',
                  style: TextStyle(fontSize: screenSize.width * 0.04)),
              Picker(
                adapter: NumberPickerAdapter(data: [
                  NumberPickerColumn(begin: 0, end: 10000, jump: 1, onFormatValue: (v) {
                    return (v / 100).toString();
                  }),
                ]),
                selecteds: [(literpreis * 100).toInt()],
                title: const Text('Bitte wählen Sie den Literpreis'),
                onConfirm: (Picker picker, List value) {
                  setState(() {
                    literpreis = picker.getSelectedValues()[0] / 100;
                    _saveData();
                  });
                }
              ).makePicker(),
              TableCalendar(
                firstDay: DateTime.utc(2010, 10, 16),
                lastDay: DateTime.utc(2030, 3, 14),
                focusedDay: _focusedDay,
                calendarFormat: _calendarFormat,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  tankvorgaenge.add({
                    'gesamtkilometer': gesamtkilometer,
                    'getankteLiter': getankteLiter,
                    'gefahreneKilometer': gefahreneKilometer,
                    'literpreis': literpreis,
                  });
                  _saveData();
                  print('Durchschnittsverbrauch: ${berechneDurchschnittsverbrauch()}');
                },
                child: const Text('Log Benzintankvorgang'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogPage(tankvorgaenge: tankvorgaenge)),
                  );
                },
                child: const Text('Show Log'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LogPage extends StatelessWidget {
  final List<Map<String, dynamic>> tankvorgaenge;

  const LogPage({Key? key, required this.tankvorgaenge}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Page'),
      ),
      body: ListView.builder(
        itemCount: tankvorgaenge.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Gesamtkilometer: ${tankvorgaenge[index]['gesamtkilometer']}'),
            subtitle: Text('Getankte Liter: ${tankvorgaenge[index]['getankteLiter']}\n'
                           'Gefahrene Kilometer: ${tankvorgaenge[index]['gefahreneKilometer']}\n'
                           'Literpreis: ${tankvorgaenge[index]['literpreis']}'),
          );
        },
      ),
    );
  }
}
