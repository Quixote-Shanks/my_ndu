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

import '../../../apis/models/entities/student.dart';

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
              var authService = AuthService.find;
              var validateStudent = await authService.validateStudent();
              AppUtility.log('validateStudent result: $validateStudent');

              if (validateStudent!) {
                AppUtility.log('Navigating to Student View');
                RouteManagement.goToStudentView();
              } else {
                AppUtility.log('Navigating to Student Registration');
                RouteManagement.goToStudentRegistration();
              }
              break;
            case 'Lecturer':
              // Add logic for lecturer role
              // Example: RouteManagement.goToLecturerView();
              break;
            case 'Admin':
              // Add logic for admin role
              // Example: RouteManagement.goToAdminView();
              break;
            default:
              // Handle unrecognized role
              print('Unrecognized role: ${_auth.loginData.role}');
              RouteManagement
                  .goToDo(); // Assuming goToDo() is the default navigation route
              break;
          }

          AppUtility.showSnackBar(
            StringValues.loginSuccessful,
            StringValues.success,
          );
          await _postService.loadLocalPosts();
          // await _postService.getData();
        } catch (e) {
          AppUtility.log("Error: $e");
          _isLoading.value = false;
          update();
          AppUtility.closeDialog();
          return;
        }
      } else {
        _isLoading.value = false;
        update();
        AppUtility.closeDialog();

        if (response.data['accountStatus'] != null) {
          _accountStatus.value = response.data['accountStatus'];
          switch (_accountStatus.value) {
            case 'unverified':
              RouteManagement.goToSendVerifyAccountOtpView();
              AppUtility.showSnackBar(
                response.data[StringValues.message],
                StringValues.error,
              );
              break;
            case 'deactivated':
              RouteManagement.goToReactivateAccountView();
              AppUtility.showSnackBar(
                response.data[StringValues.message],
                StringValues.error,
              );
              break;
            case 'blocked':
              AppUtility.showSnackBar(
                response.data[StringValues.message],
                StringValues.error,
              );
              break;
            default:
              AppUtility.log("Invalid Account Status", tag: 'error');
              break;
          }
        } else {
          AppUtility.showSnackBar(
            response.data[StringValues.message],
            StringValues.error,
          );
        }
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
