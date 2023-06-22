import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_ndu/apis/models/enums/discussion_status.dart';
import 'package:my_ndu/apis/models/enums/visibility.dart';
import 'package:my_ndu/constants/hive_type_id.dart';

part 'discussion_thread.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypeId.discussionThread)
class DiscussionThread extends HiveObject {
  DiscussionThread({
    this.title,
    this.user,
    this.createdAt,
    this.comments,
    this.likesCount,
    this.commentsCount,
    this.threadStatus,
    this.visibility,
    this.allowComments,
    this.allowLikes,
    this.updatedAt,
  });

  factory DiscussionThread.fromJson(Map<String, dynamic> json) => _$DiscussionThreadFromJson(json);

  Map<String, dynamic> toJson() => _$DiscussionThreadToJson(this);

  @HiveField(0)
  String? title;

  @HiveField(1)
  String? user;

  @HiveField(2)
  DateTime? createdAt;

  @HiveField(3)
  List<String>? comments;

  @HiveField(4)
  int? likesCount;

  @HiveField(5)
  int? commentsCount;

  @JsonKey(unknownEnumValue: DiscussionStatus.Active)
  @HiveField(6)
  DiscussionStatus? threadStatus;

  @JsonKey(unknownEnumValue: Visibility.Public)
  @HiveField(7)
  Visibility? visibility;

  @HiveField(8)
  bool? allowComments;

  @HiveField(9)
  bool? allowLikes;

  @HiveField(10)
  DateTime? updatedAt;
}
