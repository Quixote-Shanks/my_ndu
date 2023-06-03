// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentResponse _$StudentResponseFromJson(Map<String, dynamic> json) =>
    StudentResponse(
      success: json['success'] as bool?,
      student: json['student'] == null
          ? null
          : UserDetails.fromJson(json['student'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$StudentResponseToJson(StudentResponse instance) =>
    <String, dynamic>{
      'success': instance.success,
      'student': instance.student,
    };
