// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_stream.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubjectStreamAdapter extends TypeAdapter<SubjectStream> {
  @override
  final int typeId = 22;

  @override
  SubjectStream read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubjectStream(
      id: fields[0] as int,
      title: fields[1] as String,
      postedAt: fields[2] as DateTime,
      type: fields[3] as SubjectStreamType,
      subjectId: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SubjectStream obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.postedAt)
      ..writeByte(3)
      ..write(obj.type)
      ..writeByte(4)
      ..write(obj.subjectId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubjectStreamAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
