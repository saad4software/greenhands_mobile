import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'generic_event.dart';
part 'generic_state.dart';

class GenericBloc extends Bloc<GenericEvent, GenericState> {
  GenericBloc() : super(GenericInitial()) {
    on<GenericEvent>(_onEvent);
  }

  void _onEvent(GenericEvent event,Emitter<GenericState> emit) async {
    emit(GenericLoading());
    try{
      if (event is GenericEvent){
        var responses = [];
        if(event.functions != null){
          for (Function fun in event.functions!){
            var res = await fun();
            responses.add(res);
          }
        }

        emit(GenericReady(responses: responses, msg: event.msg));

      }

    } catch(exception){
      var msg = "error";
      print(exception.toString());
      emit(GenericError(msg));
    }

  }
}
