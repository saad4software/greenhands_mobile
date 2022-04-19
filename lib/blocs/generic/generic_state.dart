part of 'generic_bloc.dart';

@immutable
abstract class GenericState extends Equatable{
  List<dynamic> responses = [];
  String? msg;
  GenericState();

  T? getValue<T>() {
    for (dynamic res in responses) {
      if (res is T){
        return res;
      }
    }
    return null;
  }

  @override
  List<Object> get props => [responses];
}

class GenericInitial extends GenericState {}

class GenericLoading extends GenericState{}

class GenericReady extends GenericState{
  GenericReady({required responses, String? msg}){
    super.responses = responses;
    super.msg = msg;
  }

  @override
  List<Object> get props => [responses];
}

class GenericError extends GenericState{
  final String message;

  GenericError(this.message);

  @override
  List<Object> get props => [message];

}