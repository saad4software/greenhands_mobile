import 'package:flutter/material.dart';

class NeedsTab extends StatelessWidget {
  const NeedsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
      itemBuilder: (context,index)=>ListTile(
        title: Text("need $index"),
        subtitle: const Text("description"),
        leading: const Icon(Icons.icecream),
      ),
      itemCount: 5,
    );
  }
}