// ignore_for_file: file_names, empty_constructor_bodies, unnecessary_overrides, avoid_types_as_parameter_names, non_constant_identifier_names

import 'package:ad3yati/services/AzkarServices.dart';
import 'package:get/get.dart';

class AzkarController extends GetxController {
  var ad3yaList = [].obs;
  var ad3yamasa2 = [].obs;

  @override
  void onInit() {
    super.onInit();
    AzkarServices.Ad3yasabah().then((value) {
      ad3yaList.value = value;
    });

    AzkarServices.Ad3yaMasa2().then((Value) {
      ad3yamasa2.value = Value;
    });
  }
}
