// ignore_for_file: prefer_const_constructors, file_names, prefer_const_literals_to_create_immutables

import 'package:ad3yati/views/screens/AwkatSalat.dart';
import 'package:ad3yati/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContainerLocation extends StatelessWidget {
  const ContainerLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        height: 120,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade800),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Text(
                "Il faut autoriser l'application d'utiliser votre Localisation pour calculer les heures de Salat",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: EdgeInsets.only(right: 10, bottom: 5),
                child: Text(
                  "Refresh",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 0, right: 10),
                  child: InkWell(
                    onTap: () {
                      Get.to(() => HomeScreen());
                      Get.to(() => AwkatSalat());
                    },
                    child: Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
