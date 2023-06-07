import 'package:flutter/material.dart';
import 'table_maker.dart';

class TimetablePage extends StatefulWidget {
  final String jsonTimetable;

  TimetablePage({required this.jsonTimetable});

  @override
  _TimetablePageState createState() => _TimetablePageState();
}

class _TimetablePageState extends State<TimetablePage> {
  List<Widget> timetableItems = [];

  @override
  void initState() {
    super.initState();
    generateTimetable();
  }

  void generateTimetable() {
    final tableMaker = TableMaker();
    tableMaker.initializeData(widget.jsonTimetable);
    timetableItems = tableMaker.allItems;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Timetable'),
      ),
      body: ListView.builder(
        itemCount: timetableItems.length,
        itemBuilder: (context, index) {
          return timetableItems[index];
        },
      ),
    );
  }
}
