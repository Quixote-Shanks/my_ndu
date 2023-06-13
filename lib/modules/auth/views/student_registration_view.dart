import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/modules/auth/controllers/student_reg_controller.dart';

class StudentRegistrationView extends StatelessWidget {
  final StudentRegistrationController _controller =
      Get.put(StudentRegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            DropdownButtonFormField<String>(
              value: _controller.selectedYear.value,
              items: _controller.years
                  .map<DropdownMenuItem<String>>((String year) {
                return DropdownMenuItem<String>(
                  value: year,
                  child: Text(year),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  _controller.selectedYear.value = value;
                }
              },
              decoration: InputDecoration(
                labelText: 'Select Year',
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _controller.selectedDepartment.value,
              items: _controller.departments
                  .map<DropdownMenuItem<String>>((String department) {
                return DropdownMenuItem<String>(
                  value: department,
                  child: Text(department),
                );
              }).toList(),
              onChanged: (String? value) {
                if (value != null) {
                  _controller.selectedDepartment.value = value;
                }
              },
              decoration: InputDecoration(
                labelText: 'Select Department',
              ),
              isExpanded: true, // Set isExpanded property to true
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                _controller.registerStudent();
              },
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
