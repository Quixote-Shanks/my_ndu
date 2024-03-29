import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/constants/colors.dart';
import 'package:my_ndu/constants/dimens.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/constants/styles.dart';
import 'package:my_ndu/global_widgets/circular_progress_indicator.dart';
import 'package:my_ndu/global_widgets/custom_app_bar.dart';
import 'package:my_ndu/global_widgets/custom_refresh_indicator.dart';
import 'package:my_ndu/global_widgets/primary_text_btn.dart';
import 'package:my_ndu/global_widgets/unfocus_widget.dart';
import 'package:my_ndu/modules/follower/controllers/following_list_controller.dart';
import 'package:my_ndu/modules/home/views/widgets/user_widget.dart';
import 'package:my_ndu/routes/route_management.dart';

class FollowingListView extends StatelessWidget {
  const FollowingListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnFocusWidget(
      child: Scaffold(
        body: SafeArea(
          child: MyRefreshIndicator(
            onRefresh: FollowingListController.find.getFollowingList,
            showProgress: false,
            child: SizedBox(
              width: Dimens.screenWidth,
              height: Dimens.screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  MyAppBar(
                    title: StringValues.following,
                    padding: Dimens.edgeInsetsDefault,
                  ),
                  Dimens.boxHeight8,
                  _buildBody(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: GetBuilder<FollowingListController>(
        builder: (logic) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Padding(
              padding: Dimens.edgeInsetsHorizDefault,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimens.eight),
                        gapPadding: Dimens.zero,
                      ),
                      contentPadding: Dimens.edgeInsets4_8,
                      constraints: BoxConstraints(
                        maxWidth: Dimens.screenWidth,
                      ),
                      hintStyle: AppStyles.style14Normal.copyWith(
                        color: ColorValues.grayColor,
                      ),
                      hintText: StringValues.search,
                      prefixIcon: const Icon(
                        Icons.search,
                        color: ColorValues.grayColor,
                      ),
                    ),
                    keyboardType: TextInputType.text,
                    maxLines: 1,
                    style: AppStyles.style14Normal.copyWith(
                      color: Theme.of(Get.context!).textTheme.bodyLarge!.color,
                    ),
                    controller: logic.searchTextController,
                    onChanged: (value) => logic.searchFollowings(value),
                  ),
                  Dimens.boxHeight16,
                  _buildFollowers(logic),
                  Dimens.boxHeight16,
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildFollowers(FollowingListController logic) {
    if (logic.isLoading &&
        (logic.followingData == null || logic.followingList.isEmpty)) {
      return const Center(child: MyCircularProgressIndicator());
    }
    if (logic.followingData == null || logic.followingList.isEmpty) {
      return Padding(
        padding: Dimens.edgeInsets0_16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              StringValues.noFollowing,
              style: AppStyles.style32Bold.copyWith(
                color: Theme.of(Get.context!).textTheme.titleMedium!.color,
              ),
              textAlign: TextAlign.center,
            ),
            Dimens.boxHeight16,
          ],
        ),
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (logic.isLoading &&
            (logic.followingData != null || logic.followingList.isNotEmpty))
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MyCircularProgressIndicator(),
              Dimens.boxHeight8,
            ],
          ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: logic.followingList.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (ctx, index) {
            var item = logic.followingList.elementAt(index).user;
            return UserWidget(
              user: item,
              totalLength: logic.followingList.length,
              index: index,
              onTap: () =>
                  RouteManagement.goToUserProfileDetailsViewByUserId(item.id),
              onActionTap: () {
                if (item.followingStatus == "requested") {
                  logic.cancelFollowRequest(item);
                  return;
                }
                logic.followUnfollowUser(item);
              },
            );
          },
        ),
        if (logic.isMoreLoading || logic.followingData!.hasNextPage!)
          Dimens.boxHeight8,
        if (logic.isMoreLoading)
          const Center(child: MyCircularProgressIndicator()),
        if (!logic.isMoreLoading && logic.followingData!.hasNextPage!)
          Center(
            child: MyTextButton(
              label: 'Load more followings',
              onTap: logic.loadMore,
              labelStyle: AppStyles.style14Bold.copyWith(
                color: ColorValues.primaryLightColor,
              ),
              padding: Dimens.edgeInsets8_0,
            ),
          ),
      ],
    );
  }
}
