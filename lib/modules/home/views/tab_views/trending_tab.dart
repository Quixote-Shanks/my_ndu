import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/constants/colors.dart';
import 'package:my_ndu/constants/dimens.dart';
import 'package:my_ndu/constants/styles.dart';
import 'package:my_ndu/modules/home/controllers/tab_controller.dart';

class TrendingTabView extends StatelessWidget {
  const TrendingTabView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
      width: Dimens.screenWidth,
      height: Dimens.screenHeight,
      child: GetBuilder<TrendingTabController>(
        builder: (logic) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTabBar(logic, context),
              Dimens.boxHeight8,
              _buildTabBarView(logic),
            ],
          );
        },
      ),
    );
  }

  Expanded _buildTabBarView(TrendingTabController logic) {
    return Expanded(
      child: Padding(
        padding: Dimens.edgeInsetsHorizDefault,
        child: TabBarView(
          controller: logic.controller,
          children: logic.tabViews,
        ),
      ),
    );
  }

  TabBar _buildTabBar(TrendingTabController logic, BuildContext context) {
    return TabBar(
      controller: logic.controller,
      tabs: logic.tabs,
      indicatorWeight: Dimens.two,
      indicatorSize: TabBarIndicatorSize.label,
      unselectedLabelColor: Theme.of(context).textTheme.titleMedium!.color,
      labelColor: ColorValues.primaryColor,
      labelStyle: AppStyles.style14Bold.copyWith(
        color: ColorValues.primaryColor,
      ),
      unselectedLabelStyle: AppStyles.style16Bold.copyWith(
        color: ColorValues.grayColor,
      ),
      labelPadding: Dimens.edgeInsets0,
      padding: Dimens.edgeInsetsHorizDefault,
      indicatorPadding: Dimens.edgeInsets0,
      indicatorColor: ColorValues.primaryColor,
    );
  }
}
