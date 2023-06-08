import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_ndu/apis/models/entities/chat_message.dart';
import 'package:my_ndu/apis/models/entities/comment.dart';
import 'package:my_ndu/apis/models/entities/follower.dart';
import 'package:my_ndu/apis/models/entities/media_file.dart';
import 'package:my_ndu/apis/models/entities/notification.dart';
import 'package:my_ndu/apis/models/entities/poll_option.dart';
import 'package:my_ndu/apis/models/entities/post.dart';
import 'package:my_ndu/apis/models/entities/post_media_file.dart';
import 'package:my_ndu/apis/models/entities/profile.dart';
import 'package:my_ndu/apis/models/entities/user.dart';
import 'package:my_ndu/apis/models/responses/auth_response.dart';
import 'package:my_ndu/apis/models/responses/post_response.dart';
import 'package:my_ndu/app_services/auth_service.dart';
import 'package:my_ndu/app_services/firebase_service.dart';
import 'package:my_ndu/app_services/network_controller.dart';
import 'package:my_ndu/app_services/route_service.dart';
import 'package:my_ndu/app_services/theme_controller.dart';
import 'package:my_ndu/constants/enums.dart';
import 'package:my_ndu/constants/hive_box_names.dart';
import 'package:my_ndu/constants/strings.dart';
import 'package:my_ndu/modules/app_update/app_update_controller.dart';
import 'package:my_ndu/modules/chat/controllers/chat_controller.dart';
import 'package:my_ndu/modules/follow_request/follow_request_controller.dart';
import 'package:my_ndu/modules/home/controllers/notification_controller.dart';
import 'package:my_ndu/modules/home/controllers/post_controller.dart';
import 'package:my_ndu/modules/home/controllers/profile_controller.dart';
import 'package:my_ndu/routes/app_pages.dart';
import 'package:my_ndu/routes/route_management.dart';
import 'package:my_ndu/translations/app_translations.dart';
import 'package:my_ndu/utils/utility.dart';

import 'Bloc/Notes/notes_bloc.dart';
import 'Bloc/general/general_bloc.dart';
import 'Models/NoteModels.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initPreAppServices();
  final networkService = NetworkController.instance;
  await networkService.init();

  runApplication();

  await initializeFirebaseService();
  await _initPostAppServices();
}

void runApplication() {
  AppUtility.log('Initializing App');
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
  AppUtility.log('App Initialized');
}

Future<void> _initPostAppServices() async {
  final networkService = NetworkController.instance;

  if (networkService.isConnected == true) {
    await validateSessionAndGetData();
    Future.delayed(const Duration(seconds: 3), () {
      AppUpdateController.find.init();
    });
  }
}

Future<void> _initPreAppServices() async {
  AppUtility.log('Initializing PreApp Services');
  await GetStorage.init();
  await Hive.initFlutter();

  AppUtility.log('Registering Hive Adapters');

  Hive.registerAdapter(AuthResponseAdapter());
  Hive.registerAdapter(ProfileAdapter());
  Hive.registerAdapter(PollOptionAdapter());
  Hive.registerAdapter(PostAdapter());
  Hive.registerAdapter(MediaFileAdapter());
  Hive.registerAdapter(PostMediaFileAdapter());
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ChatMessageAdapter());
  Hive.registerAdapter(PostResponseAdapter());
  Hive.registerAdapter(NotificationModelAdapter());
  Hive.registerAdapter(FollowerAdapter());
  Hive.registerAdapter(CommentAdapter());
  Hive.registerAdapter(NoteModelsAdapter());

  AppUtility.log('Hive Adapters Registered');

  AppUtility.log('Opening Hive Boxes');

  await Hive.openBox<String>(HiveBoxNames.themeMode);
  await Hive.openBox<Post>(HiveBoxNames.posts);
  await Hive.openBox<Post>(HiveBoxNames.trendingPosts);
  await Hive.openBox<ChatMessage>(HiveBoxNames.lastMessages);
  await Hive.openBox<User>(HiveBoxNames.recommendedUsers);
  await Hive.openBox<NotificationModel>(HiveBoxNames.notifications);
  await Hive.openBox<Post>(HiveBoxNames.profilePosts);
  await Hive.openBox<Follower>(HiveBoxNames.followers);
  await Hive.openBox<Follower>(HiveBoxNames.followings);
  await Hive.openBox<User>(HiveBoxNames.blockedUsers);
  await Hive.openBox<NoteModels>(HiveBoxNames.keepNote);

  AppUtility.log('Hive Boxes Opened');

  AppUtility.log('Initializing Get Services');

  Get.put(AppThemeController(), permanent: true);
  Get.put(AuthService(), permanent: true);
  Get.put(ProfileController(), permanent: true);
  Get.put(FollowRequestController(), permanent: true);
  Get.put(NotificationController(), permanent: true);
  Get.put(ChatController(), permanent: true);
  Get.put(AppUpdateController(), permanent: true);
  Get.put(PostController(), permanent: true);

  AppUtility.log('Get Services Initialized');

  AppUtility.log('Checking Token');

  var authService = AuthService.find;

  await authService.getToken().then((token) async {
    if (token.isNotEmpty) {
      var isValid = await authService.validateLocalAuthToken();

      if (isValid) {
        RouteService.set(RouteStatus.loggedIn);
        return;
      }
    }

    if (RouteService.routeStatus != RouteStatus.notLoggedIn) {
      RouteService.set(RouteStatus.notLoggedIn);
    }
    AppUtility.log("User is not logged in", tag: 'error');
  });

  AppUtility.log('Token Checked');

  AppUtility.log('PreApp Services Initialized');
}

