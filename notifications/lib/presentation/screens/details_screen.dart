import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notifications/config/domain/entities/push_message.dart';
import 'package:notifications/presentation/blocs/notifications/notifications_bloc.dart';

class DetailsScreen extends StatelessWidget {
  final String pushMessageId;

  const DetailsScreen({super.key, required this.pushMessageId});

  @override
  Widget build(BuildContext context) {
    final PushMessage? message = context
        .read<NotificationsBloc>()
        .getPushMessageId(pushMessageId);

    return Scaffold(
      appBar: AppBar(title: Text('Details')),
      body: (message != null)
          ? _DeatilsView(pushMessageId: pushMessageId, pushMessage: message)
          : Center(child: Text('Message no t found')),
    );
  }
}

class _DeatilsView extends StatelessWidget {
  final String pushMessageId;
  final PushMessage pushMessage;
  const _DeatilsView({required this.pushMessageId, required this.pushMessage});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text('Message ID'),
          Text(pushMessageId),

          if (pushMessage.imageUrl != null)
            Image.network(pushMessage.imageUrl!),

          Text('Title'),
          Text(pushMessage.title),

          Text('Body'),
          Text(pushMessage.body),

          Text('Sent Date'),
          Text(pushMessage.sentDate.toString()),
        ],
      ),
    );
  }
}
