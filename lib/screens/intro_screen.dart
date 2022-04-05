import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhands_mobile/blocs/api/api_bloc.dart';
import 'package:greenhands_mobile/blocs/generic/generic_bloc.dart';
import 'package:greenhands_mobile/screens/edit_profile_screen.dart';
import 'package:greenhands_mobile/screens/map_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:greenhands_mobile/screens/pick_location_screen.dart';
import 'package:greenhands_mobile/screens/user_info_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:greenhands_mobile/extensions/widget_extension.dart';

class IntroScreen extends StatelessWidget {

  Future<String?> _getId() async {
    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }

  @override
  Widget build(BuildContext context) {
    var apiBloc = BlocProvider.of<ApiBloc>(context);
    var genericBloc = BlocProvider.of<GenericBloc>(context);

    genericBloc.add(
        GEvent(
            [
                  () => _getId(),
                  () => SharedPreferences.getInstance()
            ]
        )
    );
    final list = ['giver', 'taker', 'organizer'];

    return Scaffold(
      appBar: AppBar(
        title: Text("Intro"),
      ),
      body: Container(
          margin: EdgeInsets.all(16),
          child: Container(
            child: ListView(
              children: [
                BlocBuilder<GenericBloc, GenericState>(
                  builder: (context, state) {
                    return Text(state.getValue() ?? '');
                  },
                ),
                Card(
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    title: Text('giver'),
                    onTap: ()=>gotoScreen(context: context, screen: PickLocationScreen()),
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(5),
                  child: BlocBuilder<GenericBloc, GenericState>(
                    builder: (context, state) {
                      return ListTile(
                        title: Text('taker'),
                        onTap: () =>
                            state.getValue<SharedPreferences>()?.setString(
                                "key", "taker"),
                      );
                    },
                  ),
                ),
                Card(
                  margin: EdgeInsets.all(5),
                  child: ListTile(
                    title: Text('organizer'),
                    onTap: ()=>gotoScreen(context: context, screen: EditProfileScreen()),
                  ),
                ),
              ],
            ),
          )
      ),

    );
  }

}
