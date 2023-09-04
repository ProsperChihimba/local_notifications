import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:local_notifications/main.dart';
import 'package:local_notifications/temp_screen.dart';

// check received notification
navigateHelper(ReceivedAction receivedAction) {
  // check received payload
  if (receivedAction.payload != null &&
      receivedAction.payload!['Screen_name'] == 'TEMP_SCREEN') {
    MyApp.navigationKey.currentState!.push(
      MaterialPageRoute(
        builder: (_) => const TempScreen(),
      ),
    );
  }
}

class NotificationController extends ChangeNotifier {
  static final NotificationController _instance =
      NotificationController._internal();

  factory NotificationController() {
    return _instance;
  }

  NotificationController._internal();

  // initialization method
  static Future<void> initializeLocalNotifications(
      {required bool debug}) async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: "navigation_notification",
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
      debug: debug,
    );
  }

  // Event listeners
  static Future<void> initializeNotificationsEventListeners() async {
    //
    await AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      // onNotificationDisplayedMethod: NotificationController.onNotificationDisplayedMethod,
    );
  }

  //
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {
    bool isSilentAction =
        receivedAction.actionType == ActionType.SilentAction ||
            receivedAction.actionType == ActionType.SilentBackgroundAction;

    // debugPrint(
    //   "${isSilentAction ? 'silentAction' : 'Action'} Notification received }",
    // );

    debugPrint("Received action ${receivedAction.toString()}");

    // if (receivedAction.buttonKeyPressed == 'SUBSCRIBE') {
    //   debugPrint("Subscribe action button pressed");
    // }

    // navigate to a screen
    navigateHelper(receivedAction);

    Fluttertoast.showToast(
      msg:
          "${isSilentAction ? 'silentAction' : 'Action'} Notification received }",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.blue,
      gravity: ToastGravity.BOTTOM,
    );
  }

//
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedAction) async {
    debugPrint(
      "Notification created",
    );

    Fluttertoast.showToast(
      msg: "Notification created",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.blue,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static Future<void> onNotificationDisplayedMethod(
      ReceivedAction receivedAction) async {
    debugPrint(
      "Notification displayed",
    );

    Fluttertoast.showToast(
      msg: "Notification displayed",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.blue,
      gravity: ToastGravity.BOTTOM,
    );
  }

  static Future<void> onDismissActionReceivedMethod(
      ReceivedAction receivedAction) async {
    debugPrint(
      "Notification dismiss",
    );

    Fluttertoast.showToast(
      msg: "Notification dismiss",
      toastLength: Toast.LENGTH_SHORT,
      backgroundColor: Colors.blue,
      gravity: ToastGravity.BOTTOM,
    );
  }

  // this function is called when the app is terminatted
  static Future<void> getInitialNotificationAction() async {
    ReceivedAction? receivedAction = await AwesomeNotifications()
        .getInitialNotificationAction(removeFromActionEvents: true);

    if (receivedAction == null) return;

    navigateHelper(receivedAction);
  }
}
