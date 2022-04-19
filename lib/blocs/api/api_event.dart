part of 'api_bloc.dart';

@immutable
abstract class ApiEvent extends Equatable{
  const ApiEvent();

  @override
  List<Object> get props => [];
}


class ApiRequest extends ApiEvent{
  final List<Function(Repository)> functions;

  const ApiRequest(this.functions);

  factory ApiRequest.single(Function(Repository) function) => ApiRequest([function]);

  @override
  List<Object> get props => [functions];
}

