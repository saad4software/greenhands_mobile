part of 'generic_bloc.dart';

class GenericEvent extends Equatable {
  final List<Function>? functions;
  final String? msg;

  const GenericEvent({this.functions, this.msg});
  factory GenericEvent.single(Function function, {String? msg}) => GenericEvent(functions:[function], msg: msg);
  factory GenericEvent.message(String msg) => GenericEvent(msg: msg);

  @override
  List<Object> get props => [];
}

// class GEvent extends GenericEvent{
//   final List<Function> functions;
//
//   const GEvent(this.functions);
//
//   factory GEvent.single(Function function) => GEvent([function]);
//
//   @override
//   List<Object> get props => [functions];
// }
