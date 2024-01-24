import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tour_app/ui/route/onboarding.dart';
import 'package:tour_app/ui/route/splash.dart';
import 'package:tour_app/ui/views/auth/sign_in.dart';
import 'package:tour_app/ui/views/bottom_nav_pages/bottom_nav_controller.dart';
import 'package:tour_app/ui/views/bottom_nav_pages/detail_screen.dart';
import 'package:tour_app/ui/views/bottom_nav_pages/pages/navAddLastStep.dart';
import 'package:tour_app/ui/views/bottom_nav_pages/pages/nav_add.dart';
import 'package:tour_app/ui/views/bottom_nav_pages/pages/nav_favourite.dart';
import 'package:tour_app/ui/views/bottom_nav_pages/pages/nav_home.dart';
import 'package:tour_app/ui/views/drawer_pages/faq.dart';
import 'package:tour_app/ui/views/drawer_pages/how_to_use.dart';
import 'package:tour_app/ui/views/drawer_pages/privacy.dart';
import 'package:tour_app/ui/views/drawer_pages/profile.dart';
import 'package:tour_app/ui/views/drawer_pages/rate_us.dart';
import 'package:tour_app/ui/views/drawer_pages/settings.dart';
import 'package:tour_app/ui/views/drawer_pages/support.dart';
import 'package:tour_app/ui/views/drawer_screen.dart';
import 'package:tour_app/business_logic/form.dart';
import 'package:tour_app/ui/views/home.dart';

import '../../main.dart';
import '../views/auth/sign_up.dart';
import '../views/bottom_nav_pages/pages/navAddLastStep.dart';
import '../views/bottom_nav_pages/search_screen.dart';
import '../views/bottom_nav_pages/see_all.dart';
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
const String navadd = '/navadd';
const String navhome = '/navhome';
const String navfavourite = '/navfavourite';
const String faq = '/faq';
const String settings = '/settings';
const String privacy = '/privacy';
const String support = '/support';
const String howtouse = '/howtouse';
// const String rateus = '/rateus';
const String detailsScreen = '/detailsScreen';
const String searchScreen = '/rateus';
const String profileScreen = '/rateus';
const String navAddLastStep = '/rateus';
const String seeAllScreen = '/seeall';

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
  GetPage(name: navhome, page: () => NavHome()),
  GetPage(name: navadd, page: () => NavAdd()),
  GetPage(name: navfavourite, page: () => NavFavourite()),
  GetPage(name: faq, page: () => FAQ()),
  GetPage(name: settings, page: () => Settings_page()),
  GetPage(name: privacy, page: () => Privacy()),
  GetPage(name: support, page: () => Support()),
  GetPage(name: howtouse, page: () => How_to_use()),
  // GetPage(name: rateus, page: () => RateUs()),
  GetPage(name: searchScreen, page: () => SearchScreen()),
  GetPage(name: profileScreen, page: () => UserProfile()),
  GetPage(
    name: detailsScreen,
    page: () {
      DetailsScreen _detailsSCreen = Get.arguments;
      return _detailsSCreen;
    },
  ),

  GetPage(
    name: seeAllScreen,
    page: () {
      SeeAll _seeAll = Get.arguments;
      return _seeAll;
    },
  ),

  GetPage(
      name: navAddLastStep,
      page: () {
        NavAddLastStep _addLastStep = Get.arguments;
        return _addLastStep;
      }),
];
