import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_ndu/apis/providers/api_provider.dart';
import 'package:my_ndu/app_services/auth_service.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/modules/home/controllers/profile_controller.dart';
import 'package:my_ndu/routes/route_management.dart';
import 'package:my_ndu/utils/utility.dart';

class EditDOBController extends GetxController {
  static EditDOBController get find => Get.find();

  final _profile = ProfileController.find;
  final _auth = AuthService.find;

  final _apiProvider = ApiProvider(http.Client());

  final dobTextController = TextEditingController();

  final FocusScopeNode focusNode = FocusScopeNode();

  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    initializeFields();
    super.onInit();
  }

  void initializeFields() async {
    if (_profile.profileDetails!.user != null) {
      var user = _profile.profileDetails!.user!;
      dobTextController.text = user.dob ?? '';
    }
  }

  Future<void> _updateDOB(String dob) async {
    if (dob.isEmpty) {
      return;
    }

    final body = {'dob': dob};

    AppUtility.showLoadingDialog();
    _isLoading.value = true;
    update();

    try {
      final response = await _apiProvider.updateProfile(_auth.token, body);

      if (response.isSuccessful) {
        final decodedData = response.data;
        await _profile.fetchProfileDetails(fetchPost: false);
        AppUtility.closeDialog();
        _isLoading.value = false;
        update();
        RouteManagement.goToBack();
        AppUtility.showSnackBar(
          decodedData['message'],
          StringValues.success,
        );
      } else {
        final decodedData = response.data;
        AppUtility.closeDialog();
        _isLoading.value = false;
        update();
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.error,
        );
      }
    } catch (exc) {
      AppUtility.closeDialog();
      _isLoading.value = false;
      update();
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }

  Future<void> updateDOB() async {
    AppUtility.closeFocus();
    if (dobTextController.text.trim() == _profile.profileDetails!.user!.dob) {
      return;
    }
    await _updateDOB(dobTextController.text.trim());
  }
}
