import 'package:flutter/material.dart';

class ScreenLoader extends StatelessWidget {
  ScreenLoader({super.key});

  final msgs = [
    'Abriendo la puerta...',
    'Cargando las peliculas...',
    'Comprando los tickets...',
    'Disfrutando de la pelicula...',
    'Esto esta tardando mas de lo esperado :) ...',
  ];

  Stream<String> getMsgs() {
    return Stream.periodic(const Duration(seconds: 2), (step) {
      return msgs[step % msgs.length];
    }).take(msgs.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
            stream: getMsgs(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const SizedBox.shrink();
              return Text(snapshot.data!);
            },
          ),
          SizedBox(height: 10),
          CircularProgressIndicator(),
        ],
      ),
    );
  }
}
