import 'package:hive_flutter/hive_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_ndu/apis/models/entities/discussion.dart';
import 'package:my_ndu/constants/hive_type_id.dart';

part 'discussion_response.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypeId.discussionResponse)
class DiscussionResponse extends HiveObject {
  DiscussionResponse({
    this.success,
    this.currentPage,
    this.totalPages,
    this.limit,
    this.hasPrevPage,
    this.prevPage,
    this.hasNextPage,
    this.nextPage,
    this.topics,
  });

  factory DiscussionResponse.fromJson(Map<String, dynamic> json) =>
      _$DiscussionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DiscussionResponseToJson(this);

  @JsonKey(name: 'success')
  @HiveField(0)
  final bool? success;

  @JsonKey(name: 'currentPage')
  @HiveField(1)
  final int? currentPage;

  @JsonKey(name: 'totalPages')
  @HiveField(2)
  final int? totalPages;

  @JsonKey(name: 'limit')
  @HiveField(3)
  final int? limit;

  @JsonKey(name: 'hasPrevPage')
  @HiveField(4)
  final bool? hasPrevPage;

  @JsonKey(name: 'prevPage')
  @HiveField(5)
  final String? prevPage;

  @JsonKey(name: 'hasNextPage')
  @HiveField(6)
  final bool? hasNextPage;

  @JsonKey(name: 'nextPage')
  @HiveField(7)
  final String? nextPage;

  @JsonKey(name: 'topics')
  @HiveField(8)
  final List<Discussion>? topics;
}
