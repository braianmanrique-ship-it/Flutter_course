import 'package:flutter/material.dart';
import 'package:cine_app/config/theme/app_theme.dart';
import 'package:cine_app/config/routes/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRoutes,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      title: "Cine App",
    );
  }
}
