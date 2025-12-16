import 'package:flutter/material.dart';

class CubitCounterScreen extends StatelessWidget {
  const CubitCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.refresh_rounded)),
        ],
      ),
      body: Center(child: Text("Contador")),
      //floating action button
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: 50),
          FloatingActionButton(
            onPressed: () {},
            heroTag: "1",
            child: Text("+1"),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {},
            heroTag: "10",
            child: Text("+10"),
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {},
            heroTag: "-10",
            child: Text("-10"),
          ),
        ],
      ),
    );
  }
}
