import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhands_mobile/blocs/api/api_bloc.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var apiBloc = BlocProvider.of<ApiBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Intro"),
      ),
      body: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
                onPressed: (){},
                child: Text("Giver")),
            ElevatedButton(
                onPressed: (){},
                child: Text("Taker")),
            ElevatedButton(
                onPressed: (){},
                child: Text("Organizer")),
            IconButton(
                onPressed: () {

                },
                icon: const Icon(Icons.security))
          ],
        ),
      ),
    );
  }

}
