part of 'app_pages.dart';

abstract class AppRoutes {
  static const todo = _Routes.todo;
  static const studentRegistration = _Routes.studentRegistration;
  static const student = _Routes.student;
  static const studentdashboard = _Routes.studentdashboard;
  static const lecturer = _Routes.lecturer;
  static const aboutSettings = _Routes.aboutSettings;
  static const accountPrivacySettings = _Routes.accountPrivacySettings;
  static const accountSettings = _Routes.accountSettings;
  static const addCaption = _Routes.addCaption;
  static const appUpdate = _Routes.appUpdate;
  static const applyForBlueTickSettings = _Routes.applyForBlueTickSettings;
  static const applyForSelfVerifySettings = _Routes.applyForSelfVerifySettings;
  static const blockedUsersSettings = _Routes.blockedUsersSettings;
  static const blueTickVerification = _Routes.blueTickVerification;
  static const blueTickVerificationSettings =
      _Routes.blueTickVerificationSettings;
  static const blockUser = _Routes.blockUser;
  static const changeEmailSettings = _Routes.changeEmailSettings;
  static const changePassword = _Routes.changePassword;
  static const changePhoneSettings = _Routes.changePhoneSettings;
  static const chatDetails = _Routes.chatDetails;
  static const chatSettings = _Routes.chatSettings;
  static const chats = _Routes.chats;
  static const comments = _Routes.comments;
  static const commentsSettings = _Routes.commentsSettings;
  static const createPoll = _Routes.createPoll;
  static const createPost = _Routes.createPost;
  static const deactivateAccountSettings = _Routes.deactivateAccountSettings;
  static const editAbout = _Routes.editAbout;
  static const editDob = _Routes.editDob;
  static const editGender = _Routes.editGender;
  static const editLocation = _Routes.editLocation;
  static const editName = _Routes.editName;
  static const editPhone = _Routes.editPhone;
  static const editProfession = _Routes.editProfession;
  static const editProfile = _Routes.editProfile;
  static const editUsername = _Routes.editUsername;
  static const editWebsite = _Routes.editWebsite;
  static const error = _Routes.error;
  static const followRequests = _Routes.followRequests;
  static const followers = _Routes.followers;
  static const following = _Routes.following;
  static const forgotPassword = _Routes.forgotPassword;
  static const helpSettings = _Routes.helpSettings;
  static const home = _Routes.home;
  static const login = _Routes.login;
  static const loginActivitySettings = _Routes.loginActivitySettings;
  static const maintenance = _Routes.maintenance;
  static const momentsSettings = _Routes.momentsSettings;
  static const muteBlockPrivacySettings = _Routes.muteBlockPrivacySettings;
  static const noNetwork = _Routes.noNetwork;
  static const offline = _Routes.offline;
  static const onlineStatusSettings = _Routes.onlineStatusSettings;
  static const pollPreview = _Routes.pollPreview;
  static const postDetails = _Routes.postDetails;
  static const postLikedUsers = _Routes.postLikedUsers;
  static const postMediaView = _Routes.postMediaView;
  static const postPreview = _Routes.postPreview;
  static const postSettings = _Routes.postSettings;
  static const privacySettings = _Routes.privacySettings;
  static const profile = _Routes.profile;
  static const reactivateAccount = _Routes.reactivateAccount;
  static const register = _Routes.register;
  static const reportIssueSettings = _Routes.reportIssueSettings;
  static const reportIssue = _Routes.reportIssue;
  static const resetPassword = _Routes.resetPassword;
  static const securitySettings = _Routes.securitySettings;
  static const sendOtpToEmail = _Routes.sendOtpToEmail;
  static const sendOtpToPhone = _Routes.sendOtpToPhone;
  static const sendSuggestionsSettings = _Routes.sendSuggestionsSettings;
  static const sendVerifyAccountOtp = _Routes.sendVerifyAccountOtp;
  static const sendVerifyEmailOtp = _Routes.sendVerifyEmailOtp;
  static const splash = _Routes.splash;
  static const themeSettings = _Routes.themeSettings;
  static const twoFASettings = _Routes.twoFASettings;
  static const userProfile = _Routes.userProfile;
  static const verifyAccount = _Routes.verifyAccount;
  static const verifyEmail = _Routes.verifyEmail;
  static const verifyOtp = _Routes.verifyOtp;
  static const verifyPassword = _Routes.verifyPassword;
  static const welcome = _Routes.welcome;
}

