import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhands_mobile/blocs/generic/generic_bloc.dart';
import 'package:greenhands_mobile/screens/intro_screen.dart';
import 'package:greenhands_mobile/screens/map_screen.dart';
import 'package:greenhands_mobile/screens/splash_screen.dart';
import 'utils/observer.dart';

import 'blocs/api/api_bloc.dart';
import 'repositories/api_calls.dart';

void main() {
  // final ApiCalls apiCalls = ApiCalls(ApiCalls.getClient());

  Bloc.observer = Observer();
  runApp(
    /// global access blocs
    MultiBlocProvider(
      providers: [
        BlocProvider<ApiBloc>(create: (context) => ApiBloc()),
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
        // brightness: Brightness.dark,
        // primaryColor: Colors.lightBlue[800],

        // Define the default font family.
        fontFamily: 'Georgia',

        // Define the default `TextTheme`. Use this to specify the default
        // text styling for headlines, titles, bodies of text, and more.
        // textTheme: const TextTheme(
        //   headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        // ),
      ),
      home: Stack(
        children: [
          SplashScreen(),
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

