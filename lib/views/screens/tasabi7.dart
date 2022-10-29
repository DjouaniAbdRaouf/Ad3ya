// ignore_for_file: must_be_immutable, camel_case_types

import 'package:ad3yati/controllers/azkarSalatController.dart';
import 'package:ad3yati/controllers/themeModeController.dart';
import 'package:ad3yati/views/widgets/AzkarCard.dart';
import 'package:ad3yati/views/widgets/appbar/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class tasabi7 extends StatelessWidget {
  tasabi7({Key? key}) : super(key: key);

  azkarSalatController controller = Get.put(azkarSalatController());
  themeController themecontroller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          backgroundColor: themecontroller.isDark.value
              ? Colors.black
              : Colors.grey.shade100,
          appBar: CostumAppbar(),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: ListView.builder(
                itemCount: controller.tasabi7.length,
                itemBuilder: (context, index) {
                  return AzkarCard(
                      douaa: controller.tasabi7[index]["content"],
                      num: controller.tasabi7[index]["count"]);
                }),
          ));
    });
  }
}
