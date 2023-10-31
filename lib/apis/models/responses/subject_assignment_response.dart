import '../entities/subject_assignment.dart';

class SubjectAssignmentResponse {
  final SubjectAssignment assignment;
  final String message;
  final bool success;
  
  SubjectAssignmentResponse({
    required this.assignment,
    required this.message,
    required this.success
  });

  factory SubjectAssignmentResponse.fromJson(Map<String, dynamic> json) => SubjectAssignmentResponse(
    assignment: SubjectAssignment.fromJson(json['assignment']),
    message: json['message'],
    success: json['success']
  );
}
