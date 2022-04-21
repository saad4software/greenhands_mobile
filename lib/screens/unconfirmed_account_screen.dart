import 'package:flutter/material.dart';

class UnconfirmedAccountScreen extends StatelessWidget {
  const UnconfirmedAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unconfirmed Account"),
      ),
      body: const Center(
        child: Text("the admin will reach you soon to confirm your identity"),
      ),
    );
  }
}