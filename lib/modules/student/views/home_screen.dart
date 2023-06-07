import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'time_table.dart';



class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _jsonTimetable = "";

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  Future<void> _loadJsonData() async {
    try {
      String jsonString = await rootBundle.loadString('assets/your_json_file.json');
      setState(() {
        _jsonTimetable = jsonString;
      });
    } catch (e) {
      print("Failed to load JSON data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _jsonTimetable.isEmpty
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: TimetablePage(),
                ),
              ],
            ),
    );
  }
}
