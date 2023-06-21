import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/constants/colors.dart';
import 'package:my_ndu/constants/data.dart';
import 'package:my_ndu/constants/dimens.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/constants/styles.dart';
import 'package:my_ndu/extensions/string_extensions.dart';
import 'package:my_ndu/global_widgets/avatar_widget.dart';
import 'package:my_ndu/global_widgets/custom_app_bar.dart';
import 'package:my_ndu/global_widgets/custom_list_tile.dart';
import 'package:my_ndu/global_widgets/custom_refresh_indicator.dart';
import 'package:my_ndu/global_widgets/image_viewer_widget.dart';
import 'package:my_ndu/global_widgets/unfocus_widget.dart';
import 'package:my_ndu/modules/home/controllers/profile_controller.dart';
import 'package:my_ndu/modules/profile/controllers/edit_profile_picture_controller.dart';
import 'package:my_ndu/routes/route_management.dart';
import 'package:my_ndu/utils/utility.dart';

class ProfileDetailsView extends StatelessWidget {
  const ProfileDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnFocusWidget(
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: Dimens.screenWidth,
            height: Dimens.screenHeight,
            child: MyRefreshIndicator(
              onRefresh: () =>
                  ProfileController.find.fetchProfileDetails(fetchPost: false),
              showProgress: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyAppBar(
                    title: StringValues.editProfile,
                    padding: Dimens.edgeInsetsDefault,
                  ),
                  _buildBody(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) => GetBuilder<ProfileController>(
        builder: (logic) {
          return Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Padding(
                padding: Dimens.edgeInsetsHorizDefault,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Dimens.boxHeight8,

                    /// Profile Picture

                    Center(
                      child: GetBuilder<EditProfilePictureController>(
                        builder: (con) => GestureDetector(
                          onTap: () => _showProfilePictureBottomSheet(context),
                          child: Hero(
                            tag: logic.profileDetails!.user!.id,
                            child: AvatarWidget(
                              avatar: logic.profileDetails!.user!.avatar,
                              size: Dimens.screenWidth * 0.25,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Dimens.boxHeight16,

                    /// Name

                    MyListTile(
                      padding: Dimens.edgeInsets12,
                      bgColor: Theme.of(Get.context!).cardColor,
                      borderRadius: BorderRadius.circular(Dimens.four),
                      leading: const Icon(Icons.person_outline),
                      title: Text(
                        StringValues.name,
                        style: AppStyles.style12Normal.copyWith(
                          color: Theme.of(Get.context!)
                              .textTheme
                              .titleMedium!
                              .color,
                        ),
                      ),
                      subtitle: Text(
                        '${logic.profileDetails!.user!.fname} ${logic.profileDetails!.user!.lname}',
                        style: AppStyles.style16Normal.copyWith(
                          color:
                              Theme.of(Get.context!).textTheme.bodyLarge!.color,
                        ),
                      ),
                      onTap: RouteManagement.goToEditNameView,
                    ),

                    Dimens.boxHeight8,

                    /// Username

                    MyListTile(
                      padding: Dimens.edgeInsets12,
                      bgColor: Theme.of(Get.context!).cardColor,
                      borderRadius: BorderRadius.circular(Dimens.four),
                      leading: const Icon(Icons.alternate_email_outlined),
                      title: Text(
                        StringValues.username,
                        style: AppStyles.style12Normal.copyWith(
                          color: Theme.of(Get.context!)
                              .textTheme
                              .titleMedium!
                              .color,
                        ),
                      ),
                      subtitle: Text(
                        logic.profileDetails!.user!.uname,
                        style: AppStyles.style16Normal.copyWith(
                          color:
                              Theme.of(Get.context!).textTheme.bodyLarge!.color,
                        ),
                      ),
                      onTap: RouteManagement.goToEditUsernameView,
                    ),

                    Dimens.boxHeight8,

                    /// About

                    MyListTile(
                      padding: Dimens.edgeInsets12,
                      bgColor: Theme.of(Get.context!).cardColor,
                      borderRadius: BorderRadius.circular(Dimens.four),
                      leading: const Icon(Icons.note_add_outlined),
                      title: Text(
                        StringValues.about,
                        style: AppStyles.style12Normal.copyWith(
                          color: Theme.of(Get.context!)
                              .textTheme
                              .titleMedium!
                              .color,
                        ),
                      ),
                      subtitle: Text(
                        logic.profileDetails!.user!.about ??
                            StringValues.writeSomethingAboutYou,
                        style: AppStyles.style16Normal.copyWith(
                          color: logic.profileDetails!.user!.about == null
                              ? Theme.of(Get.context!)
                                  .textTheme
                                  .titleMedium
                                  ?.color
                              : Theme.of(Get.context!)
                                  .textTheme
                                  .bodyLarge
                                  ?.color,
                        ),
                        maxLines: 3,
                      ),
                      onTap: RouteManagement.goToEditAboutView,
                    ),

                    Dimens.boxHeight8,

                    /// Profession

                    Dimens.boxHeight8,

                    /// DOB

                    MyListTile(
                      padding: Dimens.edgeInsets12,
                      bgColor: Theme.of(Get.context!).cardColor,
                      borderRadius: BorderRadius.circular(Dimens.four),
                      leading: const Icon(Icons.cake_outlined),
                      title: Text(
                        StringValues.birthDate,
                        style: AppStyles.style12Normal.copyWith(
                          color: Theme.of(Get.context!)
                              .textTheme
                              .titleMedium!
                              .color,
                        ),
                      ),
                      subtitle: Text(
                        logic.profileDetails!.user!.dob ??
                            StringValues.dobFormat,
                        style: AppStyles.style16Normal.copyWith(
                          color: logic.profileDetails!.user!.dob == null
                              ? Theme.of(Get.context!)
                                  .textTheme
                                  .titleMedium
                                  ?.color
                              : Theme.of(Get.context!)
                                  .textTheme
                                  .bodyLarge
                                  ?.color,
                        ),
                      ),
                      onTap: RouteManagement.goToEditDOBView,
                    ),

                    Dimens.boxHeight8,

                    /// Gender

                    MyListTile(
                      padding: Dimens.edgeInsets12,
                      bgColor: Theme.of(Get.context!).cardColor,
                      borderRadius: BorderRadius.circular(Dimens.four),
                      leading: const Icon(Icons.male_outlined),
                      title: Text(
                        StringValues.gender,
                        style: AppStyles.style12Normal.copyWith(
                          color: Theme.of(Get.context!)
                              .textTheme
                              .titleMedium!
                              .color,
                        ),
                      ),
                      subtitle: Text(
                        logic.profileDetails!.user!.gender ??
                            StringValues.select,
                        style: AppStyles.style16Normal.copyWith(
                          color: logic.profileDetails!.user!.gender == null
                              ? Theme.of(Get.context!)
                                  .textTheme
                                  .titleMedium
                                  ?.color
                              : Theme.of(Get.context!)
                                  .textTheme
                                  .bodyLarge
                                  ?.color,
                        ),
                      ),
                      onTap: RouteManagement.goToEditGenderView,
                    ),

                    Dimens.boxHeight8,

                    /// Email

                    MyListTile(
                      padding: Dimens.edgeInsets12,
                      bgColor: Theme.of(Get.context!).cardColor,
                      borderRadius: BorderRadius.circular(Dimens.four),
                      leading: const Icon(Icons.email_outlined),
                      title: Text(
                        StringValues.email,
                        style: AppStyles.style12Normal.copyWith(
                          color: Theme.of(Get.context!)
                              .textTheme
                              .titleMedium!
                              .color,
                        ),
                      ),
                      subtitle: Text(
                        logic.profileDetails!.user!.email,
                        style: AppStyles.style16Normal.copyWith(
                          color:
                              Theme.of(Get.context!).textTheme.bodyLarge!.color,
                        ),
                      ),
                      onTap: () => RouteManagement.goToVerifyPasswordView(
                        RouteManagement.goToChangeEmailSettingsView,
                      ),
                    ),

                    if (logic.profileDetails!.user!.phone != null)
                      Dimens.boxHeight8,

                    /// Phone

                    if (logic.profileDetails!.user!.phone != null)
                      MyListTile(
                        padding: Dimens.edgeInsets12,
                        bgColor: Theme.of(Get.context!).cardColor,
                        borderRadius: BorderRadius.circular(Dimens.four),
                        leading: const Icon(Icons.phone_android),
                        title: Text(
                          StringValues.phone,
                          style: AppStyles.style12Normal.copyWith(
                            color: Theme.of(Get.context!)
                                .textTheme
                                .titleMedium!
                                .color,
                          ),
                        ),
                        subtitle: Text(
                          '${logic.profileDetails!.user!.countryCode!} ${logic.profileDetails!.user!.phone!}',
                          style: AppStyles.style16Normal.copyWith(
                            color: Theme.of(Get.context!)
                                .textTheme
                                .bodyLarge!
                                .color,
                          ),
                        ),
                        onTap: () => RouteManagement.goToVerifyPasswordView(
                          RouteManagement.goToChangePhoneSettingsView,
                        ),
                      ),

                    Dimens.boxHeight8,

                    /// Website

                    Dimens.boxHeight16,
                  ],
                ),
              ),
            ),
          );
        },
      );

  _showProfilePictureBottomSheet(BuildContext context) =>
      AppUtility.showBottomSheet(
        children: [
          /// View Profile Picture
          MyListTile(
            bgColor: ColorValues.transparent,
            padding: Dimens.edgeInsets12,
            showBorder: false,
            leading: Icon(
              Icons.image_outlined,
              size: Dimens.twentyFour,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
            title: Text(
              StringValues.view,
              style: AppStyles.style16Bold,
            ),
            onTap: () {
              AppUtility.closeBottomSheet();
              Get.to(
                () => ImageViewerWidget(
                    url: ProfileController
                        .find.profileDetails!.user!.avatar!.url!),
              );
            },
          ),

          /// Change Profile Picture
          MyListTile(
            bgColor: ColorValues.transparent,
            padding: Dimens.edgeInsets12,
            showBorder: false,
            leading: Icon(
              Icons.camera_alt_outlined,
              size: Dimens.twentyFour,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
            title: Text(
              StringValues.change,
              style: AppStyles.style16Bold,
            ),
            onTap: () {
              AppUtility.closeBottomSheet();
              EditProfilePictureController.find.chooseImage();
            },
          ),

          /// Remove Profile Picture
          MyListTile(
            bgColor: ColorValues.transparent,
            padding: Dimens.edgeInsets12,
            showBorder: false,
            leading: Icon(
              Icons.delete_outline,
              size: Dimens.twentyFour,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
            title: Text(
              StringValues.remove,
              style: AppStyles.style16Bold,
            ),
            onTap: () {
              AppUtility.closeBottomSheet();
              EditProfilePictureController.find.removeProfilePicture();
            },
          ),
        ],
      );
}
