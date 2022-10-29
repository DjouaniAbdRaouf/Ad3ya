// ignore_for_file: camel_case_types

import 'package:ad3yati/services/AzkarServices.dart';
import 'package:get/get.dart';

class controllerad3yaCoran extends GetxController {
  var ad3yati = [].obs;
  var anbya = [].obs;

  @override
  void onInit() {
    super.onInit();
    AzkarServices.ad3ya().then((value) {
      ad3yati.value = value;
    });
    AzkarServices.anbya().then((value) {
      anbya.value = value;
    });
  }
}
