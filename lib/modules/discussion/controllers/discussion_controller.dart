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

  Future<void> deleteComment(Discussion discussion, Comment comment) async {
    try {
      final response =
          await _apiProvider.deleteComment(_auth.token, discussion.id, comment.id);

      if (response.isSuccessful) {
        final decodedData = response.data;
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


  Future<void> createDiscussion({
    required String title,
    required String category,
    required List<String> tags,
    required List<String> participants,
  }) async {
    try {
      _isLoading.value = true;
      update();

      final response = await _apiProvider.createDiscussion(_auth.token, title, category, tags, participants);

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
      // TODO: Implement database operation to create a new DiscussionThread
      // associated with the provided discussionId and save it in the database.
      // Use the DiscussionThread model and appropriate database methods.

      

      // TODO: Save the created thread in the database.
      // Use appropriate database methods to save the thread.

      // Placeholder code
      print('Thread created: $thread');
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
      // TODO: Implement database operation to create a new DiscussionReply
      // associated with the provided threadId and save it in the database.
      // Use the DiscussionReply model and appropriate database methods.

      
      // TODO: Save the created reply in the database.
      // Use appropriate database methods to save the reply.

      // Placeholder code
      print('Reply created: $reply');
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
      // TODO: Implement database operation to update the content of a DiscussionThread.
      // Retrieve the thread from the database using the threadId,
      // update its content with the provided updatedContent,
      // and save the changes in the database.

      

      // TODO: Update the thread's content in the database.
      // Use appropriate database methods to update the thread.

      // Placeholder code
      print('Thread updated: $thread');
    } catch (exc) {
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }

  Future<void> updateReply({
    required String replyId,
    required String updatedContent,
  }) async {
    try {
      // TODO: Implement database operation to update the content of a DiscussionReply.
      // Retrieve the reply from the database using the replyId,
      // update its content with the provided updatedContent,
      // and save the changes in the database.

      

      // TODO: Update the reply's content in the database.
      // Use appropriate database methods to update the reply.

      // Placeholder code
      print('Reply updated: $reply');
    } catch (exc) {
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }

  Future<void> deleteThread(String threadId) async {
    try {
      // TODO: Implement database operation to delete a DiscussionThread.
      // Retrieve the thread from the database using the threadId
      // and delete it from the database.

      // Placeholder code
      print('Thread deleted: $threadId');
    } catch (exc) {
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }

  Future<void> deleteReply(String replyId) async {
    try {
      // TODO: Implement database operation to delete a DiscussionReply.
      // Retrieve the reply from the database using the replyId
      // and delete it from the database.

      // Placeholder code
      print('Reply deleted: $replyId');
    } catch (exc) {
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }

  Future<void> likeThread(String threadId, String userId) async {
    try {
      // TODO: Implement database operation to like a DiscussionThread.
      // Retrieve the thread from the database using the threadId,
      // update its likes count, and save the changes in the database.

      // Placeholder code
      print('Thread liked: $threadId');
    } catch (exc) {
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }

  Future<void> unlikeThread(String threadId, String userId) async {
    try {
      // TODO: Implement database operation to unlike a DiscussionThread.
      // Retrieve the thread from the database using the threadId,
      // update its likes count, and save the changes in the database.

      // Placeholder code
      print('Thread unliked: $threadId');
    } catch (exc) {
      AppUtility.log('Error: $exc', tag: 'error');
      AppUtility.showSnackBar('Error: $exc', StringValues.error);
    }
  }
}
