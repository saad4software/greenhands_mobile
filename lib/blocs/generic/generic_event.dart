part of 'generic_bloc.dart';

@immutable
abstract class GenericEvent extends Equatable {
  const GenericEvent();

  @override
  List<Object> get props => [];
}

class GEvent extends GenericEvent{
  final List<Function> functions;

  const GEvent(this.functions);

  factory GEvent.single(Function function) => GEvent([function]);

  @override
  List<Object> get props => [functions];
}
