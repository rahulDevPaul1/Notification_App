import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:notification_example/notification_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String localTimeZone;

  @override
  void initState() {
    super.initState();
    // Initialize local time zone when the widget is first created
    initializeLocalTimeZone();
  }

  // Function to initialize the local time zone
  Future<void> initializeLocalTimeZone() async {
    localTimeZone = await AwesomeNotifications().getLocalTimeZoneIdentifier();
    // Update the state to reflect the fetched local time zone
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification Example"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 200),
            ElevatedButton(
              onPressed: () {
                // Create a simple notification immediately when button is pressed
                AwesomeNotifications().createNotification(
                  content: NotificationContent(
                    id: Random().nextInt(50),
                    channelKey: "basic_channel",
                    title: "Hello World",
                    body: "Yah! I have notification working now!",
                  ),
                );
              },
              child: Text(
                "Press here for notification",
                style: TextStyle(color: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text(
                "press for preodic notification with 1min interval",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                NotificationController.schedulePeriodicNotification();
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                scheduleNotificationAtSpecificTime();
              },
              child: Text(
                "Press here to schedule a notification for 10:00 PM",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }


  void scheduleNotificationAtSpecificTime() async {

    DateTime now = DateTime.now().toLocal();

    DateTime scheduledTime = DateTime(now.year, now.month, now.day, 10, 02);

    if (now.isAfter(scheduledTime)) {

      scheduledTime = scheduledTime.add(Duration(days: 1));
    }
    if (localTimeZone.isEmpty) {
      await initializeLocalTimeZone();
    }

    try {
      print("Scheduling notification for: $scheduledTime with timezone: $localTimeZone");
      // Schedule the notification
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          id: 3,
          channelKey: "basic_channel",
          title: "Scheduled Notification",
          body: "This notification is scheduled for 9:00 PM",
        ),
        schedule: NotificationCalendar(
          timeZone: localTimeZone,
          year: scheduledTime.year,
          month: scheduledTime.month,
          day: scheduledTime.day,
          hour: scheduledTime.hour,
          minute: scheduledTime.minute,
          second: 0, // Set seconds to 0
          preciseAlarm: true,
        ),
      );
      print("Notification scheduled successfully ");
    } catch (e) {
      print("Error scheduling notification: $e");
    }
  }


}
