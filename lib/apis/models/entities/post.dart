import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_ndu/apis/models/entities/poll_option.dart';
import 'package:my_ndu/apis/models/entities/post_media_file.dart';
import 'package:my_ndu/apis/models/entities/user.dart';
import 'package:my_ndu/constants/hive_type_id.dart';

part 'post.g.dart';

@CopyWith()
@JsonSerializable()
@HiveType(typeId: HiveTypeId.post)
class Post {
  Post({
    this.id,
    this.postType,
    this.caption,
    this.description,
    this.mediaFiles,
    this.pollQuestion,
    this.pollOptions,
    this.pollEndsAt,
    this.totalVotes,
    this.owner,
    this.hashtags,
    this.userMentions,
    this.likesCount,
    this.commentsCount,
    this.repostsCount,
    this.sharesCount,
    this.savesCount,
    this.isLiked,
    this.isVoted,
    this.allowComments,
    this.allowLikes,
    this.allowReposts,
    this.allowShare,
    this.allowSave,
    this.allowDownload,
    this.visibility,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.upvotesCount,
    this.downvotesCount,
  });

  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);

  Map<String, dynamic> toJson() => _$PostToJson(this);

  @JsonKey(name: '_id')
  @HiveField(0)
  String? id;

  @JsonKey(name: 'postType')
  @HiveField(1)
  String? postType;

  @JsonKey(name: 'caption')
  @HiveField(2)
  String? caption;

  @JsonKey(name: 'description')
  @HiveField(3)
  String? description;

  @JsonKey(name: 'mediaFiles')
  @HiveField(4)
  List<PostMediaFile>? mediaFiles;

  @JsonKey(name: 'pollQuestion')
  @HiveField(5)
  String? pollQuestion;

  @JsonKey(name: 'pollOptions')
  @HiveField(6)
  List<PollOption>? pollOptions;

  @JsonKey(name: 'pollEndsAt')
  @HiveField(7)
  DateTime? pollEndsAt;

  @JsonKey(name: 'totalVotes')
  @HiveField(8)
  int? totalVotes;

  @JsonKey(name: 'owner')
  @HiveField(9)
  User? owner;

  @JsonKey(name: 'hashtags')
  @HiveField(10)
  List<String>? hashtags;

  @JsonKey(name: 'userMentions')
  @HiveField(11)
  List<String>? userMentions;

  @JsonKey(name: 'likesCount')
  @HiveField(12)
  int? likesCount;

  @JsonKey(name: 'commentsCount')
  @HiveField(13)
  int? commentsCount;

  @JsonKey(name: 'repostsCount')
  @HiveField(14)
  int? repostsCount;

  @JsonKey(name: 'sharesCount')
  @HiveField(15)
  int? sharesCount;

  @JsonKey(name: 'savesCount')
  @HiveField(16)
  int? savesCount;

  @JsonKey(name: 'isLiked')
  @HiveField(17)
  bool? isLiked;

  @JsonKey(name: 'isVoted')
  @HiveField(18)
  bool? isVoted;

  @JsonKey(name: 'allowComments')
  @HiveField(19)
  bool? allowComments;

  @JsonKey(name: 'allowLikes')
  @HiveField(20)
  bool? allowLikes;

  @JsonKey(name: 'allowReposts')
  @HiveField(21)
  bool? allowReposts;

  @JsonKey(name: 'allowShare')
  @HiveField(22)
  bool? allowShare;

  @JsonKey(name: 'allowSave')
  @HiveField(23)
  bool? allowSave;

  @JsonKey(name: 'allowDownload')
  @HiveField(24)
  bool? allowDownload;

  @JsonKey(name: 'visibility')
  @HiveField(25)
  String? visibility;

  @JsonKey(name: 'status')
  @HiveField(26)
  String? status;

  @JsonKey(name: 'createdAt')
  @HiveField(27)
  DateTime? createdAt;

  @JsonKey(name: 'updatedAt')
  @HiveField(28)
  DateTime? updatedAt;

  @JsonKey(name: 'votedOption')
  @HiveField(29)
  String? votedOption;

  @JsonKey(name: 'upvotesCount')
  @HiveField(30)
  int? upvotesCount;

  @JsonKey(name: 'downvotesCount')
  @HiveField(31)
  int? downvotesCount;
}
