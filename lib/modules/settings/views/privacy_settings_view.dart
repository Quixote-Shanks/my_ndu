import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/constants/dimens.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/constants/styles.dart';
import 'package:my_ndu/global_widgets/custom_app_bar.dart';
import 'package:my_ndu/global_widgets/custom_list_tile.dart';
import 'package:my_ndu/modules/home/controllers/profile_controller.dart';
import 'package:my_ndu/routes/route_management.dart';

class PrivacySettingsView extends StatelessWidget {
  const PrivacySettingsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: Dimens.screenWidth,
          height: Dimens.screenHeight,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(
                title: StringValues.privacy,
                padding: Dimens.edgeInsetsDefault,
              ),
              _buildBody(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: Dimens.edgeInsetsHorizDefault,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Dimens.boxHeight8,

              /// Account Privacy
              GetBuilder<ProfileController>(
                builder: (logic) => MyListTile(
                  padding: Dimens.edgeInsets12,
                  bgColor: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(Dimens.four),
                  title: Text(
                    StringValues.accountPrivacy,
                    style: AppStyles.style14Bold,
                  ),
                  subtitle: Text(
                    StringValues.accountPrivacyDesc,
                    style: AppStyles.style13Normal.copyWith(
                      color: Theme.of(context).textTheme.titleMedium!.color,
                    ),
                  ),
                  trailing: Text(
                    logic.profileDetails!.user!.isPrivate
                        ? StringValues.on
                        : StringValues.off,
                    style: AppStyles.style13Bold.copyWith(
                      color: logic.profileDetails!.user!.isPrivate
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).textTheme.titleMedium!.color,
                    ),
                  ),
                  onTap: RouteManagement.goToChangeAccountPrivacyView,
                ),
              ),

              Dimens.boxHeight8,

              /// Online Status
              GetBuilder<ProfileController>(
                builder: (logic) {
                  return MyListTile(
                    padding: Dimens.edgeInsets12,
                    bgColor: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(Dimens.four),
                    title: Text(
                      StringValues.onlineStatus,
                      style: AppStyles.style14Bold,
                    ),
                    subtitle: Text(
                      StringValues.onlineStatusDesc,
                      style: AppStyles.style13Normal.copyWith(
                        color: Theme.of(context).textTheme.titleMedium!.color,
                      ),
                    ),
                    trailing: Text(
                      logic.profileDetails!.user!.showOnlineStatus == true
                          ? StringValues.on
                          : StringValues.off,
                      style: AppStyles.style13Bold.copyWith(
                        color: logic.profileDetails!.user!.showOnlineStatus ==
                                true
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).textTheme.titleMedium!.color,
                      ),
                    ),
                    onTap: RouteManagement.goToChangeOnlineStatusView,
                  );
                },
              ),

              Dimens.boxHeight8,

              /// Mute and Block
              MyListTile(
                padding: Dimens.edgeInsets12,
                bgColor: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(Dimens.four),
                title: Text(
                  StringValues.muteAndBlock,
                  style: AppStyles.style14Bold,
                ),
                subtitle: Text(
                  StringValues.muteAndBlockDesc,
                  style: AppStyles.style13Normal.copyWith(
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  ),
                ),
                onTap: RouteManagement.goToMuteAndBlockSettingsView,
              ),

              Dimens.boxHeight8,

              /// Posts
              MyListTile(
                padding: Dimens.edgeInsets12,
                bgColor: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(Dimens.four),
                title: Text(
                  StringValues.postPrivacy,
                  style: AppStyles.style14Bold,
                ),
                subtitle: Text(
                  StringValues.postPrivacyDesc,
                  style: AppStyles.style13Normal.copyWith(
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  ),
                ),
              ),

              Dimens.boxHeight8,

              /// Comments
              MyListTile(
                padding: Dimens.edgeInsets12,
                bgColor: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(Dimens.four),
                title: Text(
                  StringValues.commentPrivacy,
                  style: AppStyles.style14Bold,
                ),
                subtitle: Text(
                  StringValues.commentPrivacyDesc,
                  style: AppStyles.style13Normal.copyWith(
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  ),
                ),
              ),

              // Dimens.boxHeight8,

              // /// Messages
              // MyListTile(
              //   padding: Dimens.edgeInsets12,
              //   bgColor: Theme.of(context).cardColor,
              //   borderRadius: BorderRadius.circular(Dimens.four),
              //   title: Text(
              //     StringValues.messagePrivacy,
              //     style: AppStyles.style14Bold,
              //   ),
              //   subtitle: Text(
              //     StringValues.commentPrivacyDesc,
              //     style: AppStyles.style13Normal.copyWith(
              //       color: Theme.of(context).textTheme.titleMedium!.color,
              //     ),
              //   ),
              // ),

              // Dimens.boxHeight8,

              // /// Moments
              // MyListTile(
              //   padding: Dimens.edgeInsets12,
              //   bgColor: Theme.of(context).cardColor,
              //   borderRadius: BorderRadius.circular(Dimens.four),
              //   title: Text(
              //     StringValues.storyPrivacy,
              //     style: AppStyles.style14Bold,
              //   ),
              //   subtitle: Text(
              //     StringValues.storyPrivacyDesc,
              //     style: AppStyles.style13Normal.copyWith(
              //       color: Theme.of(context).textTheme.titleMedium!.color,
              //     ),
              //   ),
              // ),

              Dimens.boxHeight16,
            ],
          ),
        ),
      ),
    );
  }
}
