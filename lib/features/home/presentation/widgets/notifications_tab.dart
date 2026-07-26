import 'package:flutter/material.dart';

/// Clean Notifications screen/widget listing app notifications.
class NotificationsTab extends StatelessWidget {
  /// Creates a [NotificationsTab].
  const NotificationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: 5,
        itemBuilder: (context, index) => Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              child: const Icon(Icons.notifications_active),
            ),
            title: Text('Notification #${index + 1}'),
            subtitle: const Text('Details and updates regarding your aid requests.'),
            trailing: const Icon(Icons.chevron_right),
          ),
        ),
      ),
    );
  }
}
