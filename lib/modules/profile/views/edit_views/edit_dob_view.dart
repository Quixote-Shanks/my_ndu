import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/constants/colors.dart';
import 'package:my_ndu/constants/dimens.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/constants/styles.dart';
import 'package:my_ndu/global_widgets/custom_app_bar.dart';
import 'package:my_ndu/global_widgets/primary_filled_btn.dart';
import 'package:my_ndu/modules/profile/controllers/edit_dob_controller.dart';

class EditDOBView extends StatelessWidget {
  const EditDOBView({Key? key}) : super(key: key);

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
                  title: StringValues.birthDate,
                  padding: Dimens.edgeInsetsDefault,
                ),
                _buildBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBody() => GetBuilder<EditDOBController>(
        builder: (logic) => Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: Dimens.edgeInsetsHorizDefault,
              child: FocusScope(
                node: logic.focusNode,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Dimens.boxHeight8,
                    GestureDetector(
                      onTap: () => _showDatePicker(logic),
                      child: Container(
                        height: Dimens.fiftySix,
                        constraints:
                            BoxConstraints(maxWidth: Dimens.screenWidth),
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: StringValues.dob,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(Dimens.four),
                            ),
                            hintStyle: AppStyles.style14Normal.copyWith(
                              color: ColorValues.grayColor,
                            ),
                          ),
                          maxLines: 1,
                          keyboardType: TextInputType.datetime,
                          style: AppStyles.style16Normal.copyWith(
                            color: Theme.of(Get.context!)
                                .textTheme
                                .bodyLarge!
                                .color,
                          ),
                          controller: logic.dobTextController,
                          enabled: false,
                          onEditingComplete: logic.focusNode.unfocus,
                        ),
                      ),
                    ),
                    Dimens.boxHeight40,
                    MyFilledButton(
                      onTap: logic.updateDOB,
                      label: StringValues.save.toUpperCase(),
                      height: Dimens.fiftySix,
                    ),
                    Dimens.boxHeight16,
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  _showDatePicker(EditDOBController logic) {
    showDatePicker(
      context: Get.overlayContext!,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Theme.of(context).colorScheme.secondary,
            hintColor: Theme.of(context).colorScheme.secondary,
            colorScheme: ColorScheme.light(
                primary: Theme.of(context).colorScheme.secondary),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child ?? const SizedBox(),
        );
      },
    ).then((selectedDate) {
      if (selectedDate != null) {
        logic.dobTextController.text = selectedDate.toString().substring(0, 10);
      }
    });
  }
}
