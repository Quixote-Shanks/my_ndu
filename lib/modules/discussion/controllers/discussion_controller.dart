import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:my_ndu/apis/models/entities/comment.dart';
import 'package:my_ndu/apis/models/entities/discussion.dart';
import 'package:my_ndu/apis/models/responses/discussion_response.dart';
import 'package:my_ndu/apis/providers/api_provider.dart';
import 'package:my_ndu/app_services/auth_service.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/modules/home/controllers/profile_controller.dart';
import 'package:my_ndu/routes/route_management.dart';
import 'package:my_ndu/utils/utility.dart';

class DiscussionController extends GetxController {
  static DiscussionController get find => Get.find();

  final _auth = AuthService.find;
  final _apiProvider = ApiProvider(http.Client());

  final _discussionData = DiscussionResponse().obs;
  final _commentText = ''.obs;
  final _isLoading = false.obs;

  DiscussionResponse get discussionData => _discussionData.value;
  String get commentText => _commentText.value;
  bool get isLoading => _isLoading.value;

  set setCommentText(String value) => _commentText.value = value;

  @override
  void onInit() {
    super.onInit();
    _discussionData.value = DiscussionResponse(); // Initialize with empty data
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> fetchDiscussionData() async {
    try {
      _isLoading.value = true;
      update();

      final response = await _apiProvider.getDiscussionData(_auth.token);

      if (response.isSuccessful) {
        final decodedData = response.data;
        _discussionData.value = DiscussionResponse.fromJson(decodedData);
        _isLoading.value = false;
        update();
      } else {
        final decodedData = response.data;
        _discussionData.value = DiscussionResponse(); // Clear existing data
        _isLoading.value = false;
        update();
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.error,
        );
      }
    } catch (exc) {
      _discussionData.value = DiscussionResponse(); // Clear existing data
      _isLoading.value = false;
      update();
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }

  Future<void> createComment(Discussion discussion) async {
    try {
      final body = {
        'discussionId': discussion.id,
        'text': _commentText.value,
      };

      final response = await _apiProvider.createComment(_auth.token, body);

      if (response.isSuccessful) {
        final decodedData = response.data;
        _commentText.value = '';
        update();
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.success,
        );
        await ProfileController.find.fetchProfileDetails(fetchPost: true);
      } else {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.error,
        );
      }
    } catch (exc) {
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }

  Future<void> deleteComment(String commentId) async {
  try {
    final response = await _apiProvider.deleteComment(_auth.token, commentId);

    if (response.isSuccessful) {
      final decodedData = response.data;
      AppUtility.showSnackBar(
        decodedData[StringValues.message],
        StringValues.success,
      );
      await fetchDiscussionData(); // Optionally, refresh the discussion data after deleting a comment.
    } else {
      final decodedData = response.data;
      AppUtility.showSnackBar(
        decodedData[StringValues.message],
        StringValues.error,
      );
    }
  } catch (exc) {
    AppUtility.log('Error: $exc', tag: 'error');
    AppUtility.showSnackBar('Error: $exc', StringValues.error);
  }
}


  Future<void> createDiscussion({
    required String title,
    required String category,
    required List<String> tags,
    required List<String> participants,
  }) async {
    try {
      _isLoading.value = true;
      update();

      final response = await _apiProvider.createDiscussion(
          _auth.token, title, category, tags, participants);

      if (response.isSuccessful) {
        final decodedData = response.data;
        _isLoading.value = false;
        update();
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.success,
        );
        await fetchDiscussionData();
      } else {
        final decodedData = response.data;
        _isLoading.value = false;
        update();
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.error,
        );
      }
    } catch (exc) {
      _isLoading.value = false;
      update();
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }

  Future<void> createThread({
    required String discussionId,
    required String title,
    required String content,
    required String createdBy,
  }) async {
    try {
      final body = {
        'discussionId': discussionId,
        'title': title,
        'content': content,
        'createdBy': createdBy
      };

      final response = await _apiProvider.createThread(_auth.token, body);

      if (response.isSuccessful) {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.success,
        );
        await fetchDiscussionData();
      } else {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.error,
        );
      }
    } catch (exc) {
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }

  Future<void> createReply({
    required String threadId,
    required String createdBy,
    required String content,
  }) async {
    try {
      final body = {
        'threadId': threadId,
        'content': content,
        'createdBy': createdBy
      };

      final response = await _apiProvider.createReply(_auth.token, body);

      if (response.isSuccessful) {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.success,
        );
        await fetchDiscussionData(); // Optionally, you may want to refresh the discussion data after creating a reply.
      } else {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.error,
        );
      }
    } catch (exc) {
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }

  Future<void> updateThread({
    required String threadId,
    required String updatedContent,
  }) async {
    try {
      final body = {
        'threadId': threadId,
        'content': updatedContent,
      };

      final response = await _apiProvider.updateThread(_auth.token, body);

      if (response.isSuccessful) {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.success,
        );
        await fetchDiscussionData(); // Optionally, refresh the discussion data after updating a thread.
      } else {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.error,
        );
      }
    } catch (exc) {
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }

  Future<void> deleteThread(String threadId) async {
    try {
      final response = await _apiProvider.deleteThread(_auth.token, threadId);

      if (response.isSuccessful) {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.success,
        );
        await fetchDiscussionData(); // Optionally, refresh the discussion data after deleting a thread.
      } else {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.error,
        );
      }
    } catch (exc) {
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }

  Future<void> deleteReply(String replyId) async {
    try {
      final response = await _apiProvider.deleteReply(_auth.token, replyId);

      if (response.isSuccessful) {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.success,
        );
        await fetchDiscussionData(); // Optionally, refresh the discussion data after deleting a reply.
      } else {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.error,
        );
      }
    } catch (exc) {
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }

  Future<void> likeThread(String threadId) async {
    try {
      final response = await _apiProvider.likeThread(_auth.token, threadId);

      if (response.isSuccessful) {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.success,
        );
        await fetchDiscussionData(); // Optionally, refresh the discussion data after liking a thread.
      } else {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.error,
        );
      }
    } catch (exc) {
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }

  Future<void> unlikeThread(String threadId) async {
    try {
      final response = await _apiProvider.unlikeThread(_auth.token, threadId);

      if (response.isSuccessful) {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.success,
        );
        await fetchDiscussionData(); // Optionally, refresh the discussion data after unliking a thread.
      } else {
        final decodedData = response.data;
        AppUtility.showSnackBar(
          decodedData[StringValues.message],
          StringValues.error,
        );
      }
    } catch (exc) {
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }
}
