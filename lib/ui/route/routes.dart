import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tour_app/ui/route/onboarding.dart';
import 'package:tour_app/ui/route/splash.dart';
import 'package:tour_app/ui/views/auth/sign_in.dart';

import '../../main.dart';
import '../views/auth/sign_up.dart';
import '../views/privecy_policy.dart';
import '../views/user_form.dart';

const String splash = '/Splash';
const String onboarding = '/Onboarding';
const String signup = '/signup';
const String userform = '/userForm';
const String signin = '/signin';
const String privacypolicy = '/privacypolicy';

List<GetPage> getPages = [
  GetPage(name: splash, page: () => const Splash()),
  GetPage(name: onboarding, page: () => Onboarding()),
  GetPage(name: signup, page: () => SignUp()),
  GetPage(name: userform, page: () => User_form()),
  GetPage(name: signin, page: () => SignIn()),
  GetPage(name: privacypolicy, page: () => PrivacyPolicy()),
];
