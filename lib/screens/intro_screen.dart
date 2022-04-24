import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhands_mobile/blocs/api/api_bloc.dart';
import 'package:greenhands_mobile/blocs/generic/generic_bloc.dart';
import 'package:greenhands_mobile/models/index.dart';
import 'package:greenhands_mobile/screens/edit_profile_screen.dart';
import 'package:greenhands_mobile/screens/map_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:greenhands_mobile/screens/organizer_home.dart';
import 'package:greenhands_mobile/screens/pick_location_screen.dart';
import 'package:greenhands_mobile/screens/user_info_screen.dart';
import 'package:greenhands_mobile/utils/pref_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:greenhands_mobile/extensions/widget_extension.dart';

class IntroScreen extends StatelessWidget {
  String? devicePrint;

  void moveOn() {}

  @override
  Widget build(BuildContext context) {
    var apiBloc = BlocProvider.of<ApiBloc>(context);
    var genericBloc = GenericBloc();

    final list = ['giver', 'taker', 'organizer'];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to our community"),
      ),
      body: BlocProvider(
        create: (context) => genericBloc,
        child: BlocListener<ApiBloc, ApiState>(
          listener: (context, state) {
            if (state is ApiDataReady) {
              apiBloc.setToken(PrefModel.instance.token);
              final response = state.getValue<TokenModel>();
              if(response?.role == "G"){
                gotoSection(context: context, screen: OrganizerHome());
              }


            }
          },
          child: Container(
              margin: const EdgeInsets.all(16),
              child: Center(
                child: ListView(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 20),
                      height: 200,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                    Card(
                      margin: const EdgeInsets.all(5),
                      child: ListTile(
                        title: const Text('giver'),
                        onTap: () {
                          apiBloc.add(ApiRequest.single((p0) => p0.anonymousLogin(role: "G")));
                        }),
                    ),
                    Card(
                      margin: const EdgeInsets.all(5),
                      child: ListTile(
                          title: const Text('taker'),
                          onTap: () {
                            apiBloc.add(ApiRequest.single((p0) => p0.anonymousLogin(role: "T")));
                          })
                    ),
                    Card(
                      margin: const EdgeInsets.all(5),
                      child: ListTile(
                        title: const Text('organizer'),
                        onTap: () => gotoScreen(
                            context: context, screen: EditProfileScreen()),
                      ),
                    ),
                  ],
                ),
              )
          ),
        ),
      ),
    );
  }
}
