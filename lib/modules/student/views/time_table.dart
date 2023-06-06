import 'package:flutter/material.dart';

class StudentTimetable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Student Timetable'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Fall Semester 2023',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Table(
                columnWidths: {
                  0: const FlexColumnWidth(1),
                  1: const FlexColumnWidth(2),
                  2: const FlexColumnWidth(2),
                  3: const FlexColumnWidth(2),
                  4: const FlexColumnWidth(2),
                  5: const FlexColumnWidth(2),
                  6: const FlexColumnWidth(2),
                },
                children: [
                  TableRow(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                    children: [
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Time',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Monday',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Tuesday',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Wednesday',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Thursday',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Friday',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Saturday',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: [
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('8:00 AM'),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('SS101'),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('MA101'),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(''),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('CS101'),
                        ),
                      ),
                      const TableCell(
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(''),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DataTable(
                              columns: const [
                                DataColumn(label: Text('')),
                                DataColumn(label: Text('Monday')),
                                DataColumn(label: Text('Tuesday')),
                                DataColumn(label: Text('Wednesday')),
                                DataColumn(label: Text('Thursday')),
                                DataColumn(label: Text('Friday')),
                              ],
                              rows: const [
                                DataRow(cells: [
                                  DataCell(Text('8:00 AM')),
                                  DataCell(Text('SS-101')),
                                  DataCell(Text('M-101')),
                                  DataCell(Text('')),
                                  DataCell(Text('CSE-101')),
                                  DataCell(Text('')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('9:00 AM')),
                                  DataCell(Text('SS-101')),
                                  DataCell(Text('M-101')),
                                  DataCell(Text('E-101')),
                                  DataCell(Text('CSE-101')),
                                  DataCell(Text('')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('10:00 AM')),
                                  DataCell(Text('A-101')),
                                  DataCell(Text('M-101')),
                                  DataCell(Text('E-101')),
                                  DataCell(Text('CSE-101')),
                                  DataCell(Text('P-101')),
                                ]),
                                DataRow(cells: [
                                  DataCell(Text('11:00 AM')),
                                  DataCell(Text('A-101')),
                                  DataCell(Text('M-101')),
                                  DataCell(Text('E-101')),
                                  DataCell(Text('CSE-101')),
                                  DataCell(Text('P-101')),
                                ]),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
