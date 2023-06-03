import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/modules/auth/controllers/student_reg_controller.dart';

import '../../../constants/dimens.dart';
import '../../../constants/strings.dart';
import '../../../global_widgets/custom_app_bar.dart';

class StudentRegistrationView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            NxAppBar(
              title: StringValues.studentReg,
              padding: Dimens.edgeInsetsDefault,
            ),
            Expanded(child: _buildRegistrationFields()),
          ],
        ),
      ),
    );
  }

  Widget _buildRegistrationFields() {
    return GetBuilder<StudentRegistrationController>(
      builder: (controller) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DropdownButtonFormField<String>(
                  value: controller.selectedYear.value,
                  onChanged: (value) {
                    controller.selectedYear.value = value!;
                  },
                  items: controller.years
                      .map(
                        (year) => DropdownMenuItem<String>(
                          value: year,
                          child: Text('Year $year'),
                        ),
                      )
                      .toList(),
                  decoration: const InputDecoration(
                    labelText: 'Year of Study',
                  ),
                ),
                const SizedBox(height: 16.0),
                Expanded(
                  child: DropdownButtonFormField<String>(
                    value: controller.selectedDepartment.value,
                    onChanged: (value) {
                      controller.selectedDepartment.value = value!;
                    },
                    items: controller.departments
                        .map(
                          (department) => DropdownMenuItem<String>(
                            value: department,
                            child: Text(department),
                          ),
                        )
                        .toList(),
                    decoration: const InputDecoration(
                      labelText: 'Department',
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: controller.registerStudent,
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
