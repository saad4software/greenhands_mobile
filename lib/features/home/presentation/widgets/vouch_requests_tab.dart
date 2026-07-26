import 'package:flutter/material.dart';

/// Clean Vouch Requests screen/widget listing vouch validation items.
class VouchRequestsTab extends StatelessWidget {
  /// Creates a [VouchRequestsTab].
  const VouchRequestsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Vouch Requests')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.verified_user, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No pending vouch requests',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Requests for trust verification will appear here.',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
