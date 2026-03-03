import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:notifications/config/router/routes.dart';

class LocalNotifications {
  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> requestPermissionsNotifications() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >()
        ?.requestNotificationsPermission();
  }

  Future<void> initializeLocalNotifications() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const androidInitializationSettings = AndroidInitializationSettings(
      "ic_launcher",
    );

    const darwinInitializationSettings = DarwinInitializationSettings();

    const initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: darwinInitializationSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(
      settings: initializationSettings,
      onDidReceiveNotificationResponse: onDidRecieveNotificationResponse,
    );
  }

  static void showNotification({
    required int id,
    String? title,
    String? body,
    String? data,
  }) {
    const androidDetails = AndroidNotificationDetails(
      "channel_id",
      "channel_name",
      playSound: false,
      importance: Importance.max,
      priority: Priority.high,
    );

    const notificationsDetails = NotificationDetails(android: androidDetails);

    flutterLocalNotificationsPlugin.show(
      id: id,
      title: title ?? "",
      body: body ?? "",
      notificationDetails: notificationsDetails,
      payload: data ?? "",
    );
  }

  void onDidRecieveNotificationResponse(NotificationResponse response) {
    print('onDidRecieveNotificationResponse: $response');
    appRouter.push("/push-message/${response.payload}");
  }
}
