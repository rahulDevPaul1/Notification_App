import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'my_app.dart';

void main() async {
  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: "basic_channel",
      channelName: "Basic Notification",
      channelDescription: "Test Notification Channel",
      channelGroupKey: "basic_channel_group",
    ),

  ], channelGroups: [
    NotificationChannelGroup(
      channelGroupKey: "basic_channel_group",
      channelGroupName: 'basic group',
    ),
  ]);
  bool isAllowedToSendNotification =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotification) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const MyApp());
}
