import 'package:flutter/material.dart';
import 'notifications_tab.dart';
import 'vouch_requests_tab.dart';

/// Tab widget rendering the More options navigation menu.
class MoreTab extends StatelessWidget {
  /// Creates a [MoreTab].
  const MoreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        ListTile(
          leading: const Icon(Icons.notifications_outlined),
          title: const Text('Notifications'),
          subtitle: const Text('Updates, alerts and messages'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const NotificationsTab(),
              ),
            );
          },
        ),
        const Divider(height: 1),
        ListTile(
          leading: const Icon(Icons.verified_outlined),
          title: const Text('Vouch Requests'),
          subtitle: const Text('Manage trust vouchers'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const VouchRequestsTab(),
              ),
            );
          },
        ),
        const Divider(height: 1),
        ListTile(
          leading: const Icon(Icons.person_outline),
          title: const Text('Profile'),
          subtitle: const Text('Account settings and preferences'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Profile action
          },
        ),
        const Divider(height: 1),
        ListTile(
          leading: const Icon(Icons.settings_outlined),
          title: const Text('Settings'),
          subtitle: const Text('App configuration and language'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            // Settings action
          },
        ),
        const Divider(height: 1),
        ListTile(
          leading: const Icon(Icons.info_outline),
          title: const Text('About Greenhands'),
          subtitle: const Text('Version 1.0.0'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {},
        ),
      ],
    );
  }
}
