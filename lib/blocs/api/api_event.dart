part of 'api_bloc.dart';

@immutable
abstract class ApiEvent extends Equatable{
  const ApiEvent();

  @override
  List<Object> get props => [];
}


class ApiRequest extends ApiEvent{
  final List<Function(ApiCalls)> functions;

  const ApiRequest(this.functions);

  factory ApiRequest.single(Function(ApiCalls) function) => ApiRequest([function]);

  @override
  List<Object> get props => [functions];
}