abstract class _Routes {
  static const todo = "/todo";
  static const studentRegistration = "/studentRegistration";
  static const studentdashboard = "/studentdashboard";
  static const student = "/student";
  static const lecturer = "/lecturer";
  static const aboutSettings = "/about_settings";
  static const accountPrivacySettings = '/account_privacy_settings';
  static const accountSettings = "/account_settings";
  static const addCaption = '/add-caption';
  static const appUpdate = '/app_update';
  static const applyForBlueTickSettings = '/apply_for_blue_tick_settings';
  static const applyForSelfVerifySettings = '/apply_for_self_verify_settings';
  static const blockedUsersSettings = '/blocked_users_settings';
  static const blueTickVerification = "/blue_tick_verification";
  static const blueTickVerificationSettings =
      "/blue_tick_verification_settings";
  static const blockUser = '/block_user';
  static const changeEmailSettings = '/change_email_settings';
  static const changePassword = '/change_password';
  static const changePhoneSettings = '/change_phone_settings';
  static const chatDetails = '/chatDetails';
  static const chatSettings = '/chatSettings';
  static const chats = '/chats';
  static const comments = '/comments';
  static const commentsSettings = '/comments_settings';
  static const createPoll = '/create_poll';
  static const createPost = '/create_post';
  static const deactivateAccountSettings = '/deactivate_account_settings';
  static const editAbout = '/edit_about';
  static const editDob = '/edit_dob';
  static const editGender = '/edit_gender';
  static const editLocation = '/edit_location';
  static const editName = '/edit_name';
  static const editPhone = '/edit_phone';
  static const editProfession = '/edit_profession';
  static const editProfile = '/edit_profile';
  static const editUsername = '/edit_username';
  static const editWebsite = '/edit_website';
  static const error = '/error';
  static const followRequests = '/follow_requests';
  static const followers = '/followers';
  static const following = '/following';
  static const forgotPassword = '/forgot_password';
  static const helpSettings = "/help_settings";
  static const home = '/home';
  static const login = '/login';
  static const loginActivitySettings = '/login_activity_settings';
  static const maintenance = '/maintenance';
  static const momentsSettings = '/moments_settings';
  static const muteBlockPrivacySettings = '/mute_block_privacy_settings';
  static const noNetwork = '/no_network';
  static const offline = '/offline';
  static const onlineStatusSettings = '/online_status_settings';
  static const pollPreview = '/poll_preview';
  static const postDetails = '/post_details';
  static const postLikedUsers = '/post_liked_users';
  static const postMediaView = '/post_media_view';
  static const postPreview = '/postPreview';
  static const postSettings = '/post_settings';
  static const privacySettings = "/privacy_settings";
  static const profile = '/profile';
  static const reactivateAccount = '/reactivate_account';
  static const register = '/register';
  static const reportIssueSettings = '/report_issue_settings';
  static const reportIssue = '/report_issue';
  static const resetPassword = '/reset_password';
  static const securitySettings = "/security_settings";
  static const sendOtpToEmail = '/sendOtpToEmail';
  static const sendOtpToPhone = '/sendOtpToPhone';
  static const sendSuggestionsSettings = '/send_suggestions';
  static const sendVerifyAccountOtp = '/send_account_verification_otp';
  static const sendVerifyEmailOtp = '/send_email_verification_otp';
  static const splash = '/';
  static const themeSettings = "/theme_settings";
  static const twoFASettings = '/two_fa_settings';
  static const userProfile = '/user_profile';
  static const verifyAccount = '/verify_account';
  static const verifyEmail = '/verify_email';
  static const verifyOtp = '/verifyOtp';
  static const verifyPassword = '/verify_password';
  static const welcome = '/welcome';
  
}
