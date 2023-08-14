import 'package:awesome_notifications/awesome_notifications.dart';

class LocalNotification {
  // send notification
  static scheduleNotification() async {
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

  static cancelScheduleNotification(int id) async {
    await AwesomeNotifications().cancelSchedule(id);
  }

  // action button notification
  static Future<void> showNotificationWithActionButtons(int id) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'basic_channel',
        title: "Proc notification",
        body: "Hey awesome prosper",
      ),
      actionButtons: [
        NotificationActionButton(
          key: 'READ',
          label: 'Reply',
          requireInputText: true,
          autoDismissible: true,
        ),
        NotificationActionButton(
          key: 'DISMISS',
          label: 'Dismiss',
          actionType: ActionType.Default,
        ),
      ],
    );
  }
}
