import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'dart:convert';

class ScheduleScreen extends StatefulWidget {
  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  // final TableCalendarController _calendarController = TableCalendarController();


  List<Schedule> timetable = [];
  List<Schedule> otherSchedules = [];

  @override
  void initState() {
    super.initState();
    loadScheduleData();
  }

  void loadScheduleData() async {
    String jsonData =
        '''{
          "lecturerName": "Dr. John Doe",
          "timetable": [
            {
              "day": "Monday",
              "courses": [
                {
                  "courseName": "Mathematics",
                  "time": "9:00 AM - 10:30 AM"
                },
                {
                  "courseName": "Physics",
                  "time": "11:00 AM - 12:30 PM"
                }
              ]
            },
            {
              "day": "Tuesday",
              "courses": [
                {
                  "courseName": "Chemistry",
                  "time": "9:00 AM - 10:30 AM"
                },
                {
                  "courseName": "Biology",
                  "time": "11:00 AM - 12:30 PM"
                }
              ]
            },
            {
              "day": "Wednesday",
              "courses": [
                {
                  "courseName": "Computer Science",
                  "time": "9:00 AM - 10:30 AM"
                }
              ]
            }
          ],
          "events": [
            {
              "eventName": "Faculty Meeting",
              "date": "2023-06-15",
              "time": "2:00 PM - 4:00 PM",
              "location": "Conference Room A"
            },
            {
              "eventName": "Guest Lecture",
              "date": "2023-06-20",
              "time": "10:00 AM - 12:00 PM",
              "location": "Auditorium"
            }
          ],
          "meetings": [
            {
              "meetingName": "Research Discussion",
              "date": "2023-06-10",
              "time": "11:00 AM - 12:00 PM",
              "location": "Office 202"
            },
            {
              "meetingName": "Departmental Meeting",
              "date": "2023-06-18",
              "time": "3:00 PM - 4:00 PM",
              "location": "Meeting Room B"
            }
          ]
        }''';

    Map<String, dynamic> jsonDataMap = json.decode(jsonData);
    List<dynamic> timetableJson = jsonDataMap['timetable'];
    List<dynamic> otherSchedulesJson = [
      ...jsonDataMap['events'],
      ...jsonDataMap['meetings']
    ];

    setState(() {
      timetable = timetableJson
          .map((item) => Schedule.fromJson(item))
          .toList(growable: false);
      otherSchedules = otherSchedulesJson
          .map((item) => Schedule.fromJson(item))
          .toList(growable: false);
    });
  }

  // void dispose() {
  //   _calendarController.dispose();
  //   super.dispose();
  // }

  List<Schedule> getUpcomingSchedules() {
    DateTime currentDate = DateTime.now();
    return otherSchedules
        .where((schedule) =>
            DateTime.parse(schedule.date).isAfter(currentDate))
        .toList(growable: false);
  }

  Widget buildTimetableSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Timetable',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: timetable.length,
          itemBuilder: (context, index) {
            final schedule = timetable[index];
            return ScheduleCard(schedule: schedule);
          },
        ),
      ],
    );
  }

  Widget buildOtherSchedulesSection() {
    List<Schedule> upcomingSchedules = getUpcomingSchedules();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Other Schedules',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: upcomingSchedules.length,
          itemBuilder: (context, index) {
            final schedule = upcomingSchedules[index];
            return ScheduleCard(schedule: schedule);
          },
        ),
      ],
    );
  }

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text(
        'Schedule',
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TableCalendar(
              // calendarController: _calendarController,
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2023, 12, 31),
              // initialCalendarFormat: CalendarFormat.week,
              formatAnimationDuration: Duration(milliseconds: 300),
              headerStyle: HeaderStyle(
                // centerHeaderTitle: true,
                formatButtonVisible: false,
                titleTextStyle: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              calendarStyle: CalendarStyle(
                // todayColor: Colors.orange,
                // selectedColor: Theme.of(context).primaryColor,
                todayTextStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
            ),
          ),
          buildTimetableSection(),
          buildOtherSchedulesSection(),
        ],
      ),
    ),
  );
}
}


class ScheduleCard extends StatelessWidget {
  final Schedule schedule;

  ScheduleCard({required this.schedule});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(
          schedule.courseName,
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          schedule.time,
          style: TextStyle(fontSize: 14.0),
        ),
        trailing: Icon(Icons.arrow_forward),
        onTap: () {
          // Handle schedule item tap
        },
      ),
    );
  }
}

class Schedule {
  final String courseName;
  final String time;
  final String date;
  final String location;

  Schedule({
    required this.courseName,
    required this.time,
    required this.date,
    required this.location,
  });

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      courseName: json['courseName'] ?? '',
      time: json['time'] ?? '',
      date: json['date'] ?? '',
      location: json['location'] ?? '',
    );
  }
}
