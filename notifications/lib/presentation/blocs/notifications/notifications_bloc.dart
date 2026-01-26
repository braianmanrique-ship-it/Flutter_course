import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//firebase
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:notifications/firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  final FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationsBloc() : super(NotificationsState()) {
    on<NotificationsStatusChanged>(_notificationsStatusChanged);
    //check permissions
    //requestPermissions();
    _initialStatusNotifications();
    _getToken();
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
  }

  //toket
  void _getToken() async {
    if (state.status == AuthorizationStatus.notDetermined) return;
    final token = await messaging.getToken();
    print('Token: $token');
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

    add(NotificationsStatusChanged(status: settings.authorizationStatus));
    _getToken();
  }
}
