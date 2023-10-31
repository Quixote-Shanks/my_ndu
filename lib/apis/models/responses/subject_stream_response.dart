import '../entities/subject_stream.dart';

class SubjectStreamResponse {
  final SubjectStream stream;
  final String message;
  final bool success;
  
  SubjectStreamResponse({
    required this.stream,
    required this.message,
    required this.success
  });

  factory SubjectStreamResponse.fromJson(Map<String, dynamic> json) => SubjectStreamResponse(
    stream: SubjectStream.fromJson(json['stream']),
    message: json['message'],
    success: json['success']
  );
}
