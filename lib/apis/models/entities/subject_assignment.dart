import 'package:hive/hive.dart';

enum SubjectAssignmentType { turnedIn, missing }

@HiveType(typeId: 2)
class SubjectAssignment extends HiveObject {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final DateTime postedAt;
  @HiveField(4)
  final DateTime dueAt;
  @HiveField(5)
  final int subjectId;
  @HiveField(6)
  final SubjectAssignmentType type;

  SubjectAssignment({
    required this.id,
    required this.title,
    required this.description,
    required this.postedAt,
    required this.dueAt,
    required this.subjectId,
    required this.type,
  });

  factory SubjectAssignment.fromJson(Map<String, dynamic> json) => SubjectAssignment(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    postedAt: DateTime.parse(json['postedAt']),
    dueAt: DateTime.parse(json['dueAt']),
    subjectId: json['subjectId'],
    type: json['type'] == 'turnedIn' ? SubjectAssignmentType.turnedIn : SubjectAssignmentType.missing
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'postedAt': postedAt.toIso8601String(),
    'dueAt': dueAt.toIso8601String(),
    'subjectId': subjectId,
    'type': type == SubjectAssignmentType.turnedIn ? 'turnedIn' : 'missing'
  };
}
