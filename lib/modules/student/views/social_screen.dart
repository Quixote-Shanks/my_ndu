import 'package:flutter/material.dart';

class ForumSelectionScreen extends StatefulWidget {
  const ForumSelectionScreen({Key? key}) : super(key: key);

  @override
  _ForumSelectionScreenState createState() => _ForumSelectionScreenState();
}

class _ForumSelectionScreenState extends State<ForumSelectionScreen> {
  String _selectedForumOption = 'University-wide Forum';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Select a Forum',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 24.0),
          DropdownButton<String>(
            value: _selectedForumOption,
            items: [
              const DropdownMenuItem<String>(
                  value: 'University-wide Forum',
                  child: Text('University-wide Forum',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500))),
              const DropdownMenuItem<String>(
                  value: 'Faculty Forum',
                  child: Text('Faculty Forum',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500))),
            ],
            onChanged: (selectedOption) {
              setState(() {
                _selectedForumOption = selectedOption!;
                if (_selectedForumOption == 'Faculty Forum') {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FacultyForumScreen()));
                } else {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const StudentForumScreen()));
                }
              });
            },
            dropdownColor: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}

class StudentForumScreen extends StatefulWidget {
  const StudentForumScreen({Key? key}) : super(key: key);

  @override
  _StudentForumScreenState createState() => _StudentForumScreenState();
}

class _StudentForumScreenState extends State<StudentForumScreen> {
  final List<String> _forumMessages = [];

  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('University-wide Forum',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _forumMessages.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_forumMessages[index]),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message here...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      setState(() {
                        _forumMessages.add(_messageController.text);
                        _messageController.clear();
                      });
                    }
                  },
                  child: const Text('Post'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FacultyForumScreen extends StatefulWidget {
  const FacultyForumScreen({Key? key}) : super(key: key);

  @override
  _FacultyForumScreenState createState() => _FacultyForumScreenState();
}

class _FacultyForumScreenState extends State<FacultyForumScreen> {
  final List<String> _facultyMessages = [];

  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Faculty Forum'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _facultyMessages.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(_facultyMessages[index]),
                );
              },
            ),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type your message here...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 16.0),
                ElevatedButton(
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      setState(() {
                        _facultyMessages.add(_messageController.text);
                        _messageController.clear();
                      });
                    }
                  },
                  child: const Text('Post'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
