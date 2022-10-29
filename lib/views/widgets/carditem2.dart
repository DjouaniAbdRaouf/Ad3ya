// ignore_for_file: prefer_const_constructors, camel_case_types, prefer_const_literals_to_create_immutables, file_names

import 'package:ad3yati/controllers/themeModeController.dart';
import 'package:ad3yati/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class carditem2 extends StatelessWidget {
  const carditem2({Key? key, required this.path, required this.label})
      : super(key: key);

  final String path;
  final String label;

  @override
  Widget build(BuildContext context) {
    themeController themecontroller = Get.find();

    return Obx(() {
      return Padding(
        padding: EdgeInsets.all(15),
        child: Card(
          shadowColor:
              themecontroller.isDark.value ? Colors.black : Colors.white,
          elevation: 6.0,
          child: Container(
            height: 200,
            width: 150,
            decoration: BoxDecoration(
              color: themecontroller.isDark.value
                  ? Colors.black.withOpacity(0.8)
                  : Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  path,
                  color: themecontroller.isDark.value ? Colors.white : color3,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(label,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.almarai(
                        color: themecontroller.isDark.value
                            ? Colors.white
                            : color4,
                        fontSize: 22,
                        fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ),
      );
    });
  }
}
