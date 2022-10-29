// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, non_constant_identifier_names, unused_local_variable, file_names

import 'package:ad3yati/controllers/themeModeController.dart';
import 'package:ad3yati/themes/themes.dart';
import 'package:ad3yati/views/screens/9ibla.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar CostumAppbar() {
  themeController controller = Get.find();
  return AppBar(
    backgroundColor: controller.isDark.value ? Colors.grey.shade900 : color4,
    elevation: 0.0,
    actions: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Text("أدعيتي",
            style: GoogleFonts.rakkas(
                color: Colors.white,
                fontSize: 25,
                fontWeight: FontWeight.bold)),
      ),
      InkWell(
        onTap: () => Get.to(() => QiblaScreen()),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Image.asset(
            "assets/icons8_safari_64px.png",
            width: 35,
            height: 35,
          ),
        ),
      ),
      InkWell(onTap: () {
        controller.changeMode();
      }, child: Obx(() {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Icon(
            controller.isDark.value
                ? Icons.nightlight_round_rounded
                : Icons.sunny,
            color: Colors.white,
            size: 25,
          ),
        );
      })),
    ],
  );
}
