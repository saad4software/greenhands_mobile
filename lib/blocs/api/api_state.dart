part of 'api_bloc.dart';

@immutable
abstract class ApiState extends Equatable{
  const ApiState();
  @override
  List<Object> get props => [];
}

class ApiInitial extends ApiState {}

class ApiDataLoading extends ApiState{}

class ApiDataReady extends ApiState{
  final List<dynamic> responses;

  const ApiDataReady({required this.responses});

  T? getValue<T>() {
    for (dynamic res in responses) {
      if (res is GenericResponse<T>){
        return res.data;
      } else if (res is T){
        return res;
      }
    }
    return null;
  }

  @override
  List<Object> get props => [];
}

class ApiError extends ApiState{
  final String message;

  const ApiError(this.message);
  @override
  List<Object> get props => [message];

}