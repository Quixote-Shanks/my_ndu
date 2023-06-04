import 'package:flutter/material.dart';
import 'dart:async';


class TaskListPage extends StatefulWidget {
  @override
  _TaskListPageState createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> {
  final List<Task> tasks = [
    Task(
      name: 'Complete Math Assignment',
      deadline: DateTime(2023, 5, 20),
      reward: '10 Points',
      assignedBy: 'Professor X',
    ),
    Task(
      name: 'Prepare for Exam',
      deadline: DateTime(2023, 6, 1),
      reward: '20 Points',
      assignedBy: 'Professor Y',
    ),
    Task(
      name: 'Write Research Paper',
      deadline: DateTime(2023, 7, 15),
      reward: '30 Points',
      assignedBy: 'Professor Z',
    ),
  ];

  int tokenCount = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Token Count: $tokenCount',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  task: tasks[index],
                  onTaskCompleted: (reward) {
                    setState(() {
                      tokenCount += reward;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement task assignment functionality for admins
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class TaskTile extends StatefulWidget {
  final Task task;
  final ValueChanged<int> onTaskCompleted;

  TaskTile({required this.task, required this.onTaskCompleted});

  @override
  _TaskTileState createState() => _TaskTileState();
}

class _TaskTileState extends State<TaskTile> {
  late Timer _timer;
  late Duration _duration;
  String _timeRemaining = '';

  @override
  void initState() {
    super.initState();
    _duration = widget.task.deadline.difference(DateTime.now());
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _duration = _duration - Duration(seconds: 1);
        if (_duration.inSeconds <= 0) {
          _timer.cancel();
        }
        _timeRemaining = _formatDuration(_duration);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    String minutes = twoDigits(duration.inMinutes.remainder(60));
    String seconds = twoDigits(duration.inSeconds.remainder(60));
    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          widget.task.name,
          style: TextStyle(fontSize: 18),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 8),
            Row(
              children: [
                Text(
                  'Assigned By: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.task.assignedBy),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'Deadline: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.task.deadline.toString()),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'Time Remaining: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(_timeRemaining),
              ],
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Text(
                  'Reward: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(widget.task.reward),
              ],
            ),
          ],
        ),
        trailing: IconButton(
          icon: Icon(Icons.check_circle),
          onPressed: () {
            widget.onTaskCompleted(int.parse(widget.task.reward.split(' ')[0]));
          },
        ),
      ),
    );
  }
}

class Task {
  final String name;
  final DateTime deadline;
  final String reward;
  final String assignedBy;

  Task({
    required this.name,
    required this.deadline,
    required this.reward,
    required this.assignedBy,
  });
}
