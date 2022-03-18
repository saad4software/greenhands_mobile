import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhands_mobile/screens/intro_screen.dart';
import 'utils/observer.dart';

import 'blocs/api/api_bloc.dart';
import 'repositories/api_calls.dart';

void main() {
  final ApiCalls apiCalls = ApiCalls(ApiCalls.getClient());

  Bloc.observer = Observer();
  runApp(
    /// global access blocs
    MultiBlocProvider(
      providers: [
        BlocProvider<ApiBloc>(create: (context) => ApiBloc(apiCalls)),

      ],
      child: App(),
    ),
  );
}
class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Green hands',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Stack(
        children: [
          IntroScreen(),
          BlocBuilder<ApiBloc, ApiState>(
            builder: (context, state) => (state is ApiDataLoading) ?
            Container(
              color: Colors.black26,
              child: const Center(child: CircularProgressIndicator(),),
            )
                : Container(),
          ),
        ],
      ),
    );
  }
}

