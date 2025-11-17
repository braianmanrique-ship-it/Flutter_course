import 'package:flutter/material.dart';
import 'package:cine_app/presentation/widgets/widgets.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  static const String name = "home-screen";

  final StatefulNavigationShell navigationShell;

  const HomeScreen({super.key, required this.navigationShell});

  void onNavigationShell(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: navigationShell.currentIndex,
        onTap: onNavigationShell,
      ),
    );
  }
}
