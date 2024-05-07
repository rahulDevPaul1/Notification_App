import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';

import 'notification_controller.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Notification Example")),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 200),
            ElevatedButton(
              child: Text(
                "press here for notification",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                AwesomeNotifications().createNotification(
                    content: NotificationContent(
                        id: 1,
                        channelKey: "basic_channel",
                        title: "hellow world",
                        body: "yah! I have working notification wirking now!"));
              },
            ),
            SizedBox(height: 10),
            ElevatedButton(
              child: Text(
                "press here for preodic notification",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                NotificationController.schedulePeriodicNotification();
              },
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
