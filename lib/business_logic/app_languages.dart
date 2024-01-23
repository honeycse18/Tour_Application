import 'package:get/get.dart';
import 'package:tour_app/ui/languages/eng.dart';

import '../ui/languages/ban.dart';

class AppLanguages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': eng,
        'bn_BD': ban,
      };
}
