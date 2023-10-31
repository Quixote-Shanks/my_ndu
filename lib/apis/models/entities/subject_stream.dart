import 'package:hive/hive.dart';

enum SubjectStreamType { material, quiz }

@HiveType(typeId: 3)
class SubjectStream {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final DateTime postedAt;
  @HiveField(3)
  final SubjectStreamType type;
  @HiveField(4)
  final int subjectId;

  SubjectStream({
    required this.id,
    required this.title,
    required this.postedAt,
    required this.type,
    required this.subjectId,
  });

  factory SubjectStream.fromJson(Map<String, dynamic> json) => SubjectStream(
    id: json['id'],
    title: json['title'],
    postedAt: DateTime.parse(json['postedAt']),
    type: json['type'] == 'material' ? SubjectStreamType.material : SubjectStreamType.quiz,
    subjectId: json['subjectId']
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'postedAt': postedAt.toIso8601String(),
    'type': type == SubjectStreamType.material ? 'material' : 'quiz',
    'subjectId': subjectId
  };
}
