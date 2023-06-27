// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'discussion_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DiscussionResponseAdapter extends TypeAdapter<DiscussionResponse> {
  @override
  final int typeId = 20;

  @override
  DiscussionResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiscussionResponse(
      success: fields[0] as bool?,
      currentPage: fields[1] as int?,
      totalPages: fields[2] as int?,
      limit: fields[3] as int?,
      hasPrevPage: fields[4] as bool?,
      prevPage: fields[5] as String?,
      hasNextPage: fields[6] as bool?,
      nextPage: fields[7] as String?,
      topics: (fields[8] as List?)?.cast<Discussion>(),
    );
  }

  @override
  void write(BinaryWriter writer, DiscussionResponse obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.success)
      ..writeByte(1)
      ..write(obj.currentPage)
      ..writeByte(2)
      ..write(obj.totalPages)
      ..writeByte(3)
      ..write(obj.limit)
      ..writeByte(4)
      ..write(obj.hasPrevPage)
      ..writeByte(5)
      ..write(obj.prevPage)
      ..writeByte(6)
      ..write(obj.hasNextPage)
      ..writeByte(7)
      ..write(obj.nextPage)
      ..writeByte(8)
      ..write(obj.topics);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscussionResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiscussionResponse _$DiscussionResponseFromJson(Map<String, dynamic> json) =>
    DiscussionResponse(
      success: json['success'] as bool?,
      currentPage: json['currentPage'] as int?,
      totalPages: json['totalPages'] as int?,
      limit: json['limit'] as int?,
      hasPrevPage: json['hasPrevPage'] as bool?,
      prevPage: json['prevPage'] as String?,
      hasNextPage: json['hasNextPage'] as bool?,
      nextPage: json['nextPage'] as String?,
      topics: (json['topics'] as List<dynamic>?)
          ?.map((e) => Discussion.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DiscussionResponseToJson(DiscussionResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'currentPage': instance.currentPage,
      'totalPages': instance.totalPages,
      'limit': instance.limit,
      'hasPrevPage': instance.hasPrevPage,
      'prevPage': instance.prevPage,
      'hasNextPage': instance.hasNextPage,
      'nextPage': instance.nextPage,
      'topics': instance.topics,
    };
