// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subject_assignment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SubjectAssignmentAdapter extends TypeAdapter<SubjectAssignment> {
  @override
  final int typeId = 21;

  @override
  SubjectAssignment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubjectAssignment(
      id: fields[0] as int,
      title: fields[1] as String,
      description: fields[2] as String,
      postedAt: fields[3] as DateTime,
      dueAt: fields[4] as DateTime,
      subjectId: fields[5] as int,
      type: fields[6] as SubjectAssignmentType,
    );
  }

  @override
  void write(BinaryWriter writer, SubjectAssignment obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.postedAt)
      ..writeByte(4)
      ..write(obj.dueAt)
      ..writeByte(5)
      ..write(obj.subjectId)
      ..writeByte(6)
      ..write(obj.type);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubjectAssignmentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
