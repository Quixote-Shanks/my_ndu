
class HomeAPIService {
  Future<Map<String, dynamic>> fetchHomeData() async {
    await Future.delayed(Duration(seconds: 2));  // Simulate network delay

    // Dummy data for demonstration
    var data = {
      'welcomeMessage': 'Welcome to Virtual Classroom',
      'notifications': ['Notification 1', 'Notification 2'],
      'upcomingClasses': ['Math', 'Science'],
    };

    return data;
  }
}

