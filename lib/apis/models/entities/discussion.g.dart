// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discussion.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiscussionAdapter extends TypeAdapter<Discussion> {
  @override
  final int typeId = 19;

  @override
  Discussion read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Discussion(
      id: fields[0] as String?,
      topic: fields[1] as String?,
      category: fields[2] as String?,
      tags: (fields[3] as List?)?.cast<String>(),
      participants: (fields[4] as List?)?.cast<String>(),
      threads: (fields[5] as List?)?.cast<DiscussionThread>(),
      createdAt: fields[6] as DateTime?,
      updatedAt: fields[7] as DateTime?,
      mediaFiles: (fields[8] as List?)?.cast<PostMediaFile>(),
    );
  }

  @override
  void write(BinaryWriter writer, Discussion obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.topic)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.tags)
      ..writeByte(4)
      ..write(obj.participants)
      ..writeByte(5)
      ..write(obj.threads)
      ..writeByte(6)
      ..write(obj.createdAt)
      ..writeByte(7)
      ..write(obj.updatedAt)
      ..writeByte(8)
      ..write(obj.mediaFiles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscussionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Discussion _$DiscussionFromJson(Map<String, dynamic> json) => Discussion(
      id: json['id'] as String?,
      topic: json['topic'] as String?,
      category: json['category'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      participants: (json['participants'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      threads: (json['threads'] as List<dynamic>?)
          ?.map((e) => DiscussionThread.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      mediaFiles: (json['mediaFiles'] as List<dynamic>?)
          ?.map((e) => PostMediaFile.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiscussionToJson(Discussion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'topic': instance.topic,
      'category': instance.category,
      'tags': instance.tags,
      'participants': instance.participants,
      'threads': instance.threads,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'mediaFiles': instance.mediaFiles,
    };
