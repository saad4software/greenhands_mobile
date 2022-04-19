import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhands_mobile/blocs/api/api_bloc.dart';
import 'package:greenhands_mobile/blocs/generic/generic_bloc.dart';
import 'package:greenhands_mobile/models/entities/profile_model.dart';
import 'package:greenhands_mobile/models/index.dart';
import 'package:greenhands_mobile/repositories/api_calls.dart';
import 'package:greenhands_mobile/screens/map_screen.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:greenhands_mobile/utils/pref_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserInfoScreen extends StatelessWidget {

  String title = 'test title';

  @override
  Widget build(BuildContext context) {
    var apiBloc = BlocProvider.of<ApiBloc>(context);
    var genericBloc = GenericBloc();

    final list = ['giver', 'taker', 'organizer'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: BlocProvider(
        create: (context) => genericBloc,
        child: Container(
            margin: EdgeInsets.all(16),
            child: Container(
              child: ListView(
                children: [
                    Column(
                    children: [
                    Text(PrefModel.instance.token ?? ''),
                    Text(PrefModel.instance.role ?? ''),
                    // Text(role ?? ''),
                    ],
                  ),
                  BlocBuilder<ApiBloc, ApiState>(
                    builder: (context, state) {
                      if(state is ApiDataReady)
                      {
                        var lst = state.getValue<GenericListResponse<List<ProfileModel>>>();
                        if(lst != null)
                          print(lst.count);

                        return Text("nice");
                      }
                      return Text("not cool");
                    },
                  ),
                  Card(
                    margin: EdgeInsets.all(5),
                    child: ListTile(
                      title: Text('giver'),
                      onTap: ()=>genericBloc.add(GenericEvent.message("Hate")),
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(5),
                    child: BlocBuilder<GenericBloc, GenericState>(
                      builder: (context, state) {
                        debugPrint(state.msg);
                        return ListTile(
                          title: Text(state.msg ?? "no msg"),
                          onTap: () =>
                              apiBloc.add(ApiRequest.single((p0) => p0.organizers(1, 10, ""))),
                        );
                      },
                    ),
                  ),
                  Card(
                    margin: EdgeInsets.all(5),
                    child: ListTile(
                      title: Text('organizer'),
                      onTap: ()=>genericBloc.add(GenericEvent.message("love")),
                    ),
                  ),
                ],
              ),
            )
        ),
      ),

    );
  }

}
