import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:tour_app/ui/route/onboarding.dart';
import 'package:tour_app/ui/route/splash.dart';

import '../../main.dart';

const String splash = '/Splash';
const String onboarding = '/Onboarding';

List<GetPage> getPages = [
  GetPage(name: splash, page: () => const Splash()),
   GetPage(name: onboarding, page: () => Onboarding()),
];
