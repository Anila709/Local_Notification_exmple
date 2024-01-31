import 'dart:io';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  //create object of local notification.
  var notificationManager = FlutterLocalNotificationsPlugin();

  //initializing notification manager..
  initializeNotificationManager() {
    var initSettings = InitializationSettings(
      android: AndroidInitializationSettings('hacker'),
      iOS: DarwinInitializationSettings(),
      macOS: DarwinInitializationSettings(),
    );

    notificationManager.initialize(initSettings);
    if (Platform.isAndroid) {
      notificationManager
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()!
          .requestNotificationsPermission();
    }
  }

  sendNotification({required int id, required String title, String? subTitle}) {
    var notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails("test", "send notification"),
      iOS: DarwinNotificationDetails(),
      macOS: DarwinNotificationDetails(),
    );
    notificationManager.show(id, title, subTitle, notificationDetails);
  }
}
