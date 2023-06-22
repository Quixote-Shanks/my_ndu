import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_ndu/apis/models/entities/discussion_thread.dart';
import 'package:my_ndu/constants/hive_type_id.dart';

part 'discussion.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypeId.discussion)
class Discussion extends HiveObject {
  Discussion({
    this.id,
    this.topic,
    this.category,
    this.tags,
    this.participants,
    this.threads,
    this.createdAt,
    this.updatedAt,
  });

  factory Discussion.fromJson(Map<String, dynamic> json) => _$DiscussionFromJson(json);

  Map<String, dynamic> toJson() => _$DiscussionToJson(this);

  @HiveField(0)
  String? id;

  @HiveField(1)
  String? topic;

  @HiveField(2)
  String? category;

  @HiveField(3)
  List<String>? tags;

  @HiveField(4)
  List<String>? participants;

  @HiveField(5)
  List<DiscussionThread>? threads;

  @HiveField(6)
  DateTime? createdAt;

  @HiveField(7)
  DateTime? updatedAt;
}
