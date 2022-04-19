import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:greenhands_mobile/models/responses/generic_response.dart';
import 'package:greenhands_mobile/repositories/api_calls.dart';
import 'package:greenhands_mobile/repositories/repository.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

part 'api_event.dart';
part 'api_state.dart';

class ApiBloc extends Bloc<ApiEvent, ApiState> {

  Repository repository = Repository(Repository.getClient());

  ApiBloc() : super(ApiInitial()){
    on<ApiRequest>(_onEvent);
  }

  void setToken(String? token){
    repository = Repository(Repository.getClient(token: token));
  }

  void _onEvent(ApiEvent event,Emitter<ApiState> emit) async {
    emit(ApiDataLoading());
    try{
      print("Api event");
      if (event is ApiRequest){
        print("Api request");

        var responses = [];
        for (Function fun in event.functions){
          var res = await fun(repository);
          var type = res.runtimeType;
          if (res is GenericResponse){
            if (res.code == 200){
              responses.add(res);
            }
            else{
              emit(ApiError(res.message ?? "No message"));
            }
          } else{
            responses.add(res);
          }
        }
        emit(ApiDataReady(responses: responses));

      }

    } catch(exception){
      print(exception.toString());
      var msg = "error";
      switch (exception.runtimeType) {
        case DioError:
        // Here's the sample to get the failed response error code and message
          final res = (exception as DioError);
          msg = res.type.toString();
          debugPrint(msg);

          break;
        default:

      }
      emit(ApiError(msg));
    }

  }

  // @override
  // Stream<ApiState> mapEventToState(
  //     ApiEvent event,
  //     ) async* {
  //   yield ApiDataLoading();
  //
  //   try{
  //     print("Api event");
  //
  //     if (event is ApiRequest){
  //       print("Api request");
  //
  //       var responses = [];
  //       for (Function fun in event.functions){
  //         var res = await fun(apiCalls);
  //         if (res is GenericResponse){
  //           if (res.code == 200){
  //             responses.add(res);
  //           }
  //           else{
  //             yield ApiError(res.message ?? "No message");
  //           }
  //         }
  //       }
  //       yield ApiDataReady(responses: responses);
  //
  //     }
  //
  //   } catch(exception){
  //     print("api_bloc error!!!");
  //     print(exception.runtimeType);
  //     var msg = "error";
  //     switch (exception.runtimeType) {
  //       case DioError:
  //       // Here's the sample to get the failed response error code and message
  //         final res = (exception as DioError);
  //         // print(res.message);
  //         msg = res.message;
  //
  //         break;
  //       default:
  //
  //     }
  //     yield ApiError(msg);
  //   }
  //
  // }

}
