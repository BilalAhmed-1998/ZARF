import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings('ref9'));
    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String payload) {
      print(payload);
    });
  }

  static void showNotificationOnForeground(RemoteMessage message) {
    _notificationsPlugin.show(
        DateTime.now().microsecond,
        message.notification.title,
        message.notification.body,
        NotificationDetails(
            android: AndroidNotificationDetails("com.example.zarf", "zarf",
                importance: Importance.max, priority: Priority.high,

            icon: 'ref9',
            largeIcon: DrawableResourceAndroidBitmap('ref9'))));

  }
}
