import 'dart:math';

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

  static void schedulePeriodicNotification() async {

    String localTimeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();

    AwesomeNotifications().createNotification(

      content: NotificationContent(
        id: Random().nextInt(100),
        channelKey: 'basic_channel',
        title: 'Periodic Notification',
        body: 'This is a periodic notification.',
        notificationLayout: NotificationLayout.Default,
        actionType: ActionType.Default
      ),
      schedule: NotificationInterval(
        interval: 5,
      ),
    );
  }
}