import 'dart:async';

import 'package:flutter/material.dart';
import 'package:local_notifications/home.dart';
import 'package:local_notifications/services/notification_contoller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await NotificationController.initializeLocalNotifications(debug: true);
  await NotificationController.initializeNotificationsEventListeners();
  scheduleMicrotask(() async {
    await NotificationController.getInitialNotificationAction();
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //
  static final GlobalKey<NavigatorState> navigationKey =
      GlobalKey<NavigatorState>();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigationKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
