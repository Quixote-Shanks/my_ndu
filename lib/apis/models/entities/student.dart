import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';


part 'student.g.dart';


@CopyWith()
@JsonSerializable()
@HiveType(typeId: 99)
class Student {
  @JsonKey(name: 'yearOfStudy')
  @HiveField(0)
  final int yearOfStudy;


  @JsonKey(name: 'department')
  @HiveField(1)
  final String department;


  @JsonKey(name: 'timetable')
  @HiveField(2)
  final String? timetable;


  @JsonKey(name: 'courses')
  @HiveField(3)
  final List<String>? courses;


  @JsonKey(name: 'personalizedDashboard')
  @HiveField(4)
  late final Map<String, dynamic>? personalizedDashboard;


  @JsonKey(name: 'tasks')
  @HiveField(5)
  final List<String>? tasks;


  @JsonKey(name: 'events')
  @HiveField(6)
  final List<String>? events;


  @JsonKey(name: 'topicDiscussions')
  @HiveField(7)
  final List<String>? topicDiscussions;


  @JsonKey(name: 'notifications')
  @HiveField(8)
  final List<String>? notifications;


  @JsonKey(name: 'classroomCollaboration')
  @HiveField(9)
  final Map<String, bool>? classroomCollaboration;


  @JsonKey(name: 'peerToPeerLearning')
  @HiveField(10)
  final Map<String, bool>? peerToPeerLearning;


  @JsonKey(name: 'taskAssignmentManagement')
  @HiveField(11)
  final Map<String, List<dynamic>>? taskAssignmentManagement;


  @JsonKey(name: 'eventsActivities')
  @HiveField(12)
  final Map<String, List<dynamic>>? eventsActivities;


  @JsonKey(name: 'analyticsInsights')
  @HiveField(13)
  final Map<String, dynamic>? analyticsInsights;


  @JsonKey(name: 'learningToolIntegration')
  @HiveField(14)
  final Map<String, List<dynamic>>? learningToolIntegration;


  @JsonKey(name: 'customizationOptions')
  @HiveField(15)
  final Map<String, dynamic>? customizationOptions;


  @JsonKey(name: 'courseRep')
  @HiveField(16)
  final bool courseRep;


  @JsonKey(name: 'faculty')
  @HiveField(17)
  final String faculty;


  @JsonKey(name: 'courseRepresentatives')
  @HiveField(18)
  final List<CourseRepresentative>? courseRepresentatives;


  @JsonKey(name: 'studentOffices')
  @HiveField(19)
  final List<StudentOffice>? studentOffices;


  Student({
    required this.yearOfStudy,
    required this.department,
    this.timetable,
    this.courses,
    this.personalizedDashboard,
    this.tasks,
    this.events,
    this.topicDiscussions,
    this.notifications,
    this.classroomCollaboration,
    this.peerToPeerLearning,
    this.taskAssignmentManagement,
    this.eventsActivities,
    this.analyticsInsights,
    this.learningToolIntegration,
    this.customizationOptions,
    required this.courseRep,
    required this.faculty,
    this.courseRepresentatives,
    this.studentOffices,
  });


  factory Student.fromJson(Map<String, dynamic> json) => _$StudentFromJson(json);


  Map<String, dynamic> toJson() => _$StudentToJson(this);
}


@JsonSerializable()
class CourseRepresentative {
  final String course;
  final List<String> responsibilities;


  CourseRepresentative({
    required this.course,
    required this.responsibilities,
  });


  factory CourseRepresentative.fromJson(Map<String, dynamic> json) => _$CourseRepresentativeFromJson(json);


  Map<String, dynamic> toJson() => _$CourseRepresentativeToJson(this);
}


@JsonSerializable()
class StudentOffice {
  final String name;
  final String position;
  final DateTime startDate;
  final DateTime endDate;


  StudentOffice({
    required this.name,
    required this.position,
    required this.startDate,
    required this.endDate,
  });


  factory StudentOffice.fromJson(Map<String, dynamic> json) => _$StudentOfficeFromJson(json);


  Map<String, dynamic> toJson() => _$StudentOfficeToJson(this);
}





