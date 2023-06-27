// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discussion_thread.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiscussionThreadAdapter extends TypeAdapter<DiscussionThread> {
  @override
  final int typeId = 18;

  @override
  DiscussionThread read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiscussionThread(
      title: fields[0] as String?,
      user: fields[1] as String?,
      createdAt: fields[2] as DateTime?,
      comments: (fields[3] as List?)?.cast<String>(),
      likesCount: fields[4] as int?,
      commentsCount: fields[5] as int?,
      threadStatus: fields[6] as DiscussionStatus?,
      visibility: fields[7] as Visibility?,
      allowComments: fields[8] as bool?,
      allowLikes: fields[9] as bool?,
      updatedAt: fields[10] as DateTime?,
      mediaFiles: (fields[11] as List?)?.cast<PostMediaFile>(),
    );
  }

  @override
  void write(BinaryWriter writer, DiscussionThread obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.user)
      ..writeByte(2)
      ..write(obj.createdAt)
      ..writeByte(3)
      ..write(obj.comments)
      ..writeByte(4)
      ..write(obj.likesCount)
      ..writeByte(5)
      ..write(obj.commentsCount)
      ..writeByte(6)
      ..write(obj.threadStatus)
      ..writeByte(7)
      ..write(obj.visibility)
      ..writeByte(8)
      ..write(obj.allowComments)
      ..writeByte(9)
      ..write(obj.allowLikes)
      ..writeByte(10)
      ..write(obj.updatedAt)
      ..writeByte(11)
      ..write(obj.mediaFiles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscussionThreadAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscussionThread _$DiscussionThreadFromJson(Map<String, dynamic> json) =>
    DiscussionThread(
      title: json['title'] as String?,
      user: json['user'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      comments: (json['comments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      likesCount: json['likesCount'] as int?,
      commentsCount: json['commentsCount'] as int?,
      threadStatus: $enumDecodeNullable(
          _$DiscussionStatusEnumMap, json['threadStatus'],
          unknownValue: DiscussionStatus.Active),
      visibility: $enumDecodeNullable(_$VisibilityEnumMap, json['visibility'],
          unknownValue: Visibility.Public),
      allowComments: json['allowComments'] as bool?,
      allowLikes: json['allowLikes'] as bool?,
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      mediaFiles: (json['mediaFiles'] as List<dynamic>?)
          ?.map((e) => PostMediaFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiscussionThreadToJson(DiscussionThread instance) =>
    <String, dynamic>{
      'title': instance.title,
      'user': instance.user,
      'createdAt': instance.createdAt?.toIso8601String(),
      'comments': instance.comments,
      'likesCount': instance.likesCount,
      'commentsCount': instance.commentsCount,
      'threadStatus': _$DiscussionStatusEnumMap[instance.threadStatus],
      'visibility': _$VisibilityEnumMap[instance.visibility],
      'allowComments': instance.allowComments,
      'allowLikes': instance.allowLikes,
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'mediaFiles': instance.mediaFiles,
    };

const _$DiscussionStatusEnumMap = {
  DiscussionStatus.Active: 'Active',
  DiscussionStatus.Deleted: 'Deleted',
  DiscussionStatus.Reported: 'Reported',
  DiscussionStatus.Archived: 'Archived',
  DiscussionStatus.Unarchived: 'Unarchived',
  DiscussionStatus.Withheld: 'Withheld',
  DiscussionStatus.Blocked: 'Blocked',
  DiscussionStatus.Flagged: 'Flagged',
  DiscussionStatus.Banned: 'Banned',
  DiscussionStatus.Muted: 'Muted',
  DiscussionStatus.Verified: 'Verified',
  DiscussionStatus.Unverified: 'Unverified',
};

const _$VisibilityEnumMap = {
  Visibility.Public: 'Public',
  Visibility.Private: 'Private',
  Visibility.Followers: 'Followers',
  Visibility.Mutual: 'Mutual',
  Visibility.CloseFriends: 'CloseFriends',
};
