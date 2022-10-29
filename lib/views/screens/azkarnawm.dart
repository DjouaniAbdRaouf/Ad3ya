import 'package:ad3yati/controllers/azkarSalatController.dart';
import 'package:ad3yati/controllers/themeModeController.dart';
import 'package:ad3yati/views/widgets/AzkarCard.dart';
import 'package:ad3yati/views/widgets/appbar/appBar.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, invalid_use_of_protected_member, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AzkarNawm extends StatelessWidget {
  AzkarNawm({Key? key}) : super(key: key);

  azkarSalatController controller = Get.put(azkarSalatController());

  @override
  Widget build(BuildContext context) {
    azkarSalatController controller = Get.put(azkarSalatController());
    themeController themecontroller = Get.find();

    return Obx(() {
      return Scaffold(
          backgroundColor: themecontroller.isDark.value
              ? Colors.black
              : Colors.grey.shade100,
          appBar: CostumAppbar(),
          body: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                itemCount: controller.azkarnam.length,
                itemBuilder: ((context, index) {
                  return AzkarCard(
                    douaa: controller.azkarnam.value[index]["content"],
                    num: controller.azkarnam.value[index]["count"],
                  );
                }),
              )));
    });
  }
}
