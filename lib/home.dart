import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

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

    super.initState();
  }

  // send notification
  void triggerNotification() {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 3,
          channelKey: 'basic_channel',
          title: "Proc notification",
          body: "Hey awesome prosper",
          bigPicture:
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrRMHThLy0_Kq7eU7AwuhDoOiI5yyIyQQARA&usqp=CAU",
          notificationLayout: NotificationLayout.BigPicture,
        ),
        schedule: NotificationCalendar(
          second: 0,
          repeats: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          //
          child: ElevatedButton(
            onPressed: triggerNotification,
            child: const Text("Trigger notification"),
          ),
        ),
      ),
    );
  }
}
