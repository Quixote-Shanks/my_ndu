import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/app_services/auth_service.dart';
import 'package:my_ndu/constants/colors.dart';
import 'package:my_ndu/constants/dimens.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/constants/styles.dart';
import 'package:my_ndu/global_widgets/circular_progress_indicator.dart';
import 'package:my_ndu/global_widgets/custom_app_bar.dart';
import 'package:my_ndu/global_widgets/custom_refresh_indicator.dart';
import 'package:my_ndu/global_widgets/load_more_widget.dart';
import 'package:my_ndu/global_widgets/primary_text_btn.dart';
import 'package:my_ndu/global_widgets/unfocus_widget.dart';
import 'package:my_ndu/modules/settings/controllers/login_info_controller.dart';
import 'package:my_ndu/modules/settings/views/widgets/login_info_widget.dart';

class LoginInfoHistoryView extends StatelessWidget {
  const LoginInfoHistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UnFocusWidget(
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: Dimens.screenWidth,
            height: Dimens.screenHeight,
            child: MyRefreshIndicator(
              onRefresh: LoginInfoController.find.getLoginHisory,
              showProgress: false,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyAppBar(
                    title: StringValues.loginActivity,
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

  Widget _buildBody(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: Dimens.edgeInsetsHorizDefault,
        child: GetBuilder<LoginInfoController>(
          builder: (logic) {
            if (logic.isLoading) {
              return const Center(child: MyCircularProgressIndicator());
            }

            return SingleChildScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Dimens.boxHeight8,
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: logic.loginInfoList.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (ctx, index) {
                      var item = logic.loginInfoList.elementAt(index);

                      if (item.deviceId ==
                          AuthService.find.deviceId.toString()) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              StringValues.currentDevice.toUpperCase(),
                              style: AppStyles.style14Bold.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .color,
                              ),
                            ),
                            Dimens.boxHeight8,
                            LoginInfoWidget(item: item),
                            Dimens.boxHeight8,
                            Text(
                              StringValues.otherDevices.toUpperCase(),
                              style: AppStyles.style14Bold.copyWith(
                                color: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .color,
                              ),
                            ),
                            Dimens.boxHeight8,
                          ],
                        );
                      }

                      return LoginInfoWidget(item: item);
                    },
                  ),
                  LoadMoreWidget(
                    loadingCondition: logic.isMoreLoading,
                    hasMoreCondition: logic.loginHistoryData!.results != null &&
                        logic.loginHistoryData!.hasNextPage!,
                    loadMore: logic.loadMore,
                  ),
                  Dimens.boxHeight8,
                  MyTextButton(
                    label: StringValues.logoutAllDevices,
                    onTap: () => logic.logoutAllOtherDevices(
                        AuthService.find.deviceId.toString()),
                    labelStyle: AppStyles.style16Bold
                        .copyWith(color: ColorValues.errorColor),
                    padding: Dimens.edgeInsets8_0,
                  ),
                  Dimens.boxHeight16,
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
