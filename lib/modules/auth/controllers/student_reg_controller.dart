import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_ndu/apis/providers/api_provider.dart';

class StudentRegistrationController extends GetxController {
  var selectedYear = '1'.obs;
  var selectedDepartment = 'Agricultural Economics'.obs;

  final _apiProvider = ApiProvider(http.Client());

  List<String> years = ['1', '2', '3', '4', '5', '6'];

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
    if (selectedYear.value.isNotEmpty && selectedDepartment.value.isNotEmpty) {
      final response = await _apiProvider.createStudent(
        selectedYear.value,
        selectedDepartment.value,
      );
      if (response.isSuccessful) {
        await Get.offNamed('/nextScreen');
      } else {
        Get.snackbar('Error', 'Something went wrong!');
      }
    } else {
      Get.snackbar('Error', 'Please select a year and department!');
    }
  }
}
