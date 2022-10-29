// ignore_for_file: prefer_const_constructors, unused_import, avoid_print

import 'dart:math';

import 'package:ad3yati/StaticVar/StaticVarClass.dart';
import 'package:ad3yati/services/norificationServices.dart';
import 'package:ad3yati/views/screens/AwkatSalat.dart';
import 'package:ad3yati/views/screens/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;

import 'package:get_storage/get_storage.dart';
import 'package:timezone/data/latest_all.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationApi service;
  await GetStorage.init();
  service = NotificationApi();
  service.initialize();
  int rndmIndex = Random().nextInt(StaticVars().smallDo3a2.length - 1);
  NotificationApi.DailyNotifications(
    id: rndmIndex,
    title: "أدعيتي",
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ad3yati',
      home: splashscreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
