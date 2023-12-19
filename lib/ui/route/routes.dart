import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tour_app/ui/route/onboarding.dart';
import 'package:tour_app/ui/route/splash.dart';
import 'package:tour_app/ui/views/auth/sign_in.dart';
import 'package:tour_app/ui/views/bottom_nav_controller.dart';
import 'package:tour_app/ui/views/drawer_screen.dart';
import 'package:tour_app/business_logic/form.dart';
import 'package:tour_app/ui/views/home.dart';

import '../../main.dart';
import '../views/auth/sign_up.dart';
import '../views/privecy_policy.dart';
import '../views/user_form.dart';

const String splash = '/Splash';
const String onboarding = '/Onboarding';
const String signup = '/signup';
const String userform = '/userForm';
const String signin = '/signin';
const String DrawerScreen = '/drawer';
const String privacypolicy = '/privacypolicy';
const String bottomNavController = '/bottomNavController';
const String UserInfo = '/userinfo';
const String homepage = '/homepage';

List<GetPage> getPages = [
  GetPage(name: splash, page: () => const Splash()),
  GetPage(name: onboarding, page: () => Onboarding()),
  GetPage(name: signup, page: () => SignUp()),
  GetPage(name: userform, page: () => User_form()),
  GetPage(name: signin, page: () => SignIn()),
  GetPage(name: privacypolicy, page: () => PrivacyPolicy()),
  GetPage(name: bottomNavController, page: () => BottomNavController()),
  // GetPage(name: UserInfo, page: () => User_Info()),
  GetPage(name: DrawerScreen, page: () => Drawer_Screen()),

  GetPage(name: homepage, page: () => HomePage()),
];
