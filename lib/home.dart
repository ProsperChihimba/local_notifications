import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:local_notifications/services/local_notification.dart';
import 'package:local_notifications/services/notification_contoller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then(
      (isAllowed) {
        if (!isAllowed) {
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      },
    );

    NotificationController.initializeNotificationsEventListeners();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          //
          child: ElevatedButton(
            onPressed: () =>
                LocalNotification.showNotificationWithActionButtons(
              11,
            ),
            child: Text("Action Notification"),
          ),
        ),
      ),
    );
  }
}
