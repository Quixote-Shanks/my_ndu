class Schedule {
  final String startTime;
  final String endTime;
  final String className;
  final String classLocation;

  Schedule({
    required this.startTime,
    required this.endTime,
    required this.className,
    required this.classLocation,
  });
}


class DaySchedule {
  final String day;
  final List<Schedule> schedule;

  DaySchedule({
    required this.day,
    required this.schedule,
  });
}
