import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:intl/intl.dart';

import 'social_screen.dart';
import 'table.dart';

class Classroom {
  final String? location;
  final String? officeHours;

  Classroom({this.location, this.officeHours});
}

class UpcomingClass {
  final String? courseName;
  final String? courseCode;
  final DateTime? startTime;
  final DateTime? endTime;
  final Classroom? classroom;

  UpcomingClass({
    this.courseName,
    this.courseCode,
    this.startTime,
    this.endTime,
    this.classroom,
  });
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _jsonTimetable;
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadJsonData();
  }

  Future<void> _loadJsonData() async {
    String jsonString =
        await rootBundle.loadString('assets/your_json_file.json');
    setState(() {
      _jsonTimetable = jsonString;
    });
  }

  final List<UpcomingClass> upcomingClasses = [
    UpcomingClass(
      courseName: 'Introduction to Computer Science',
      courseCode: 'COMP 101',
      startTime: DateTime.parse('2023-04-05 10:00:00'),
      endTime: DateTime.parse('2023-04-05 11:50:00'),
      classroom: Classroom(
        location: 'Smith Hall 101',
        officeHours: 'Monday-Friday, 9:00am-5:00pm',
      ),
    ),
    UpcomingClass(
      courseName: 'Data Structures and Algorithms',
      courseCode: 'COMP 201',
      startTime: DateTime.parse('2023-04-06 13:00:00'),
      endTime: DateTime.parse('2023-04-06 14:50:00'),
      classroom: Classroom(
        location: 'Johnson Hall 202',
        officeHours: 'Monday-Thursday, 1:00pm-3:00pm',
      ),
    ),
    UpcomingClass(
      courseName: 'Web Development',
      courseCode: 'COMP 301',
      startTime: DateTime.parse('2023-04-07 15:00:00'),
      endTime: DateTime.parse('2023-04-07 16:50:00'),
      classroom: Classroom(
        location: 'Brown Hall 303',
        officeHours: 'Tuesday-Friday, 2:00pm-4:00pm',
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const BouncingScrollPhysics(),
        controller: PageController(initialPage: _currentPageIndex),
        children: <Widget>[
          Scaffold(
            // appBar: AppBar(
            //   systemOverlayStyle: SystemUiOverlayStyle(),
            //   elevation: 0,
            //   scrolledUnderElevation: 5,
            //   leading: CircleAvatar(
            //     child: Text('A', style: const TextStyle(fontSize: 20)),
            //   ),
            //   title: const Text('Alice', style: const TextStyle(fontSize: 20)),
            // ),
            body: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildListDelegate([
                    // SizedBox(height: MediaQuery.of(context).padding.top),
                    if (_jsonTimetable == null)
                      const CircularProgressIndicator()
                    else
                      TimetableSection(jsonTimetable: _jsonTimetable),
                    const SizedBox(height: 20),
                    buildUpcomingClassesSection(upcomingClasses),
                    const SizedBox(height: 20),
                    buildAnnouncementsSection(),
                    const SizedBox(height: 20),
                    // other sections...
                  ]),
                ),
              ],
            ),
          ),
          const Scaffold(
            // appBar: AppBar(
            //   leading: CircleAvatar(
            //     child: Text('A', style: const TextStyle(fontSize: 20)),
            //   ),
            //   title: const Text('Alice', style: const TextStyle(fontSize: 20)),
            // ),
            body: ForumSelectionScreen(),
          ),
        ],
      ),
    );
  }
}

Widget buildUpcomingClassesSection(List<UpcomingClass> upcomingClasses) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 2,
          blurRadius: 4,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Upcoming Classes',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: upcomingClasses.length,
            itemBuilder: (context, index) {
              final upcomingClass = upcomingClasses[index];
              return Container(
                width: 280,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      upcomingClass.courseName!,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          DateFormat('EEE, MMM d, yyyy')
                              .format(upcomingClass.startTime!),
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[900],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.access_time, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          '${DateFormat('h:mm a').format(upcomingClass.startTime!)} - ${DateFormat('h:mm a').format(upcomingClass.endTime!)}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[900],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.location_on, size: 20),
                        const SizedBox(width: 8),
                        Text(
                          upcomingClass.classroom!.location!,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[900],
                          ),
                        ),
                      ],
                    ),
                    // Row(
                    //   children: [
                    //     Icon(Icons.access_time, size: 20),
                    //     SizedBox(width: 8),
                    //     Text(
                    //       upcomingClass.classroom.officeHours,
                    //       style: TextStyle(
                    //         fontSize: 18,
                    //         color: Colors.grey[900],
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}

Widget buildTimetableSection() {
  return SingleChildScrollView(
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
  );
}

Widget buildClassroomInfoSection() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const Text(
          'Classroom Information',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            const Icon(Icons.location_on, size: 20),
            const SizedBox(width: 10),
            const Text(
              'Room 123, Building A',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: <Widget>[
            const Icon(Icons.access_time, size: 20),
            const SizedBox(width: 10),
            const Text(
              'Office Hours: Mon-Fri, 9am-5pm',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget buildAnnouncementsSection() {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          blurRadius: 5,
          offset: const Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Announcements',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[900],
          ),
        ),
        const SizedBox(height: 20),
        AnnouncementTile(
          title: 'Welcome to Math 101!',
          subtitle: 'Posted by John Doe',
          date: 'March 29, 2023',
        ),
        const Divider(height: 20, thickness: 1),
        AnnouncementTile(
          title: 'Homework Due Next Week',
          subtitle: 'Posted by John Doe',
          date: 'March 30, 2023',
        ),
        const Divider(height: 20, thickness: 1),
        AnnouncementTile(
          title: 'Midterm Exam Postponed',
          subtitle: 'Posted by John Doe',
          date: 'March 31, 2023',
        ),
      ],
    ),
  );
}

class AnnouncementTile extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? date;

  AnnouncementTile({
    this.title,
    this.subtitle,
    this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title!,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.blueGrey[900],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle!,
          style: TextStyle(
            fontSize: 14,
            color: Colors.blueGrey[700],
          ),
        ),
        const SizedBox(height: 5),
        Text(
          date!,
          style: TextStyle(
            fontSize: 14,
            color: Colors.blueGrey[700],
          ),
        ),
      ],
    );
  }
}
