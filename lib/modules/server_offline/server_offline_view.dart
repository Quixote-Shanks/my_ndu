import 'package:flutter/material.dart';
import 'package:my_ndu/constants/assets.dart';
import 'package:my_ndu/constants/dimens.dart';
import 'package:my_ndu/constants/styles.dart';
import 'package:my_ndu/utils/utility.dart';
import 'package:rive/rive.dart';

class ServerOfflineView extends StatelessWidget {
  const ServerOfflineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var lastExitTime = DateTime.now();
    return WillPopScope(
      onWillPop: () async {
        if (DateTime.now().difference(lastExitTime) >=
            const Duration(seconds: 2)) {
          AppUtility.showSnackBar(
            'Press the back button again to exit the app',
            '',
            duration: 2,
          );
          lastExitTime = DateTime.now();

          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            width: Dimens.screenWidth,
            height: Dimens.screenHeight,
            padding: Dimens.edgeInsetsDefault,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: Dimens.screenWidth * 0.75,
                  height: Dimens.screenWidth * 0.75,
                  child: const RiveAnimation.asset(
                    RiveAssets.error,
                    alignment: Alignment.center,
                  ),
                ),
                Dimens.boxHeight16,
                Text(
                  'Server Offline',
                  style: AppStyles.style20Bold,
                  textAlign: TextAlign.center,
                ),
                Dimens.boxHeight8,
                Text(
                  'We sincerely apologize for the inconvenience.',
                  style: AppStyles.style14Normal,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Our server is offline and will return shortly.',
                  style: AppStyles.style14Normal,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Please try again later.',
                  style: AppStyles.style14Normal,
                  textAlign: TextAlign.center,
                ),
                Dimens.boxHeight16,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
