// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables, file_names

import 'package:ad3yati/services/AzkarServices.dart';
import 'package:get/get.dart';

class azkarSalatController extends GetxController {
  var azkarSalat = [].obs;
  var tasabi7 = [].obs;
  var azkarnam = [].obs;

  @override
  void onInit() {
    super.onInit();
    AzkarServices.Ad3yaSalet().then((value) {
      azkarSalat.value = value;
    });
    AzkarServices.tasabi7().then((value) {
      tasabi7.value = value;
    });
    AzkarServices.nawm().then((value) {
      azkarnam.value = value;
    });
  }
}
