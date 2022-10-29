// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, non_constant_identifier_names, file_names, unused_local_variable, avoid_print, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:adhan/adhan.dart';

class AwkatSalatcontainer extends StatefulWidget {
  final PrayerTimes prayerTimes;

  AwkatSalatcontainer({
    Key? key,
    required this.prayerTimes,
  }) : super(key: key);

  @override
  State<AwkatSalatcontainer> createState() => _AwkatSalatcontainerState();
}

class _AwkatSalatcontainerState extends State<AwkatSalatcontainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 260,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.grey.shade800, borderRadius: BorderRadius.circular(25)),
      child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              RowOfSalat(
                  salat: Prayer.fajr.name, wakt: widget.prayerTimes.fajr),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.white,
              ),
              RowOfSalat(
                  salat: Prayer.dhuhr.name, wakt: widget.prayerTimes.dhuhr),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.white,
              ),
              RowOfSalat(salat: Prayer.asr.name, wakt: widget.prayerTimes.asr),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.white,
              ),
              RowOfSalat(
                  salat: Prayer.maghrib.name, wakt: widget.prayerTimes.maghrib),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
                color: Colors.white,
              ),
              RowOfSalat(
                  salat: Prayer.isha.name, wakt: widget.prayerTimes.isha),
            ],
          )),
    );
  }

  Widget RowOfSalat({required String salat, required DateTime wakt}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.timer,
              color: Colors.white,
            ),
            SizedBox(
              width: 20,
            ),
            Text(salat,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600))
          ],
        ),
        Text(DateFormat.jm().format(wakt),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600))
      ],
    );
  }
}
