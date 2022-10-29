// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_local_variable, avoid_print, file_names, unused_element, body_might_complete_normally_nullable, non_constant_identifier_names

import 'package:ad3yati/controllers/themeModeController.dart';
import 'package:ad3yati/models/prayerModel.dart';
import 'package:ad3yati/services/norificationServices.dart';
import 'package:ad3yati/themes/themes.dart';
import 'package:ad3yati/views/widgets/appbar/appBar.dart';
import 'package:ad3yati/views/widgets/costumWidget/awkatSalatcontainer.dart';
import 'package:ad3yati/views/widgets/costumWidget/containerLocation.dart';
import 'package:ad3yati/views/widgets/costumWidget/costumStack.dart';
import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart';

class AwkatSalat extends StatefulWidget {
  const AwkatSalat({Key? key}) : super(key: key);

  @override
  State<AwkatSalat> createState() => _AwkatSalatState();
}

class _AwkatSalatState extends State<AwkatSalat> {
  bool laoding = true;
  late final NotificationApi service;
  final location = Location();
  String? locationError;
  PrayerTimes? prayerTimes;
  PrayerModel? prayerModel;

  PrayerModel? getTimeofSalat(PrayerTimes prayerTimes) {
    var datetime = DateTime.now();

    print(
        datetime.toString() + "  -*-*-*-*-*-*-*" + prayerTimes.fajr.toString());

    if (datetime.isBefore(prayerTimes.isha) &&
        datetime.isAfter(prayerTimes.maghrib)) {
      //fajr
      print("isha");
      return PrayerModel(salat: Prayer.isha.name, waktsalat: prayerTimes.isha);
    } else if (datetime.isBefore(prayerTimes.dhuhr) &&
        datetime.isAfter(prayerTimes.fajr)) {
      //duhr
      print("duhr");
      return PrayerModel(
          salat: Prayer.dhuhr.name, waktsalat: prayerTimes.dhuhr);
    } else if (datetime.isBefore(prayerTimes.asr) &&
        datetime.isAfter(prayerTimes.dhuhr)) {
      //asr
      print("asr");
      return PrayerModel(salat: Prayer.asr.name, waktsalat: prayerTimes.asr);
    } else if (datetime.isBefore(prayerTimes.maghrib) &&
        datetime.isAfter(prayerTimes.asr)) {
      //maghrib
      print("maghrib");
      return PrayerModel(
          salat: Prayer.maghrib.name, waktsalat: prayerTimes.maghrib);
    } else {
      //isha
      print("fajr");
      return PrayerModel(salat: Prayer.fajr.name, waktsalat: prayerTimes.fajr);
    }
  }

  Future<LocationData?> getLocationData() async {
    var _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    var _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    return await location.getLocation();
  }

  @override
  void initState() {
    getLocationData().then((locationData) {
      if (!mounted) {
        return;
      }
      if (locationData != null) {
        setState(() {
          Coordinates coordinates =
              Coordinates(locationData.latitude!, locationData.longitude!);
          prayerTimes = PrayerTimes(
              Coordinates(locationData.latitude!, locationData.longitude!),
              DateComponents.from(DateTime.now()),
              CalculationMethod.karachi.getParameters());
          Qibla qibla = Qibla(coordinates);
          double direction = qibla.direction;

          print(prayerTimes!.asr);
          prayerModel = getTimeofSalat(prayerTimes!);

          laoding = false;
        });
      } else {
        setState(() {
          locationError = "Couldn't Get Your Location!";
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    themeController controller = Get.find();
    return Obx(() {
      return Scaffold(
        backgroundColor: controller.isDark.value
            ? Color.fromARGB(255, 29, 26, 26)
            : Colors.white,
        appBar: CostumAppbar(),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(18),
              child: !laoding
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        StackSalat(prayerModel: getTimeofSalat(prayerTimes!)!),
                        SizedBox(
                          height: 10,
                        ),
                        ContainerLocation(),
                        SizedBox(
                          height: 10,
                        ),
                        AwkatSalatcontainer(
                          prayerTimes: prayerTimes!,
                        )
                      ],
                    )
                  : Center(
                      child: CircularProgressIndicator(
                      color: color4,
                    ))),
        ),
      );
    });
  }
}
