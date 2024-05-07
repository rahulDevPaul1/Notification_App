import 'package:awesome_notifications/awesome_notifications.dart';


class NotificationController {
  @pragma("vm:entry-point")
  static Future<void> onNotificationCreatedMethod(
      ReceivedNotification receivedNotification) async {}

  @pragma("vm:entry-point")
  static Future<void> onNotificationDisplayMethod(
      ReceivedNotification receivedNotification) async {}

  @pragma("vm:entry-point")
  static Future<void> onDissmissActionReceivedMethod(
      ReceivedAction receivedAction) async {}

  @pragma("vm:entry-point")
  static Future<void> onActionReceivedMethod(
      ReceivedAction receivedAction) async {}

  static void schedulePeriodicNotification() {
    var localTimeZone;
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 1,
        channelKey: 'basic_channel',
        title: 'Periodic Notification',
        body: 'This is a periodic notification.',
        wakeUpScreen: true,
        category: NotificationCategory.Alarm,
      ),
      schedule: NotificationInterval(
        interval: 60,
        timeZone: localTimeZone,
        preciseAlarm: true,
      )
    );
  }

}
