// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ad3yati/controllers/themeModeController.dart';
import 'package:ad3yati/themes/themes.dart';
import 'package:ad3yati/views/widgets/TextUtils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnbyaCard extends StatelessWidget {
  const AnbyaCard(
      {Key? key,
      required this.douaa,
      required this.num,
      required this.reference,
      required this.desc})
      : super(key: key);
  final String douaa, reference;
  final String num;
  final String desc;

  @override
  Widget build(BuildContext context) {
    themeController controller = Get.find();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: controller.isDark.value
            ? Colors.grey.withOpacity(0.1)
            : Colors.white,
        elevation: 6.0,
        shadowColor: Colors.grey.withOpacity(0.3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextUtilsalmarai(
                label: "بِسْمِ ٱللَّٰهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ",
                color: controller.isDark.value ? Colors.white : color4,
                fontWeight: FontWeight.bold,
                fontSize: 28),
            SizedBox(
              height: 30,
            ),
            TextUtilsalmarai(
                label: douaa,
                color: controller.isDark.value ? Colors.white : color4,
                fontWeight: FontWeight.normal,
                fontSize: 25),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextUtilsalmarai(
                      label: reference.toString(),
                      color: controller.isDark.value ? Colors.white : color4,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                  SizedBox(
                    width: 5,
                  ),
                  TextUtilsalmarai(
                      label: ": المصدر",
                      color: controller.isDark.value ? Colors.white : color4,
                      fontWeight: FontWeight.w400,
                      fontSize: 10),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextUtilsalmarai(
                      label: desc.toString(),
                      color: controller.isDark.value ? Colors.white : color4,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                  SizedBox(
                    width: 5,
                  ),
                  TextUtilsalmarai(
                      label: ": الوصف",
                      color: controller.isDark.value ? Colors.white : color4,
                      fontWeight: FontWeight.w400,
                      fontSize: 10),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextUtilsalmarai(
                      label: num.toString(),
                      color: controller.isDark.value ? Colors.white : color4,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                  SizedBox(
                    width: 5,
                  ),
                  TextUtilsalmarai(
                      label: ": مرات",
                      color: controller.isDark.value ? Colors.white : color4,
                      fontWeight: FontWeight.w400,
                      fontSize: 10),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
