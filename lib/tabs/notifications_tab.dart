import 'package:flutter/material.dart';

class NotificationsTab extends StatelessWidget {
  const NotificationsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemBuilder: (context,index)=>ListTile(
        title: Text("notification $index"),
        subtitle: const Text("description"),
        leading: const Icon(Icons.icecream),
      ),
      itemCount: 5,
    );
  }
}