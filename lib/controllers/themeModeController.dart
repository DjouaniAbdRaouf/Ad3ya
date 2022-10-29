// ignore_for_file: camel_case_types, file_names, avoid_print

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class themeController extends GetxController {
  var isDark = false.obs;
  var themeActuel = GetStorage();

  @override
  void onInit() {
    if ((themeActuel.read("theme") != isDark.value) &&
        themeActuel.read("theme") != null) {
      isDark.value = true;
    }
    super.onInit();
  }

  void changeMode() {
    isDark.value = !isDark.value;
    themeActuel.write('theme', isDark.value);
    print("theme changed" + themeActuel.read("theme").toString());
  }
}
