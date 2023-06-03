import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'student.g.dart';

@CopyWith()
@JsonSerializable()
@HiveType(typeId: 99) // Provide the desired typeId for the Student entity
class Student {
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
  });

  factory Student.fromJson(Map<String, dynamic> json) =>
      _$StudentFromJson(json);

  Map<String, dynamic> toJson() => _$StudentToJson(this);

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
  final Map<String, dynamic>? personalizedDashboard;

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
}
