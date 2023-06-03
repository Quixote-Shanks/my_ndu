import 'package:get/get.dart';
import 'package:my_ndu/translations/en_US/en_us_translations.dart';
import 'package:my_ndu/translations/hi_IN/hi_in_translations.dart';

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': enUs,
        'hi': hiIn,
      };
}
