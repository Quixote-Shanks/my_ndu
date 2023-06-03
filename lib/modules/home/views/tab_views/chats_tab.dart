import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/apis/models/entities/user.dart';
import 'package:my_ndu/constants/colors.dart';
import 'package:my_ndu/constants/dimens.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/constants/styles.dart';
import 'package:my_ndu/global_widgets/circular_progress_indicator.dart';
import 'package:my_ndu/global_widgets/custom_app_bar.dart';
import 'package:my_ndu/global_widgets/custom_refresh_indicator.dart';
import 'package:my_ndu/global_widgets/load_more_widget.dart';
import 'package:my_ndu/modules/chat/controllers/chat_controller.dart';
import 'package:my_ndu/modules/chat/widgets/chat_widget.dart';
import 'package:my_ndu/modules/home/controllers/profile_controller.dart';
import 'package:my_ndu/routes/route_management.dart';

class ChatsTabView extends StatelessWidget {
  const ChatsTabView({Key? key}) : super(key: key);

  NxAppBar _buildAppBar(BuildContext context) {
    return NxAppBar(
      padding: Dimens.edgeInsetsDefault,
      showBackBtn: false,
      child: Expanded(
        child: Row(
          children: [
            Text(
              StringValues.chats,
              style: AppStyles.style20Bold,
            ),
            const Spacer(),
            GestureDetector(
              onTap: () => {},
              child: Icon(
                Icons.search,
                size: Dimens.twentyFour,
                color: Theme.of(context).textTheme.bodyLarge!.color!,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final profile = ProfileController.find;

    return Expanded(
      child: GetBuilder<ChatController>(
        builder: (logic) {
          if (!logic.initialized) {
            return const Center(child: NxCircularProgressIndicator());
          }

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            padding: Dimens.edgeInsetsHorizDefault,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (logic.isLoading)
                  const Center(child: NxCircularProgressIndicator()),
                if (logic.isLoading) Dimens.boxHeight16,
                if (logic.socketApiProvider.isConnecting)
                  Center(
                    child: Text(
                      StringValues.connecting,
                      style: AppStyles.style12Bold.copyWith(
                        color: ColorValues.primaryColor,
                      ),
                    ),
                  ),
                if (logic.lastMessageData == null ||
                    logic.lastMessageList.isEmpty)
                  Center(
                    child: Text(
                      StringValues.noConversation,
                      style: AppStyles.style32Bold.copyWith(
                        color:
                            Theme.of(Get.context!).textTheme.titleMedium!.color,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )
                else
                  ListView.builder(
                    itemCount: logic.lastMessageList.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final item = logic.lastMessageList[index];
                      final isMe =
                          item.senderId == profile.profileDetails!.user!.id;
                      final isUserOnline = logic.isUserOnline(
                          isMe ? item.receiverId! : item.senderId!);
                      return ChatWidget(
                        chat: item,
                        totalLength: logic.lastMessageList.length,
                        index: logic.lastMessageList.indexOf(item),
                        onTap: () => RouteManagement.goToChatDetailsView(
                          User(
                            id: isMe ? item.receiverId! : item.senderId!,
                            fname: isMe
                                ? item.receiver!.fname
                                : item.sender!.fname,
                            lname: isMe
                                ? item.receiver!.lname
                                : item.sender!.lname,
                            email: isMe
                                ? item.receiver!.email
                                : item.sender!.email,
                            uname: isMe
                                ? item.receiver!.uname
                                : item.sender!.uname,
                            avatar: isMe
                                ? item.receiver!.avatar
                                : item.sender!.avatar,
                            isPrivate: isMe
                                ? item.receiver!.isPrivate
                                : item.sender!.isPrivate,
                            followingStatus: isMe
                                ? item.receiver!.followingStatus
                                : item.sender!.followingStatus,
                            accountStatus: isMe
                                ? item.receiver!.accountStatus
                                : item.sender!.accountStatus,
                            isVerified: isMe
                                ? item.receiver!.isVerified
                                : item.sender!.isVerified,
                            verifiedCategory: isMe
                                ? item.receiver!.verifiedCategory
                                : item.sender!.verifiedCategory,
                            isBlockedByYou: isMe
                                ? item.receiver!.isBlockedByYou
                                : item.sender!.isBlockedByYou,
                            isBlockedByUser: isMe
                                ? item.receiver!.isBlockedByUser
                                : item.sender!.isBlockedByUser,
                            createdAt: isMe
                                ? item.receiver!.createdAt
                                : item.sender!.createdAt,
                            updatedAt: isMe
                                ? item.receiver!.updatedAt
                                : item.sender!.updatedAt,
                          ),
                        ),
                        isOnline: isUserOnline,
                      );
                    },
                  ),
                LoadMoreWidget(
                  loadingCondition: logic.isMoreLoading,
                  hasMoreCondition: logic.lastMessageData!.results != null &&
                      logic.lastMessageData!.hasNextPage!,
                  loadMore: logic.loadMore,
                ),
                Dimens.boxHeight16,
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      width: Dimens.screenWidth,
      height: Dimens.screenHeight,
      child: NxRefreshIndicator(
        onRefresh: ChatController.find.fetchLastMessages,
        showProgress: false,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildAppBar(context),
            _buildBody(context),
          ],
        ),
      ),
    );
  }
}
