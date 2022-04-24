import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:greenhands_mobile/models/entities/token_model.dart';
import 'package:greenhands_mobile/models/index.dart';
import 'package:greenhands_mobile/screens/organizer_home.dart';
import 'package:greenhands_mobile/screens/taker_home.dart';
import 'package:greenhands_mobile/screens/unconfirmed_account_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:greenhands_mobile/blocs/api/api_bloc.dart';
import 'package:greenhands_mobile/blocs/generic/generic_bloc.dart';
import 'package:greenhands_mobile/screens/intro_screen.dart';
import 'package:greenhands_mobile/screens/user_info_screen.dart';
import 'package:greenhands_mobile/utils/pref_model.dart';
import 'package:greenhands_mobile/extensions/widget_extension.dart';
import 'package:dio/dio.dart';

import 'giver_home.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var apiBloc = BlocProvider.of<ApiBloc>(context);
    apiBloc.add(ApiRequest([
          (p0) => p0.anonymousLogin(),
          (p0) => p0.geoLocation(),
    ]));

    FocusManager.instance.primaryFocus?.unfocus();

    return Scaffold(
      body: Container(
          margin: const EdgeInsets.all(16),
          child: Center(
            child: BlocListener<ApiBloc, ApiState>(
              listener: (context, state) {
                if (state is ApiDataReady && state.has<GenericResponse<TokenModel>>()) {
                  // already has an account
                  apiBloc.setToken(PrefModel.instance.token);
                  final response = state.getValue<TokenModel>();

                  if(response?.role == "O"){ // organizer
                    gotoSection(context: context, screen: const OrganizerHome());

                  }else if(response?.role == "G"){ // giver
                    gotoSection(context: context, screen: const GiverHome());

                  }else if(response?.role == "T"){ // taker
                    gotoSection(context: context, screen: const TakerHome());

                  } else { // shouldn't be triggered
                    gotoSection(
                        context: context,
                        screen: UserInfoScreen()
                    );
                  }
                } else if (state is ApiError && state.dioErrorType==DioErrorType.response) {

                  if (state.message == "inactive_account\n\r"){ // unconfirmed organizer account
                    gotoSection(context: context, screen: const UnconfirmedAccountScreen());

                  } else { // some error? shouldn't be triggered
                    gotoSection(
                        context: context,
                        screen: IntroScreen());
                  }

                }
              },
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/logo.png'),
                    BlocBuilder<ApiBloc, ApiState>(
                      builder: (context, state) {
                        if (state is ApiError && state.dioErrorType==DioErrorType.other){
                          // connection error
                          return Column(
                            children: [
                              const Text("check_internet_connection"),
                              ElevatedButton(onPressed: ()=>apiBloc.add(ApiRequest([
                                    (p0) => p0.anonymousLogin(),
                                    (p0) => p0.geoLocation(),
                              ])), child: const Text("retry")),
                            ],
                          );
                        }
                        return Container();
                      },
                    ),
                  ],
                ),
              ),
            ),
          )
      ),

    );
  }

}
