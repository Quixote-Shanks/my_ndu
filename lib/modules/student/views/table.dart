import 'dart:convert';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';

import 'course_details_screen.dart';

class TimetableSection extends StatefulWidget {
  final String? jsonTimetable;

  TimetableSection({this.jsonTimetable});

  @override
  _TimetableSectionState createState() => _TimetableSectionState();
}

class _TimetableSectionState extends State<TimetableSection> {
  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> timetableData = json.decode(widget.jsonTimetable!);
    List daysData = timetableData['days'];

    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(10),
          alignment: Alignment.centerLeft,
          child: const Text(
            'Timetable',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        InkWell(
          onTap: () {
            cardKey.currentState!.toggleCard();
          },
          child: FlipCard(
              key: cardKey,
              flipOnTouch: false,
              direction: FlipDirection.HORIZONTAL,
              speed: 500,
              front: Card(
                child: Table(
                  border: TableBorder.all(
                    color: Colors.grey,
                    width: 1,
                    style: BorderStyle.solid,
                  ),
                  defaultColumnWidth: const FlexColumnWidth(1.0),
                  children: [
                    TableRow(
                      children: [
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              'Day',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              'Time',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              'Course Code',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        TableCell(
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            child: const Text(
                              'Location',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    for (var i = 0; i < daysData.length; i++)
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                daysData[i]['day'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          TableCell(
                            child: Column(
                              children: [
                                for (var j = 0;
                                    j < daysData[i]['schedule'].length;
                                    j++)
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      '${daysData[i]['schedule'][j]['start_time']} - ${daysData[i]['schedule'][j]['end_time']}',
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          TableCell(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                for (var j = 0;
                                    j < daysData[i]['schedule'].length;
                                    j++)
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      daysData[i]['schedule'][j]['class_name'],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          TableCell(
                            child: Column(
                              children: [
                                for (var j = 0;
                                    j < daysData[i]['schedule'].length;
                                    j++)
                                  Container(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Text(
                                      daysData[i]['schedule'][j]
                                          ['class_location'],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
              back: MyApp()),
        ),
      ],
    );
  }
}