Future<void> validateSessionAndGetData() async {
  AppUtility.log('Validating Session and Getting Data');
  var authService = AuthService.find;

  var networkService = NetworkController.instance;

  if (networkService.isConnected == false) {
    RouteManagement.goToNetworkErrorView();
    return;
  }

  var serverHealth = await authService.checkServerHealth();
  AppUtility.log("ServerHealth: $serverHealth");

  if (serverHealth == null) {
    RouteManagement.goToWelcomeView();
  } else {
    if (serverHealth.toLowerCase() == "offline") {
      RouteManagement.goToServerOfflineView();
      return;
    }

    if (serverHealth.toLowerCase() == "maintenance") {
      RouteManagement.goToServerMaintenanceView();
      return;
    }
  }

  var token = authService.token;

  if (token.isEmpty) {
    if (RouteService.routeStatus != RouteStatus.notLoggedIn) {
      RouteManagement.goToWelcomeView();
    }
    return;
  }

  var tokenValid = await authService.validateToken(token);

  if (tokenValid == null) {
    RouteManagement.gotToErrorView();
    return;
  }

  if (tokenValid == false) {
    await authService.deleteAllLocalDataAndCache();
    if (RouteService.routeStatus != RouteStatus.notLoggedIn) {
      RouteManagement.goToWelcomeView();
    }
    return;
  }

  if (tokenValid == true) {
    // RouteManagement.goToDo();
    // await PostController.find.getData();
  }

  AppUtility.log('Session Validated and Data Fetched');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  String _handleAppInitialRoute() {
    switch (RouteService.routeStatus) {
      case RouteStatus.init:
      case RouteStatus.notLoggedIn:
        return AppRoutes.welcome;
      case RouteStatus.error:
        return AppRoutes.error;
      case RouteStatus.noNetwork:
        return AppRoutes.noNetwork;
      case RouteStatus.serverOffline:
        return AppRoutes.offline;
      case RouteStatus.serverMaintenance:
        return AppRoutes.maintenance;
      case RouteStatus.loggedIn:
        return AppRoutes.lecturer;
      default:
        return AppRoutes.welcome;
    }
  }

  ThemeMode _handleAppTheme(String mode) {
    if (mode == kDarkMode) {
      return ThemeMode.dark;
    }
    if (mode == kLightMode) {
      return ThemeMode.light;
    }
    return ThemeMode.system;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NotesBloc()),
        BlocProvider(create: (context) => GeneralBloc()),
      ],
      child: GetBuilder<AppThemeController>(
        builder: (logic) => ScreenUtilInit(
          designSize: const Size(392, 744),
          builder: (ctx, child) => Expanded(
            child: GetMaterialApp(
              title: StringValues.appName,
              debugShowCheckedModeBanner: false,
              themeMode: _handleAppTheme(logic.themeMode),
              theme: logic.getLightThemeData(),
              darkTheme: logic.getDarkThemeData(),
              getPages: AppPages.pages,
              initialRoute: _handleAppInitialRoute(),
              translations: AppTranslation(),
              locale: Get.deviceLocale,
              fallbackLocale: const Locale('en'),
            ),
          ),
        ),
      ),
    );
  }
}
