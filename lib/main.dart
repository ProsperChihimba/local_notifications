import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:local_notifications/home.dart';

void main() {
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: "basic_channel",
        channelName: "Basic notifications",
        channelDescription: "Notification channel for basic tests",
        importance: NotificationImportance.Max,
        defaultPrivacy: NotificationPrivacy.Private,
        enableVibration: true,
        defaultColor: Colors.redAccent,
        channelShowBadge: true,
        enableLights: true,
        icon: 'resource://drawable/res_naruto',
        // playSound: true,
        // soundSource: 'resource://raw/naruto_jutsu',
      ),
    ],
    debug: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
