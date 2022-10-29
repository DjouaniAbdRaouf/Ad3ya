// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, must_be_immutable

import 'package:ad3yati/controllers/themeModeController.dart';
import 'package:ad3yati/themes/themes.dart';
import 'package:ad3yati/views/screens/9ibla.dart';
import 'package:ad3yati/views/screens/AwkatSalat.dart';
import 'package:ad3yati/views/screens/AzkarMasa2.dart';
import 'package:ad3yati/views/screens/AzkarSabah.dart';
import 'package:ad3yati/views/screens/ad3ya.dart';
import 'package:ad3yati/views/screens/azkarSalat.dart';
import 'package:ad3yati/views/screens/azkarnawm.dart';
import 'package:ad3yati/views/screens/setting.dart';
import 'package:ad3yati/views/screens/tasabi7.dart';
import 'package:ad3yati/views/widgets/cardItems.dart';
import 'package:ad3yati/views/widgets/carditem2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  themeController controller = Get.put(themeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: controller.isDark.value
            ? Color.fromARGB(255, 29, 26, 26)
            : Colors.white,
        appBar: AppBar(
          backgroundColor:
              controller.isDark.value ? Colors.grey.shade900 : color4,
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Text("أدعيتي",
                  style: GoogleFonts.rakkas(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ),
            InkWell(
              onTap: () {
                Get.to(() => QiblaScreen());
              },
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                child: Image.asset(
                  "assets/icons8_safari_64px.png",
                  width: 35,
                  height: 35,
                ),
              ),
            ),
            Obx(() {
              return InkWell(
                onTap: () {
                  controller.changeMode();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                  child: Icon(
                    controller.isDark.value
                        ? Icons.nightlight_round_rounded
                        : Icons.sunny,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              );
            })
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(8.0),
          child: GridView(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15),
            children: [
              InkWell(
                  onTap: () {
                    Get.to(() => AzkarSabah());
                  },
                  child: cardItem(icon: Icons.sunny, label: "أذكآر صبآح ")),
              InkWell(
                  onTap: () {
                    Get.to(() => AzkarMasa2());
                  },
                  child:
                      cardItem(icon: Icons.shield_moon, label: "أذكار المسآء")),
              InkWell(
                  onTap: () {
                    Get.to(() => AzkarSalat());
                  },
                  child:
                      cardItem(icon: Icons.person, label: "آذكار بعد الصلاة ")),
              InkWell(
                  onTap: () => Get.to(() => tasabi7()),
                  child: cardItem(icon: Icons.menu_book, label: "تسابيح")),
              InkWell(
                  onTap: () => Get.to(() => AzkarNawm()),
                  child: cardItem(icon: Icons.bed, label: "أذكار النوم ")),
              InkWell(
                  onTap: () => Get.to(() => Ad3ya()),
                  child: cardItem(icon: Icons.mosque, label: "أدعية قرآنية")),
              InkWell(
                  onTap: (() => Get.to(() => AwkatSalat())),
                  child: carditem2(
                      path: "assets/icons8_prayer_50px.png",
                      label: " مواقيت الصلاة")),
              InkWell(
                  onTap: () => Get.to(() => Settings()),
                  child: cardItem(icon: Icons.settings, label: "إعدادات")),
            ],
          ),
        )),
      );
    });
  }
}
