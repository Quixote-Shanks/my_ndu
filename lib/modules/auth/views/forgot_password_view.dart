import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/constants/dimens.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/constants/styles.dart';
import 'package:my_ndu/global_widgets/custom_app_bar.dart';
import 'package:my_ndu/global_widgets/primary_filled_btn.dart';
import 'package:my_ndu/global_widgets/primary_text_btn.dart';
import 'package:my_ndu/modules/auth/controllers/password_controller.dart';
import 'package:my_ndu/routes/route_management.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({Key? key}) : super(key: key);

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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                MyAppBar(
                  title: StringValues.forgotPassword,
                  padding: Dimens.edgeInsetsDefault,
                ),
                _buildForgotPasswordFields(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordFields(BuildContext context) =>
      GetBuilder<PasswordController>(
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
                    Dimens.boxHeight32,
                    Text(
                      StringValues.forgotPasswordWelcome,
                      style: AppStyles.style32Bold.copyWith(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    Dimens.boxHeight32,
                    Text(
                      StringValues.enterEmailToSendOtp,
                      style: AppStyles.style12Normal,
                    ),
                    Dimens.boxHeight12,
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: StringValues.enterEmail,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      maxLines: 1,
                      style: AppStyles.style14Normal.copyWith(
                        color: Theme.of(context).textTheme.bodyLarge!.color,
                      ),
                      controller: logic.emailTextController,
                      onEditingComplete: logic.focusNode.unfocus,
                    ),
                    Dimens.heightedBox(Dimens.twentyEight),
                    MyTextButton(
                      label: StringValues.loginToAccount,
                      onTap: () {
                        RouteManagement.goToBack();
                        RouteManagement.goToLoginView();
                      },
                    ),
                    Dimens.boxHeight32,
                    MyFilledButton(
                      onTap: () => logic.sendResetPasswordOTP(),
                      label: StringValues.sendOtp.toUpperCase(),
                      height: Dimens.fiftySix,
                    ),
                    Dimens.boxHeight32,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          StringValues.alreadyHaveOtp,
                          style: AppStyles.style14Normal,
                        ),
                        Dimens.boxWidth4,
                        MyTextButton(
                          label: StringValues.resetPassword,
                          onTap: () {
                            RouteManagement.goToBack();
                            RouteManagement.goToResetPasswordView();
                          },
                        ),
                      ],
                    ),
                    Dimens.boxHeight16,
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
