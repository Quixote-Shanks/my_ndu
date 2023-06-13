import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_ndu/apis/providers/api_provider.dart';
import 'package:my_ndu/app_services/auth_service.dart';
import 'package:my_ndu/routes/route_management.dart';
import 'package:my_ndu/utils/utility.dart';

class StudentRegistrationController extends GetxController {
  var selectedYear = '100'.obs;
  var selectedDepartment = 'Agricultural Economics'.obs;
  final _auth = AuthService.find;
  

  final _apiProvider = ApiProvider(http.Client());

  List<String> years = ['100', '200', '300', '400', '500', '600'];

  List<String> departments = [
    'Agricultural Economics',
    'Animal Science',
    'Crop and Soil Science',
    'Fisheries',
    'English and Literary Studies',
    'History and Diplomacy',
    'Philosophy',
    'Religious Studies',
    'Theatre Arts',
    'Anatomical Pathology',
    'Chemical Pathology',
    'Biochemistry',
    'Human Anatomy',
    'Human Physiology',
    'Medicine and Surgery',
    'Medical Laboratory Science',
    'Surgery',
    'Arts Education',
    'Educational Foundations',
    'Library and Information Science',
    'Science Education',
    'Social Science Education',
    'Vocational & Technical Education',
    'Architecture',
    'Building',
    'Environmental Management',
    'Fine and Applied Art',
    'Quantity Surveying',
    'Urban and Regional Planning',
    'Jurisprudence/Public Law',
    'Private & Property Law',
    'Accounting',
    'Banking and Finance',
    'Insurance',
    'Management',
    'Marketing',
    'Office and Information Management',
    'Community Health Nursing',
    'Medical Surgical Nursing',
    'Maternal and Child Health Nursing',
    'Mental Health and Psychiatric Nursing',
    'Clinical Pharmacy and Pharmacy Practice',
    'Pharmacology and Toxicology',
    'Pharmaceutical Chemistry',
    'Pharmaceutical Microbiology and Biotechnology',
    'Pharmaceutics and Pharmaceutical Technology',
    'Pharmacology and Herbal Medicine',
    'Biological Science',
    'Chemical Sciences',
    'Computer Science',
    'Geology',
    'Mathematics',
    'Microbiology',
    'Physics',
    'Economics',
    'Mass Communication',
    'Political Science',
    'Sociology',
  ];

  void registerStudent() async {
  var token = _auth.token;
  if (selectedYear.value.isNotEmpty && selectedDepartment.value.isNotEmpty) {
    final data = {
      'yearOfStudy': selectedYear.value,
      'department': selectedDepartment.value,
    };
    final response = await _apiProvider.updateStudent(token, data);

    if (response.isSuccessful) {
      RouteManagement.goToStudentView();
    } else {
      Get.snackbar('Error', 'Something went wrong!');
    }
  } else {
    Get.snackbar('Error', 'Please select a year and department!');
  }
}
}
