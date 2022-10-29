// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:ad3yati/themes/themes.dart';
import 'package:ad3yati/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({Key? key}) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () => Get.off(() => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color4,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 40,
              ),
              Text("أدعيتي",
                  style: GoogleFonts.rakkas(
                      color: color1,
                      fontSize: 60,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 100,
              ),
              SizedBox(
                width: 200,
                child: LinearProgressIndicator(
                  minHeight: 4,
                  color: color2,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
