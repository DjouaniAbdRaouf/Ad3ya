// ignore_for_file: prefer_const_constructors, must_be_immutable, file_names

import 'package:ad3yati/controllers/azkarSalatController.dart';
import 'package:ad3yati/controllers/themeModeController.dart';
import 'package:ad3yati/views/widgets/AzkarCard.dart';
import 'package:ad3yati/views/widgets/appbar/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AzkarSalat extends StatelessWidget {
  AzkarSalat({Key? key}) : super(key: key);

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
              padding: EdgeInsets.all(12),
              child: ListView.builder(
                itemCount: controller.azkarSalat.length,
                itemBuilder: ((context, index) {
                  return AzkarCard(
                      douaa: controller.azkarSalat[index]['content'],
                      num: controller.azkarSalat[index]['count']);
                }),
              )));
    });
  }
}
