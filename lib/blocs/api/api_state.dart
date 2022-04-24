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

  bool has<R>(){
    for (dynamic res in responses) {
      if (res is R){
        return true;
      }
    }
    return false;
  }

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
  final String? message;
  final DioErrorType dioErrorType;

  const ApiError({this.message, required this.dioErrorType});

  @override
  List<Object> get props => [dioErrorType];

}