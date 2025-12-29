import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ListTile(
            title: Text("Cubits"),
            subtitle: Text("Gestor de estados simple"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => context.push("/counter"),
          ),
          ListTile(
            title: Text("Blocs"),
            subtitle: Text("Gestor de estados complejo"),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () => context.push("/counter-bloc"),
          ),
        ],
      ),
    );
  }
}
