import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/constants/dimens.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/constants/styles.dart';
import 'package:my_ndu/extensions/string_extensions.dart';
import 'package:my_ndu/global_widgets/custom_app_bar.dart';
import 'package:my_ndu/global_widgets/custom_radio_tile.dart';
import 'package:my_ndu/modules/home/controllers/profile_controller.dart';
import 'package:my_ndu/modules/settings/controllers/account_privacy_controller.dart';

class AccountPrivacyView extends StatelessWidget {
  const AccountPrivacyView({Key? key}) : super(key: key);

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
                title: StringValues.accountPrivacy,
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
          child: GetBuilder<AccountPrivacyController>(
            builder: (logic) {
              final currentUser = ProfileController.find.profileDetails!.user!;

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Dimens.boxHeight8,

                  /// Public
                  MyRadioTile(
                    padding: Dimens.edgeInsets12,
                    bgColor: Theme.of(context).cardColor,
                    showBorder: true,
                    borderRadius: BorderRadius.circular(Dimens.four),
                    onTap: () => logic.changeAccountPrivacy(false),
                    onChanged: (v) => logic.changeAccountPrivacy(false),
                    title: Text(
                      StringValues.public.toTitleCase(),
                      style: AppStyles.style14Bold,
                    ),
                    subtitle: Text(
                      StringValues.publicPrivacyDesc,
                      style: AppStyles.style13Normal.copyWith(
                        color: Theme.of(context).textTheme.titleMedium!.color,
                      ),
                    ),
                    value: false,
                    groupValue: currentUser.isPrivate,
                  ),

                  Dimens.boxHeight8,

                  /// Private
                  MyRadioTile(
                    padding: Dimens.edgeInsets12,
                    bgColor: Theme.of(context).cardColor,
                    showBorder: true,
                    borderRadius: BorderRadius.circular(Dimens.four),
                    onTap: () => logic.changeAccountPrivacy(true),
                    onChanged: (v) => logic.changeAccountPrivacy(true),
                    title: Text(
                      StringValues.private.toTitleCase(),
                      style: AppStyles.style14Bold,
                    ),
                    subtitle: Text(
                      StringValues.privatePrivacyDesc,
                      style: AppStyles.style13Normal.copyWith(
                        color: Theme.of(context).textTheme.titleMedium!.color,
                      ),
                    ),
                    value: true,
                    groupValue: currentUser.isPrivate,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
