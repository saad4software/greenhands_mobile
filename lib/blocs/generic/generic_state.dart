part of 'generic_bloc.dart';

@immutable
abstract class GenericState extends Equatable{
  List<dynamic> responses = [];
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
  GenericReady({required responses}){
    super.responses = responses;
  }

  @override
  List<Object> get props => [];
}

class GenericError extends GenericState{
  final String message;

  GenericError(this.message);

  @override
  List<Object> get props => [message];

}