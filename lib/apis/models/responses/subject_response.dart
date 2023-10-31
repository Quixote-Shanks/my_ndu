// Subject Response Model
import '../entities/subject.dart';

class SubjectResponse {
  final Subject subject;
  final String message;
  final bool success;
  
  SubjectResponse({
    required this.subject,
    required this.message,
    required this.success
  });

  factory SubjectResponse.fromJson(Map<String, dynamic> json) => SubjectResponse(
    subject: Subject.fromJson(json['subject']),
    message: json['message'],
    success: json['success']
  );
}
