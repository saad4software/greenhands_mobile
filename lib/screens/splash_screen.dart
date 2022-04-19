import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:greenhands_mobile/blocs/api/api_bloc.dart';
import 'package:greenhands_mobile/blocs/generic/generic_bloc.dart';
import 'package:greenhands_mobile/screens/intro_screen.dart';
import 'package:greenhands_mobile/screens/user_info_screen.dart';
import 'package:greenhands_mobile/utils/pref_model.dart';
import 'package:greenhands_mobile/extensions/widget_extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    var apiBloc = BlocProvider.of<ApiBloc>(context);
    var genericBloc = GenericBloc();

    FocusManager.instance.primaryFocus?.unfocus();

    genericBloc.add(GenericEvent.single(() => SharedPreferences.getInstance()));

    return Scaffold(
      body: BlocProvider(
        create: (context) => genericBloc,
        child: Container(
            margin: const EdgeInsets.all(16),
            child: Center(
              child: MultiBlocListener(
                listeners: [
                  BlocListener<GenericBloc, GenericState>(
                    listener: (context, state) {
                      if (state is GenericReady) {
                        final preferences = state.getValue<SharedPreferences>();
                        PrefModel.instance.loadData(preferences!);
                        apiBloc.add(ApiRequest.single((p0) => p0.anonymousLogin()));
                      }
                    },
                  ),
                  BlocListener<ApiBloc, ApiState>(
                    listener: (context, state) {
                      if (state is ApiDataReady) {
                        // already has an account
                        apiBloc.setToken(PrefModel.instance.token);
                        gotoSection(
                            context: context,
                            screen: UserInfoScreen()
                        );
                      } else if (state is ApiError && state.message.contains("response")) {
                        // new user
                        gotoSection(
                            context: context,
                            screen: IntroScreen());
                      }
                    },
                  ),
                ],
                child: Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/logo.png'),
                      BlocBuilder<ApiBloc, ApiState>(
                        builder: (context, state) {
                          if (state is ApiError && state.message.contains("other")){
                            // connection error
                            return Column(
                              children: [
                                const Text("check_internet_connection"),
                                ElevatedButton(onPressed: ()=>apiBloc.add(ApiRequest.single((p0) => p0.anonymousLogin())), child: const Text("retry")),
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
      ),

    );
  }

}
