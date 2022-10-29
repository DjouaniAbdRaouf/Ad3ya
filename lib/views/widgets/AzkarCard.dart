// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, file_names

import 'package:ad3yati/controllers/themeModeController.dart';
import 'package:ad3yati/themes/themes.dart';
import 'package:ad3yati/views/widgets/TextUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AzkarCard extends StatelessWidget {
  const AzkarCard({Key? key, required this.douaa, required this.num})
      : super(key: key);
  final String douaa;
  final String num;
  @override
  Widget build(BuildContext context) {
    themeController themecontroller = Get.find();

    return Obx(() {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 6.0,
          shadowColor: Colors.grey.withOpacity(0.8),
          child: Container(
            height: 400,
            width: double.infinity,
            decoration: BoxDecoration(
              color: themecontroller.isDark.value
                  ? Colors.black.withOpacity(0.8)
                  : Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextUtilsalmarai(
                    label: "بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                    color: themecontroller.isDark.value ? Colors.white : color4,
                    fontWeight: FontWeight.bold,
                    fontSize: 28),
                SizedBox(
                  height: 30,
                ),
                TextUtilsalmarai(
                    label: douaa,
                    color: themecontroller.isDark.value ? Colors.white : color4,
                    fontWeight: FontWeight.normal,
                    fontSize: 25),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextUtilsalmarai(
                          label: num.toString(),
                          color: themecontroller.isDark.value
                              ? Colors.white
                              : color4,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                      SizedBox(
                        width: 5,
                      ),
                      TextUtilsalmarai(
                          label: ": مرات",
                          color: themecontroller.isDark.value
                              ? Colors.white
                              : color4,
                          fontWeight: FontWeight.w400,
                          fontSize: 10),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
