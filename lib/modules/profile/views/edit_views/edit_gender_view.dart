import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/constants/dimens.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/constants/styles.dart';
import 'package:my_ndu/extensions/string_extensions.dart';
import 'package:my_ndu/global_widgets/custom_app_bar.dart';
import 'package:my_ndu/global_widgets/custom_radio_tile.dart';
import 'package:my_ndu/global_widgets/primary_filled_btn.dart';
import 'package:my_ndu/modules/profile/controllers/edit_gender_controller.dart';

class EditGenderView extends StatelessWidget {
  const EditGenderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: Dimens.screenWidth,
            height: Dimens.screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyAppBar(
                  title: StringValues.gender,
                  padding: Dimens.edgeInsetsDefault,
                ),
                _buildBody(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) => GetBuilder<EditGenderController>(
        builder: (logic) => Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Padding(
              padding: Dimens.edgeInsetsHorizDefault,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Dimens.boxHeight8,

                  /// Male
                  MyRadioTile(
                    padding: Dimens.edgeInsets12,
                    showBorder: true,
                    bgColor: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(Dimens.four),
                    onTap: () => logic.setGender = StringValues.male,
                    onChanged: (value) {
                      logic.setGender = value.toString();
                    },
                    title: Text(
                      StringValues.male.toTitleCase(),
                      style: AppStyles.style14Bold,
                    ),
                    value: StringValues.male,
                    groupValue: logic.gender,
                  ),

                  Dimens.boxHeight8,

                  /// Female
                  MyRadioTile(
                    padding: Dimens.edgeInsets12,
                    showBorder: true,
                    bgColor: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(Dimens.four),
                    onTap: () => logic.setGender = StringValues.female,
                    onChanged: (value) {
                      logic.setGender = value.toString();
                    },
                    title: Text(
                      StringValues.female.toTitleCase(),
                      style: AppStyles.style14Bold,
                    ),
                    value: StringValues.female,
                    groupValue: logic.gender,
                  ),

                  Dimens.boxHeight8,

                  /// Others
                  MyRadioTile(
                    padding: Dimens.edgeInsets12,
                    showBorder: true,
                    bgColor: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(Dimens.four),
                    onTap: () => logic.setGender = StringValues.others,
                    onChanged: (value) {
                      logic.setGender = value.toString();
                    },
                    title: Text(
                      StringValues.others.toTitleCase(),
                      style: AppStyles.style14Bold,
                    ),
                    value: StringValues.others,
                    groupValue: logic.gender,
                  ),
                  Dimens.boxHeight40,
                  MyFilledButton(
                    onTap: logic.updateGender,
                    label: StringValues.save.toUpperCase(),
                    height: Dimens.fiftySix,
                  ),

                  Dimens.boxHeight16,
                ],
              ),
            ),
          ),
        ),
      );
}
