import 'dart:async';
import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_ndu/apis/models/entities/hashtag.dart';
import 'package:my_ndu/apis/models/responses/hashtag_response.dart';
import 'package:my_ndu/apis/providers/api_provider.dart';
import 'package:my_ndu/app_services/auth_service.dart';
import 'package:my_ndu/constants/secrets.dart';
import 'package:my_ndu/modules/discussion/controllers/discussion_controller.dart';
import 'package:my_ndu/utils/file_utility.dart';

class CreateDiscussionController extends GetxController {
  final _auth = AuthService.find;
  final _discussionController = DiscussionController.find;
  final _apiProvider = ApiProvider(http.Client());

  final _title = ''.obs;
  final _hashtagData = const HashTagResponse().obs;

  final _pickedFileList = <File>[].obs;
  final _isLoading = false.obs;
  final List<HashTag> _hashtagList = [];
  final _currentFileIndex = 0.obs;

  HashTagResponse get hashtagData => _hashtagData.value;
  List<HashTag> get hashtagList => _hashtagList;
  List<File> get pickedFileList => _pickedFileList;
  String get title => _title.value;
  bool get isLoading => _isLoading.value;
  int get currentFileIndex => _currentFileIndex.value;

  final cloudName = const String.fromEnvironment('CLOUDINARY_CLOUD_NAME',
    defaultValue: AppSecrets.cloudinaryCloudName);
final uploadPreset = const String.fromEnvironment('CLOUDINARY_UPLOAD_PRESET',
    defaultValue: AppSecrets.cloudinaryUploadPreset);

  final cloudinary = Cloudinary(
  'cloudinary_api_key', // Replace with your Cloudinary API key
  'cloudinary_api_secret', // Replace with your Cloudinary API secret
  cloudName: cloudName,
  uploadPreset: uploadPreset,
);

  final List<String> categories = ['Category 1', 'Category 2', 'Category 3'];
  final RxString selectedCategory = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setTitle(String value) {
    _title.value = value;
    update();
  }

  void onChangeFile(int index) {
    _currentFileIndex.value = index;
    update();
  }

  Future<void> removeDiscussionFile(int index) async {
    if (_pickedFileList.isEmpty) {
      return;
    }
    _pickedFileList.removeAt(index);
    if (_currentFileIndex.value > 0) {
      _currentFileIndex.value--;
    }
    update();
  }

