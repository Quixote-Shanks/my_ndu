import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/constants/colors.dart';
import 'package:my_ndu/constants/dimens.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/constants/styles.dart';
import 'package:my_ndu/global_widgets/custom_app_bar.dart';
import 'package:my_ndu/global_widgets/primary_filled_btn.dart';
import 'package:my_ndu/modules/settings/controllers/send_suggestions_controller.dart';

class SendSuggestionsView extends StatelessWidget {
  const SendSuggestionsView({Key? key}) : super(key: key);

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
                title: StringValues.sendSuggestions,
                padding: Dimens.edgeInsets8_16,
              ),
              Dimens.boxHeight16,
              _buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return Expanded(
      child: SingleChildScrollView(
          child: GetBuilder<SendSuggestionsController>(
        builder: (logic) => Padding(
          padding: Dimens.edgeInsets0_16,
          child: FocusScope(
            node: logic.focusNode,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: Dimens.hundred,
                  constraints: BoxConstraints(maxWidth: Dimens.screenWidth),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Dimens.eight),
                      ),
                      hintStyle: AppStyles.style14Normal.copyWith(
                        color: ColorValues.grayColor,
                      ),
                      hintText: StringValues.writeSuggestion,
                    ),
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    style: AppStyles.style14Normal.copyWith(
                      color: Theme.of(Get.context!).textTheme.bodyLarge!.color,
                    ),
                    controller: logic.messageTextController,
                  ),
                ),
                Dimens.boxHeight40,
                MyFilledButton(
                  onTap: logic.sendSuggestionsEmail,
                  label: StringValues.next.toUpperCase(),
                  height: Dimens.fiftySix,
                ),
                Dimens.boxHeight16,
              ],
            ),
          ),
        ),
      )),
    );
  }
}
