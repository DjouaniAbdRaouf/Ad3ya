import 'package:ad3yati/controllers/ad3ya9oran.dart';
import 'package:ad3yati/controllers/themeModeController.dart';
import 'package:ad3yati/views/widgets/ad3yaCard.dart';
import 'package:ad3yati/views/widgets/appbar/appBar.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, invalid_use_of_protected_member, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ad3ya extends StatelessWidget {
  const Ad3ya({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controllerad3yaCoran controller = Get.put(controllerad3yaCoran());
    themeController themecontroller = Get.find();

    return Obx(() {
      return Scaffold(
          backgroundColor: themecontroller.isDark.value
              ? Colors.black.withOpacity(0.2)
              : Colors.grey.shade100,
          appBar: CostumAppbar(),
          body: Padding(
              padding: const EdgeInsets.all(12),
              child: ListView.builder(
                itemCount: controller.ad3yati.length,
                itemBuilder: ((context, index) {
                  return Ad3yadCard(
                    reference: controller.ad3yati.value[index]["reference"],
                    douaa: controller.ad3yati.value[index]["content"],
                    num: controller.ad3yati.value[index]["count"],
                  );
                }),
              )));
    });
  }
}
