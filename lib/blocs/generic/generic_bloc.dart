import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'generic_event.dart';
part 'generic_state.dart';

class GenericBloc extends Bloc<GenericEvent, GenericState> {
  GenericBloc() : super(GenericInitial()) {
    on<GEvent>(_onEvent);
  }

  void _onEvent(GenericEvent event,Emitter<GenericState> emit) async {
    emit(GenericLoading());
    try{
      if (event is GEvent){
        var responses = [];
        for (Function fun in event.functions){
          var res = await fun();
          responses.add(res);
        }
        emit(GenericReady(responses: responses));

      }

    } catch(exception){
      var msg = "error";
      emit(GenericError(msg));
    }

  }
}
