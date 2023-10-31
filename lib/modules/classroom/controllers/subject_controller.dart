import 'package:get/get.dart';
import 'package:my_ndu/apis/models/entities/subject.dart';
import 'package:my_ndu/apis/models/entities/subject_assignment.dart';
import 'package:my_ndu/apis/models/entities/subject_stream.dart';
import 'package:my_ndu/apis/models/entities/student.dart';

class SubjectController extends GetxController {
  // RX variables to hold data and update UI when data changes
  var subjects = <Subject>[].obs;
  var streams = <SubjectStream>[].obs;
  var assignments = <SubjectAssignment>[].obs;
  var students = <Student>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSubjectDetails();
    fetchStreams();
    fetchAssignments();
    fetchStudents();
  }

  // Mocking API call to get subject details
  void fetchSubjectDetails() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating API delay

    subjects.value = [
      // Mock subject data
      // Add subjects as per your need
    ];
  }

  // Mocking API call to get streams related to the subject
  void fetchStreams() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating API delay

    streams.value = [
      // Mock stream data
      // Add streams as per your need
    ];
  }

  // Mocking API call to get assignments related to the subject
  void fetchAssignments() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating API delay

    assignments.value = [
      // Mock assignment data
      // Add assignments as per your need
    ];
  }

  // Mocking API call to get students in the subject
  void fetchStudents() async {
    await Future.delayed(Duration(seconds: 2)); // Simulating API delay

    students.value = [
      // Mock student data
      // Add students as per your need
    ];
  }
}
