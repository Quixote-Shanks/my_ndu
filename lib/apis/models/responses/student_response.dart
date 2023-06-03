import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:my_ndu/apis/models/entities/user_details.dart';

part 'student_response.g.dart';

@JsonSerializable()
class StudentResponse extends Equatable {
  const StudentResponse({
    this.success,
    this.student,
  });

  factory StudentResponse.fromJson(Map<String, dynamic> json) =>
      _$StudentResponseFromJson(json);

  Map<String, dynamic> toJson() => _$StudentResponseToJson(this);

  @JsonKey(name: 'success')
  final bool? success;

  @JsonKey(name: 'student')
  final UserDetails? student;

  @override
  List<Object?> get props => <Object?>[
        success,
        student,
      ];
}
