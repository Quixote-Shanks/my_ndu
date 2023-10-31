
class CalendarAPIService {
  Future<Map<String, dynamic>> fetchCalendarData() async {
    await Future.delayed(Duration(seconds: 2));  // Simulate network delay

    // Dummy data for demonstration
    var data = {
      'events': ['Event 1', 'Event 2', 'Event 3'],
      'holidays': ['Holiday 1', 'Holiday 2'],
    };

    return data;
  }
}

