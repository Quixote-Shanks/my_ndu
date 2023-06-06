import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_ndu/apis/models/responses/auth_response.dart';
import 'package:my_ndu/apis/providers/api_provider.dart';
import 'package:my_ndu/app_services/auth_service.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/modules/home/controllers/post_controller.dart';
import 'package:my_ndu/modules/home/controllers/profile_controller.dart';
import 'package:my_ndu/routes/route_management.dart';
import 'package:my_ndu/utils/utility.dart';


class LoginController extends GetxController {
  static LoginController get find => Get.find();

  final _auth = AuthService.find;
  final _profile = ProfileController.find;
  final _postService = PostController.find;

  final _apiProvider = ApiProvider(http.Client());

  final emailUnameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  final FocusScopeNode focusNode = FocusScopeNode();
  final _showPassword = true.obs;
  final _accountStatus = ''.obs;
  final _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  String get accountStatus => _accountStatus.value;

  bool get showPassword => _showPassword.value;

  void _clearLoginTextControllers() {
    emailUnameTextController.clear();
    passwordTextController.clear();
  }

  void toggleViewPassword() {
    _showPassword(!_showPassword.value);
    update();
  }

  Future<void> _login(String email, String password) async {
    if (email.isEmpty) {
      AppUtility.showSnackBar(
        StringValues.enterEmail,
        StringValues.warning,
      );
      return;
    }
    if (password.isEmpty) {
      AppUtility.showSnackBar(
        StringValues.enterPassword,
        StringValues.warning,
      );
      return;
    }

    final body = {
      'emailUname': email,
      'password': password,
    };

    AppUtility.showLoadingDialog();
    _isLoading.value = true;
    update();

    try {
      final response = await _apiProvider.login(body);

      if (response.isSuccessful) {
        _auth.setLoginData = AuthResponse.fromJson(response.data);

        await _auth.deleteAllLocalDataAndCache();

        var token = _auth.loginData.token!;
        var expiresAt = _auth.loginData.expiresAt!;
        var role = _auth.loginData.role!;

        await _auth.saveLoginDataToLocalStorage(token, expiresAt, role);

        _auth.setToken = token;
        _auth.setExpiresAt = expiresAt;
        _auth.setRole = role;

        try {
          await _profile.fetchProfileDetails();

          var fcmToken = await _auth.readFcmTokenFromLocalStorage();

          if (fcmToken.isNotEmpty) {
            AppUtility.log('fcmToken: $fcmToken');
            await _auth.saveFcmToken(fcmToken);
          } else {
            AppUtility.log('Generating FCM token');
            var messaging = FirebaseMessaging.instance;
            var token = await messaging.getToken();
            AppUtility.log('fcmToken: $token');
            await _auth.saveFcmTokenToLocalStorage(token!);
            await _auth.saveFcmToken(token);
          }

          await _auth.saveLoginInfo();
          _clearLoginTextControllers();

          _isLoading.value = false;
          update();
          AppUtility.closeDialog();

          switch (_auth.loginData.role) {
            case 'Student':
              var authService = AuthService();
              var validateStudent = await authService.validateStudent();

              if (validateStudent!) {
                RouteManagement.goToStudentView();
              } else {
                RouteManagement.goToStudentRegistration();
              }
              break;
            case 'Faculty':
              // Navigate to faculty dashboard
              // RouteManagement.goToFacultyView();
              break;
            case 'Staff':
              // Navigate to staff dashboard
              // RouteManagement.goToStaffView();
              break;
            default:
              // Navigate to default dashboard or handle other roles
              RouteManagement.goToDo();
              break;
          }
        } catch (e) {
          AppUtility.log("Error: $e");
          _isLoading.value = false;
          update();
          AppUtility.closeDialog();
          return;
        }
      } else {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.error,
        );
      }
    } catch (exc) {
      AppUtility.closeDialog();
      _isLoading.value = false;
      update();
      AppUtility.showSnackBar('Error: ${exc.toString()}', StringValues.error);
    }
  }

  Future<void> login() async {
    AppUtility.closeFocus();
    await _login(
      emailUnameTextController.text.trim(),
      passwordTextController.text.trim(),
    );
  }
}
