// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, unused_local_variable, body_might_complete_normally_nullable, non_constant_identifier_names, prefer_typing_uninitialized_variables, must_be_immutable

import 'dart:async';

import 'package:ad3yati/controllers/themeModeController.dart';
import 'package:ad3yati/models/prayerModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class StackSalat extends StatefulWidget {
  final PrayerModel prayerModel;
  const StackSalat({Key? key, required this.prayerModel}) : super(key: key);

  @override
  State<StackSalat> createState() => _StackSalatState();
}

class _StackSalatState extends State<StackSalat> {
  final themeController themecontroller = Get.find();

  DateTime timeRemaining = DateTime.now();
  Timer? time;

  @override
  void initState() {
    time = Timer.periodic(Duration(seconds: 1), (time) {
      setState(() {
        timeRemaining = widget.prayerModel.waktsalat.subtract(Duration(
            hours: DateTime.now().hour > 12
                ? DateTime.now().hour - 12
                : DateTime.now().hour,
            minutes: DateTime.now().minute,
            seconds: DateTime.now().second));
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    time!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: themecontroller.isDark.value ? 0.6 : 1,
                  image: AssetImage("assets/2.jpg"),
                  fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          Positioned(
              bottom: 25,
              left: 25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "Salat El : " + widget.prayerModel.salat,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Text(
                        CovertDDteTime(widget.prayerModel.waktsalat),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "remainig :  " + CovertDDteTime(timeRemaining),
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                ],
              ))
        ],
      ),
    );
  }

  String CovertDDteTime(DateTime prayerTime) {
    String time = DateFormat('hh:mm:ss').format(prayerTime);
    return time;
  }
}
