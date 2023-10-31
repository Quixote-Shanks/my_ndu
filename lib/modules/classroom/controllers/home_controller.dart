import 'package:get/get.dart';
import 'package:my_ndu/apis/models/entities/subject.dart';


class HomeController extends GetxController {
  // RX Observables
  var subjects = <Subject>[].obs;
  var weeklyAssigned = {}.obs;
  var weeklyMissed = {}.obs;
  var isLoading = true.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  // Fetch all the required data
  void fetchData() async {
    isLoading.value = true;
    try {
      await fetchSubjects();
      await fetchAssignments();
      errorMessage.value = ''; // reset error message
    } catch (error) {
      errorMessage.value = error.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchSubjects() async {
    // TODO: Replace with actual API call
    await Future.delayed(Duration(seconds: 2)); // Mock delay
    subjects.value = [
      // ... mock or fetched subjects data
    ];
  }

  Future<void> fetchAssignments() async {
    // TODO: Replace with actual API call
    await Future.delayed(Duration(seconds: 2)); // Mock delay
    weeklyAssigned.value = {
      'count': 5,
      'subjects': ["Digital Arts", "Finance"],
    };
    weeklyMissed.value = {
      'count': 2,
      'subjects': ["Network Security", "Mobile Dev"],
    };
  }

  void joinClass(String classCode) async {
    // TODO: Implement logic to join a class with the provided classCode
    // Make an API call to join the class and update local data
    await Future.delayed(Duration(seconds: 2)); // Mock delay
    // After joining, you might want to refresh the subjects list
    fetchSubjects();
  }

  // In case you want to refresh the data from UI
  void refreshData() {
    fetchData();
  }
}
