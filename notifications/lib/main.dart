import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notifications/config/theme/app_theme.dart';
import 'package:notifications/config/router/routes.dart';
import 'package:notifications/presentation/blocs/notifications/notifications_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationsBloc.initializeFirebaseNotifications();
  FirebaseAnalytics.instance;
  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (_) => NotificationsBloc())],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      routerConfig: appRouter,
    );
  }
}
