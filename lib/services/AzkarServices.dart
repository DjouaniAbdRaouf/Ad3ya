// ignore_for_file: file_names, unused_local_variable, avoid_print, non_constant_identifier_names, body_might_complete_normally_nullable

import 'dart:convert';

import 'package:flutter/services.dart';

class AzkarServices {
  static List<dynamic> ad3yas = [];
  static List<dynamic> Masa2 = [];

  static Ad3yasabah() async {
    var response = await rootBundle.loadString("assets/azkar.json");

    Map<String, dynamic> map = json.decode(response);

    List<dynamic> data = map["أذكار الصباح"];
    print(map);
    print(map.length);
    ad3yas = data;
    return data;
  }

  static Ad3yaMasa2() async {
    var response = await rootBundle.loadString("assets/azkar.json");

    Map<String, dynamic> map = json.decode(response);

    List<dynamic> data = map["أذكار المساء"];
    Masa2 = data;
    return data;
  }

  static Ad3yaSalet() async {
    var response = await rootBundle.loadString("assets/azkar.json");

    Map<String, dynamic> map = json.decode(response);

    List<dynamic> data = map["أذكار بعد السلام من الصلاة المفروضة"];
    Masa2 = data;
    return data;
  }

  static tasabi7() async {
    var response = await rootBundle.loadString("assets/azkar.json");

    Map<String, dynamic> map = json.decode(response);
    List<dynamic> data = map["تسابيح"];

    return data;
  }

  static nawm() async {
    var response = await rootBundle.loadString("assets/azkar.json");

    Map<String, dynamic> map = json.decode(response);
    List<dynamic> data = map["أذكار النوم"];

    return data;
  }

  static ad3ya() async {
    var response = await rootBundle.loadString("assets/azkar.json");

    Map<String, dynamic> map = json.decode(response);
    List<dynamic> data = map["أدعية قرآنية"];

    return data;
  }

  static anbya() async {
    var response = await rootBundle.loadString("assets/azkar.json");

    Map<String, dynamic> map = json.decode(response);
    List<dynamic> data = map["أدعية الأنبياء"];

    return data;
  }
}
