import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_ndu/constants/dimens.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/constants/styles.dart';
import 'package:my_ndu/extensions/string_extensions.dart';
import 'package:my_ndu/global_widgets/custom_app_bar.dart';
import 'package:my_ndu/global_widgets/custom_list_tile.dart';
import 'package:my_ndu/utils/utility.dart';
import 'package:talker_flutter/talker_flutter.dart';

class HelpSettingsView extends StatelessWidget {
  const HelpSettingsView({Key? key}) : super(key: key);

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
                title: StringValues.help,
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
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Dimens.boxHeight8,

              /// Report an issue
              MyListTile(
                padding: Dimens.edgeInsets12,
                bgColor: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(Dimens.four),
                title: Text(
                  StringValues.reportIssue.toTitleCase(),
                  style: AppStyles.style14Bold,
                ),
                subtitle: Text(
                  StringValues.reportIssueDesc,
                  style: AppStyles.style13Normal.copyWith(
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  ),
                ),
                onTap: () =>
                    AppUtility.openUrl(Uri.parse(StringValues.telegramUrl)),
              ),

              Dimens.boxHeight8,

              /// Send us suggestions
              MyListTile(
                padding: Dimens.edgeInsets12,
                bgColor: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(Dimens.four),
                title: Text(
                  StringValues.sendUsSuggestions.toTitleCase(),
                  style: AppStyles.style14Bold,
                ),
                subtitle: Text(
                  StringValues.sendUsSuggestionsDesc,
                  style: AppStyles.style13Normal.copyWith(
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  ),
                ),
                onTap: () =>
                    AppUtility.openUrl(Uri.parse(StringValues.telegramUrl)),
              ),

              Dimens.boxHeight8,

              /// Privacy Policy
              MyListTile(
                padding: Dimens.edgeInsets12,
                bgColor: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(Dimens.four),
                title: Text(
                  StringValues.privacyPolicy.toTitleCase(),
                  style: AppStyles.style14Bold,
                ),
                subtitle: Text(
                  StringValues.privacyPolicyDesc,
                  style: AppStyles.style13Normal.copyWith(
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  ),
                ),
                onTap: () =>
                    AppUtility.openUrl(Uri.parse(StringValues.privacyPolicy)),
              ),

              Dimens.boxHeight8,

              /// Terms of Use
              MyListTile(
                padding: Dimens.edgeInsets12,
                bgColor: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(Dimens.four),
                title: Text(
                  StringValues.termsOfUse.toTitleCase(),
                  style: AppStyles.style14Bold,
                ),
                subtitle: Text(
                  StringValues.termsOfUseDesc,
                  style: AppStyles.style13Normal.copyWith(
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  ),
                ),
                onTap: () => AppUtility.openUrl(
                    Uri.parse(StringValues.termsOfServiceUrl)),
              ),

              Dimens.boxHeight8,

              /// Community Guidelines
              MyListTile(
                padding: Dimens.edgeInsets12,
                bgColor: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(Dimens.four),
                title: Text(
                  StringValues.communityGuidelines.toTitleCase(),
                  style: AppStyles.style14Bold,
                ),
                subtitle: Text(
                  StringValues.communityGuidelinesDesc,
                  style: AppStyles.style13Normal.copyWith(
                    color: Theme.of(context).textTheme.titleMedium!.color,
                  ),
                ),
                onTap: () => AppUtility.openUrl(
                    Uri.parse(StringValues.communityGuidelinesUrl)),
              ),

              if (kDebugMode) Dimens.boxHeight8,

              /// View Logs
              if (kDebugMode)
                MyListTile(
                  padding: Dimens.edgeInsets12,
                  bgColor: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.circular(Dimens.four),
                  title: Text(
                    StringValues.viewLogs.toTitleCase(),
                    style: AppStyles.style14Bold,
                  ),
                  subtitle: Text(
                    StringValues.viewLogsDesc,
                    style: AppStyles.style13Normal.copyWith(
                      color: Theme.of(context).textTheme.titleMedium!.color,
                    ),
                  ),
                  onTap: () => Get.to(
                    () => TalkerScreen(
                      talker: AppUtility.logger,
                      appBarTitle: 'Logs',
                      theme: TalkerScreenTheme(
                        backgroudColor:
                            Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ),
                  ),
                ),

              Dimens.boxHeight16,
            ],
          ),
        ),
      ),
    );
  }
}