  Future<void> _uploadFilesToCloudinary() async {
    for (var file in _pickedFileList) {
      final result = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(file.path),
        folder: 'social_media_api/posts', // Set the desired folder
      );

      if (result.isSuccessful) {
        final publicUrl = result.secureUrl;
        final mediaType =
            FileUtility.isVideoFile(file.path) ? 'video' : 'image';

        print('Cloudinary Public URL: $publicUrl');
      } else {
        print('Cloudinary Upload Error: ${result.error.message}');
      }
    }
  }

  Future<void> _createNewDiscussion() async {
    await _uploadFilesToCloudinary();

    final discussionData = {
      'topic': title,
      'category': selectedCategory.value, // Use the selected category
      'tags': [], // Add tags if needed
      'visibility': 'public', // Set visibility as required
      'allowComments': true, // Set allowComments as required
      'allowLikes': true, // Set allowLikes as required
      'mediaFiles': [],
    };

    for (var file in _pickedFileList) {
      final result = await cloudinary.uploadFile(
        CloudinaryFile.fromFile(file.path),
        folder: 'social_media_api/discussion', // Set the desired folder
      );

      if (result.isSuccessful) {
        final publicUrl = result.secureUrl;
        final mediaType =
            FileUtility.isVideoFile(file.path) ? 'video' : 'image';

        discussionData['mediaFiles'].add({
          'public_id': result.publicId,
          'url': publicUrl,
          'mediaType': mediaType,
        });
      } else {
        print('Cloudinary Upload Error: ${result.error.message}');
      }
    }

    try {
      final response = await _apiProvider.post(
        '/your_backend_route',
        body: discussionData,
      );
      print(response);
    } catch (error) {
      print(error);
    }
  }

  Future<void> _selectMultipleImages() async {
    final filePicker = FilePicker.platform;
    var fileList = <PlatformFile>[];
    const maxImageBytes = 1048576;

    final pickedFiles = await filePicker.pickFiles(
      allowMultiple: true,
      withReadStream: true,
      allowCompression: false,
      type: FileType.custom,
      allowedExtensions: ['png', 'jpg', 'jpeg'],
    );

    if (pickedFiles == null) {
      return;
    }

    fileList = pickedFiles.files;
    for (var file in fileList) {
      var imageFile = File(file.path!);
      File? resultFile = imageFile;
      var size = imageFile.lengthSync();

      if (size > (10 * maxImageBytes)) {
        AppUtility.showSnackBar(
          'Image size must be less than 10mb',
          '',
        );
      } else {
        _pickedFileList.add(resultFile);
        update();
      }
    }
  }

  Future<void> _captureImage() async {
    final imagePicker = ImagePicker();
    const maxImageBytes = 1048576;

    final pickedImage = await imagePicker.pickImage(
      maxWidth: 1080.0,
      maxHeight: 1080.0,
      imageQuality: 100,
      source: ImageSource.camera,
    );

    if (pickedImage != null) {
      var imageFile = File(pickedImage.path);
      File? resultFile = imageFile;
      var size = imageFile.lengthSync();

      if (size > (10 * maxImageBytes)) {
        AppUtility.showSnackBar(
          'Image size must be less than 10mb',
          '',
        );
      } else {
        _pickedFileList.add(resultFile);
        update();
      }
    }
  }

  Future<void> cropImage(int index, BuildContext context) async {
    final image = _pickedFileList[index];
    var croppedImage = await FileUtility.cropImage(image, context);

    if (croppedImage == null) {
      AppUtility.showSnackBar(
        'Error: Image cropping failed',
        StringValues.error,
      );
      return;
    }

    _pickedFileList.removeAt(index);
    _pickedFileList.insert(index, croppedImage);
    update();
  }

  Future<void> compressImage(int index) async {
    var image = _pickedFileList[index];
    var croppedImage = File(image.path);
    var tempDir = await getTemporaryDirectory();

    AppUtility.log('Compressing...');
    AppUtility.showLoadingDialog(message: 'Compressing...');

    var timestamp = DateTime.now().millisecondsSinceEpoch;

    var resultFile = await FlutterImageCompress.compressAndGetFile(
      croppedImage.path,
      '${tempDir.absolute.path}/temp$timestamp.jpg',
      quality: 60,
      format: CompressFormat.jpeg,
    );

    if (resultFile == null) {
      AppUtility.closeDialog();
      AppUtility.showSnackBar(
          'Error: Image compression failed', StringValues.error);
      AppUtility.log('Compression done');
      return;
    }

    _pickedFileList.removeAt(index);
    _pickedFileList.insert(index, resultFile);
    update();

    AppUtility.closeDialog();
    AppUtility.log('Compression done');
  }

  Future<void> _selectMultipleVideos() async {
    final filePicker = FilePicker.platform;
    var fileList = <PlatformFile>[];
    const maxVideoBytes = 10485760;

    final pickedFiles = await filePicker.pickFiles(
      allowMultiple: true,
      withReadStream: true,
      allowCompression: false,
      type: FileType.custom,
      allowedExtensions: ['mp4', 'mkv'],
    );

    if (pickedFiles == null) {
      return;
    }

    fileList = pickedFiles.files;
    for (var file in fileList) {
      var imageFile = File(file.path!);
      File? resultFile = imageFile;
      var size = imageFile.lengthSync();

      if (size > (10 * maxVideoBytes)) {
        AppUtility.showSnackBar(
          'Video size must be less than 100mb',
          '',
        );
      } else {
        _pickedFileList.add(resultFile);
        update();
      }
    }
  }

  Future<void> compressVideo(int index) async {
    var video = _pickedFileList[index];
    var videoFile = File(video.path);

    AppUtility.log('Compressing...');
    AppUtility.showLoadingDialog(message: 'Compressing...');

    var info = await VideoCompress.compressVideo(
      videoFile.path,
      quality: VideoQuality.DefaultQuality,
    );

    if (info == null) {
      AppUtility.closeDialog();
      AppUtility.showSnackBar(
          'Error: Video compression failed', StringValues.error);
      AppUtility.log('Compression done');
      return;
    }

    _pickedFileList.removeAt(index);
    _pickedFileList.insert(index, info.file!);
    update();

    AppUtility.closeDialog();
    AppUtility.log('Compression done');
  }

  Future<void> _recordVideo() async {
    final imagePicker = ImagePicker();
    const maxVideoBytes = 10485760;

    final pickedVideo = await imagePicker.pickVideo(
      source: ImageSource.camera,
      maxDuration: const Duration(seconds: 30),
    );

    if (pickedVideo != null) {
      var imageFile = File(pickedVideo.path);
      File? resultFile = imageFile;
      var size = imageFile.lengthSync();

      if (size > (10 * maxVideoBytes)) {
        AppUtility.showSnackBar(
          'Video size must be less than 100mb',
          '',
        );
      } else {
        _pickedFileList.add(resultFile);
        update();
      }
    }
  }

  Future<void> captureImage() async => await _captureImage();

  Future<void> recordVideo() async => await _recordVideo();

  Future<void> selectPostImages() async => await _selectMultipleImages();

  Future<void> selectPosVideos() async => await _selectMultipleVideos();
}
