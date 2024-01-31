import 'package:flutter/material.dart';
import 'package:local_notification_example/notification_service.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationService? notiService;

  @override
  void initState() {
    super.initState();
    notiService=NotificationService();
    notiService!.initializeNotificationManager();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('notificaton page')),
      body: Center(child: ElevatedButton(
        onPressed: () {
          notiService!.sendNotification(id: 1, title: "new msg",subTitle: "this is a new msg!!");
        },
        child: Text('notify'),)),
    );
  }
}