import 'dart:async';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_ndu/apis/models/entities/media_file.dart';
import 'package:my_ndu/apis/models/entities/user.dart';
import 'package:my_ndu/apis/providers/api_provider.dart';
import 'package:my_ndu/app_services/auth_service.dart';
import 'package:my_ndu/constants/hive_box_names.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/modules/home/controllers/profile_controller.dart';
import 'package:my_ndu/routes/route_management.dart';
import 'package:my_ndu/services/hive_service.dart';
import 'package:my_ndu/utils/utility.dart';

class BlockUserController extends GetxController {
  late String id;
  late String uname;
  late MediaFile avatar;

  final _apiProvider = ApiProvider(http.Client());
  final _profileController = ProfileController.find;
  final _auth = AuthService.find;
  final _isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      id = Get.arguments['id'];
      uname = Get.arguments['uname'];
      avatar = Get.arguments['avatar'];
    }
  }

  static BlockUserController get find => Get.find();

  bool get isLoading => _isLoading.value;

  Future<void> blockUser() async {
    AppUtility.closeFocus();
    await _blockUser();
  }

  Future<void> _blockUser() async {
    if (id.isEmpty) {
      AppUtility.showSnackBar(
        StringValues.userIdNotFound,
        StringValues.warning,
      );
      return;
    }

    AppUtility.showLoadingDialog();
    _isLoading.value = true;
    update();

    try {
      final response = await _apiProvider.blockUser(_auth.token, id);

      if (response.isSuccessful) {
        final decodedData = response.data;
        final item = User.fromJson(decodedData['user']);
        await HiveService.put<User>(
          HiveBoxNames.blockedUsers,
          item.id,
          item,
        );
        _profileController.blockedUsers.add(item);
        _profileController.update();
        AppUtility.closeDialog();
        _isLoading.value = false;
        update();
        RouteManagement.goToBack();
        RouteManagement.goToBack();
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
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
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }
}
