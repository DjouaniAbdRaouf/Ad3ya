// ignore_for_file: file_names, non_constant_identifier_names, unused_field, prefer_const_constructors, unused_element

import 'dart:math';
import 'package:ad3yati/StaticVar/StaticVarClass.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationApi {
  static final _Notificaitons = FlutterLocalNotificationsPlugin();

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    _Notificaitons.show(
      id,
      title,
      body,
      await notificationDetails(),
      payload: payload,
    );
  }

  Future<void> initialize() async {
    tz.initializeTimeZones();
    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings("@mipmap/ic_launcher");
    const IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings();

    final InitializationSettings settings = InitializationSettings(
        android: androidInitializationSettings, iOS: iosInitializationSettings);
    await _Notificaitons.initialize(settings);
  }

  static Future<void> showNotificationWithNoBody() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
            'your channel id', 'your channel name', 'your channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: 'ticker');
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await _Notificaitons.show(0, 'plain title', null, platformChannelSpecifics,
        payload: 'item x');
  }

  static Future sheduleNotifications(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      required int sec}) async {
    _Notificaitons.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(DateTime.now().add(Duration(minutes: 1)), tz.local),
      await notificationDetails(),
      payload: payload,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      androidAllowWhileIdle: true,
    );
  }

  static Future DailyNotifications({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    _Notificaitons.periodicallyShow(
      id,
      title,
      StaticVars()
          .smallDo3a2[Random().nextInt(StaticVars().smallDo3a2.length - 1)],
      RepeatInterval.everyMinute,
      await notificationDetails(),
      androidAllowWhileIdle: true,
    );
    // _Notificaitons.zonedSchedule(
    //   id,
    //   title,
    //   body,
    //   tz.TZDateTime.from(DateTime.now().add(Duration(days: 1)), tz.local),
    //   await notificationDetails(),
    //   payload: payload,
    //   uiLocalNotificationDateInterpretation:
    //       UILocalNotificationDateInterpretation.absoluteTime,
    //   androidAllowWhileIdle: true,
    // );
  }

  static Future notificationDetails() async {
    return NotificationDetails(
      iOS: IOSNotificationDetails(),
      android: AndroidNotificationDetails(
        "channel id",
        "channel name",
        "channel descreption",
        importance: Importance.max,
        priority: Priority.max,
        playSound: true,
        enableVibration: true,
        enableLights: true,
      ),
    );
  }
}
