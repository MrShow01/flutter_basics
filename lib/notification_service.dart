import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessageBackgroundHandle(RemoteMessage message) async {
  log("BackGround Message :: ${message.from}");
}

class NotificationService {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  initInfo() async {
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    var request = await FirebaseMessaging.instance.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (request.authorizationStatus == AuthorizationStatus.authorized ||
        request.authorizationStatus == AuthorizationStatus.provisional) {
      const AndroidInitializationSettings initializationSettingsAndroid =
          AndroidInitializationSettings('@mipmap/ic_launcher');
      var iosInitializationSettings = const DarwinInitializationSettings();
      final InitializationSettings initializationSettings =
          InitializationSettings(
              android: initializationSettingsAndroid,
              iOS: iosInitializationSettings);
      await flutterLocalNotificationsPlugin.initialize(initializationSettings,
          onDidReceiveNotificationResponse: (payload) {
        log("::::::::onDidReceiveNotificationResponse:::::::::::");
        log(payload.payload.toString());
        log(payload.notificationResponseType.toString());
        log(payload.input.toString());
        log(payload.id.toString());
        log(payload.actionId.toString());
      });
      setupInteractedMessage();
    }
  }

  Future<void> setupInteractedMessage() async {
    //  await FirebaseMessaging.instance.subscribeToTopic("your_topic_name");
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();
    if (initialMessage != null) {
      FirebaseMessaging.onBackgroundMessage(
          (message) => firebaseMessageBackgroundHandle(message));
    }

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log("::::::::::::onMessage:::::::::::::::::");
      if (message.notification != null) {
        log(message.notification.toString());
        log(message.notification!.title.toString());
        log(message.notification!.body.toString());
        log(message.notification!.apple.toString());
        log(message.notification!.android.toString());
        log(message.notification!.android.toString());
        log(message.data.toString());
        log(message.category.toString());
        log(message.from.toString());
        log(message.messageType.toString());
        display(message);
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      log("::::::::::::onMessageOpenedApp:::::::::::::::::");
      if (message.notification != null) {
        log(message.notification.toString());
        log(message.notification!.title.toString());
        log(message.notification!.body.toString());
        log(message.notification!.apple.toString());
        log(message.notification!.android.toString());
        log(message.notification!.android.toString());
        log(message.data.toString());
        log(message.category.toString());
        log(message.from.toString());
        log(message.messageType.toString());
        navigatorKey.currentState?.pushNamed('/page3');
        // display(message);
      }
    });
  }

  static getToken() async {
    String? token;
    if (Platform.isIOS) {
      token = await FirebaseMessaging.instance.getAPNSToken();
    } else {
      token = await FirebaseMessaging.instance.getToken();
    }

    return token!;
  }

  void display(RemoteMessage message) async {
    log('Got a message whilst in the foreground!');
    log('Message data: ${message.notification!.body.toString()}');
    try {
      // final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      AndroidNotificationChannel channel = const AndroidNotificationChannel(
        '0',
        'customer',
        description: 'Show QuickLAI Notification',
        importance: Importance.high,
      );
      AndroidNotificationDetails notificationDetails =
          AndroidNotificationDetails(channel.id, channel.name,
              channelDescription: 'your channel Description',
              importance: Importance.high,
              priority: Priority.high,
              ticker: 'ticker');
      const DarwinNotificationDetails darwinNotificationDetails =
          DarwinNotificationDetails(
              presentAlert: true, presentBadge: true, presentSound: true);
      NotificationDetails notificationDetailsBoth = NotificationDetails(
          android: notificationDetails, iOS: darwinNotificationDetails);
      await FlutterLocalNotificationsPlugin().show(
        0,
        message.notification!.title,
        message.notification!.body,
        notificationDetailsBoth,
        payload: jsonEncode(message.data),
      );
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
