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

    if (event is ApiRequest){

      var responses = [];
      for (Function fun in event.functions){

        try {
          var res = await fun(repository);

          // successful response
          responses.add(res);

        } catch(exception){
          if(exception is DioError){
            switch(exception.type){
              case DioErrorType.response:
                final data = GenericResponse.fromJson(exception.response?.data, ()=>null);
                emit(ApiError(message: data.message, dioErrorType: exception.type));
                break;
              case DioErrorType.other:
              case DioErrorType.cancel:
              case DioErrorType.connectTimeout:
              case DioErrorType.receiveTimeout:
              case DioErrorType.sendTimeout:
                emit(ApiError(dioErrorType: exception.type));
            }
          }

        }
      }

      emit(ApiDataReady(responses: responses));

    }

  }

}
