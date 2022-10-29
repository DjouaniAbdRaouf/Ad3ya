// ignore_for_file: file_names

import 'package:ad3yati/controllers/AzkaarController.dart';
import 'package:ad3yati/controllers/themeModeController.dart';
import 'package:ad3yati/views/widgets/AzkarCard.dart';
import 'package:ad3yati/views/widgets/appbar/appBar.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, invalid_use_of_protected_member, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AzkarMasa2 extends StatelessWidget {
  const AzkarMasa2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AzkarController controller = Get.put(AzkarController());
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
                itemCount: controller.ad3yamasa2.length,
                itemBuilder: ((context, index) {
                  return AzkarCard(
                    douaa: controller.ad3yamasa2.value[index]["content"],
                    num: controller.ad3yamasa2.value[index]["count"],
                  );
                }),
              )));
    });
  }
}
