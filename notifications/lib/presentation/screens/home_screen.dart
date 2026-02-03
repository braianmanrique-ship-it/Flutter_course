import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notifications/presentation/blocs/notifications/notifications_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: context.select(
          (NotificationsBloc bloc) => Text("${bloc.state.status}"),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.read<NotificationsBloc>().requestPermissions();
            },
            icon: Icon(Icons.notifications),
          ),
        ],
      ),
      body: _HomeView(),
    );
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final notifications = context
        .watch<NotificationsBloc>()
        .state
        .notifications;

    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (BuildContext conntext, int index) {
        final noti = notifications[index];
        return ListTile(
          //title
          title: Text(noti.title),
          //body
          subtitle: Text(noti.body),
          //sent date
          trailing: Text(noti.sentDate.toString()),
          //image
          leading: noti.imageUrl != null
              ? Image.network(noti.imageUrl!)
              : Icon(Icons.notifications),
        );
      },
    );
  }
}
