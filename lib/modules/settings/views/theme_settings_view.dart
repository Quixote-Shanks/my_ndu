import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/app_services/theme_controller.dart';
import 'package:my_ndu/constants/dimens.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/constants/styles.dart';
import 'package:my_ndu/extensions/string_extensions.dart';
import 'package:my_ndu/global_widgets/custom_app_bar.dart';
import 'package:my_ndu/global_widgets/custom_radio_tile.dart';

const String kSystemMode = 'system';
const String kLightMode = 'light';
const String kDarkMode = 'dark';

class ThemeSettingsView extends StatelessWidget {
  const ThemeSettingsView({Key? key}) : super(key: key);

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
                title: StringValues.theme,
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
          child: GetBuilder<AppThemeController>(
            builder: (logic) => Column(
              children: [
                Dimens.boxHeight8,

                /// System
                MyRadioTile(
                  padding: Dimens.edgeInsets12,
                  showBorder: true,
                  bgColor: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(Dimens.four),
                  onTap: () => logic.setThemeMode(kSystemMode),
                  onChanged: (value) {
                    logic.setThemeMode(value);
                  },
                  title: Text(
                    StringValues.systemDefault.toTitleCase(),
                    style: AppStyles.style14Bold,
                  ),
                  subtitle: Text(
                    StringValues.systemDefaultDesc,
                    style: AppStyles.style13Normal.copyWith(
                      color: Theme.of(context).textTheme.titleMedium!.color,
                    ),
                  ),
                  value: kSystemMode,
                  groupValue: logic.themeMode,
                ),

                Dimens.boxHeight8,

                /// Light
                MyRadioTile(
                  padding: Dimens.edgeInsets12,
                  showBorder: true,
                  bgColor: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(Dimens.four),
                  onTap: () => logic.setThemeMode(kLightMode),
                  onChanged: (value) {
                    logic.setThemeMode(value);
                  },
                  title: Text(
                    StringValues.light.toTitleCase(),
                    style: AppStyles.style14Bold,
                  ),
                  subtitle: Text(
                    StringValues.lightModeDesc,
                    style: AppStyles.style13Normal.copyWith(
                      color: Theme.of(context).textTheme.titleMedium!.color,
                    ),
                  ),
                  value: kLightMode,
                  groupValue: logic.themeMode,
                ),

                Dimens.boxHeight8,

                /// Dark
                MyRadioTile(
                  padding: Dimens.edgeInsets12,
                  showBorder: true,
                  bgColor: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(Dimens.four),
                  onTap: () => logic.setThemeMode(kDarkMode),
                  onChanged: (value) {
                    logic.setThemeMode(value);
                  },
                  title: Text(
                    StringValues.dark.toTitleCase(),
                    style: AppStyles.style14Bold,
                  ),
                  subtitle: Text(
                    StringValues.darkModeDesc,
                    style: AppStyles.style13Normal.copyWith(
                      color: Theme.of(context).textTheme.titleMedium!.color,
                    ),
                  ),
                  value: kDarkMode,
                  groupValue: logic.themeMode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
