import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//firebase
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notifications/firebase_options.dart';

//notifications
import 'package:notifications/config/local_notifications/local_notifications.dart';
import 'package:notifications/domain/entities/push_message.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationsBloc() : super(NotificationsState()) {
    on<NotificationsStatusChanged>(_notificationsStatusChanged);
    //listen notifications received
    on<NotificationsReceived>(_notificationsReceived);
    //check permissions
    //requestPermissions();
    _initialStatusNotifications();
    //listen notifications
    _foregroundNotifications();
  }

  //firebase
  static Future<void> initializeFirebaseNotifications() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  //event handler
  void _notificationsStatusChanged(
    NotificationsStatusChanged event,
    Emitter<NotificationsState> emit,
  ) {
    emit(state.copyWith(status: event.status));
  }

  //initial status notifications
  void _initialStatusNotifications() async {
    final settings = await messaging.getNotificationSettings();
    add(NotificationsStatusChanged(status: settings.authorizationStatus));
    _getToken();
  }

  //notifications received
  void _notificationsReceived(
    NotificationsReceived event,
    Emitter<NotificationsState> emit,
  ) {
    emit(
      state.copyWith(
        notifications: [event.pushMessage, ...state.notifications],
      ),
    );
  }

  //token
  void _getToken() async {
    if (state.status == AuthorizationStatus.notDetermined) return;
    final token = await messaging.getToken();
    debugPrint('Token: $token');
  }

  //listen notifications
  void remoteNotifications(RemoteMessage message) async {
    debugPrint('Remote message: ${message.toMap()}');

    if (message.notification != null) {
      debugPrint('Notification: ${message.notification}');
    }

    final pushMessage = PushMessage(
      messageId:
          message.messageId?.replaceAll(":", "").replaceAll("%", "") ?? "",
      title: message.notification?.title ?? "",
      body: message.notification?.body ?? "",
      sentDate: DateTime.now(),
      data: message.data,
      imageUrl: Platform.isAndroid
          ? message.notification?.android?.imageUrl
          : message.notification?.apple?.imageUrl,
    );

    add(NotificationsReceived(pushMessage: pushMessage));
  }

  void _foregroundNotifications() {
    FirebaseMessaging.onMessage.listen(remoteNotifications);
  }

  //request permissions
  void requestPermissions() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: true,
      provisional: false,
      sound: true,
    );

    await LocalNotifications.requestPermissionsNotifications();
    add(NotificationsStatusChanged(status: settings.authorizationStatus));
    _getToken();
  }

  PushMessage? getPushMessageId(String id) {
    final exit = state.notifications.any((element) => element.messageId == id);
    if (!exit) return null;
    return state.notifications.firstWhere((element) => element.messageId == id);
  }
}
