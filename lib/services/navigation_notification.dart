import 'package:awesome_notifications/awesome_notifications.dart';

class NavigationNotification {
  //
  static Future<void> createBasicNotificationWithPayload() async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'navigation_notification',
        title: "This is a navigation notification",
        body: "Some description here",
        payload: {
          "Screen_name": "TEMP_SCREEN",
        },
      ),
    );
  }
}
