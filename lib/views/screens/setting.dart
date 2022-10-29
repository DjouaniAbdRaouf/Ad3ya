// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:ad3yati/controllers/themeModeController.dart';
import 'package:ad3yati/themes/themes.dart';
import 'package:ad3yati/views/widgets/appbar/appBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    themeController controller = Get.find();

    return Obx(() {
      return Scaffold(
        backgroundColor: Colors.grey.shade100,
        appBar: CostumAppbar(),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          color: controller.isDark.value
              ? const Color.fromARGB(255, 29, 26, 26)
              : Colors.white,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              ListTile(
                title: Text(
                  "Change Actuel Mode :",
                  style: TextStyle(
                      color: controller.isDark.value ? Colors.white : color4,
                      fontSize: 18),
                ),
                trailing: Switch(
                  value: controller.isDark.value,
                  onChanged: (value) {
                    controller.isDark.value = value;
                  },
                  activeColor: Colors.green,
                  inactiveThumbColor: color4,
                ),
              ),
              ListTile(
                  title: Text(
                    "Contact us :",
                    style: TextStyle(
                        color: controller.isDark.value ? Colors.white : color4,
                        fontSize: 18),
                  ),
                  trailing: Text(
                    "rdjouani6@gmail.com",
                    style: TextStyle(
                        color: controller.isDark.value ? Colors.white : color4,
                        fontSize: 18),
                  )),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.facebook,
                    size: 26,
                    color: controller.isDark.value ? Colors.white : color4,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.email,
                    size: 26,
                    color: controller.isDark.value ? Colors.white : color4,
                  )
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Copyright 2022 by Djouani abd Raouf",
                    style: TextStyle(
                        color: controller.isDark.value ? Colors.white : color4,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ))
            ],
          ),
        ),
      );
    });
  }
}
