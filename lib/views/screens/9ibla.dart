// ignore_for_file: file_names, non_constant_identifier_names, prefer_typing_uninitialized_variables, avoid_print, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';

class QiblaScreen extends StatefulWidget {
  const QiblaScreen({Key? key}) : super(key: key);

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen> {
  double? heading = 0;
  StreamSubscription? stream;
  @override
  void initState() {
    stream = FlutterCompass.events!.listen((event) {
      setState(() {
        heading = event.heading!;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    stream!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade900,
        title: const Text(
          'Qibla',
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Turn your phone when the degree is between 70° ans 80°",
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(
            height: 50,
          ),
          Text(
            "Degree is :  ${heading!.ceil()}°",
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Image.asset('assets/images/cadrant.png'),
                    Transform.rotate(
                      angle: ((heading ?? 0) * (pi / 180) * -1),
                      child: Image.asset(
                        'assets/images/compass.png',
                        scale: 1.1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                heading! > 70 && heading! < 80
                    ? Container(
                        alignment: Alignment.center,
                        width: 200,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20)),
                        child: Text(
                          "Qibla Direction sucess ",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                              fontSize: 17),
                        ),
                      )
                    : Text("")
              ],
            ),
          ),
        ],
      ),
    );
  }
}
