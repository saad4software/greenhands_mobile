import 'package:flutter/material.dart';

class MoreTab extends StatelessWidget {
  const MoreTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index)=> ListTile(
        title: Text("More item $index"),
        subtitle: const Text("description"),
        leading: const Icon(Icons.category),
      ) ,
      itemCount: 10,
    );
  }
}