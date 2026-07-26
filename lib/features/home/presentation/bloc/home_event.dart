import 'package:equatable/equatable.dart';

/// Base class for Home feature BLoC events.
sealed class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object?> get props => [];
}

/// Event triggered to load home dashboard data.
final class FetchHomeDataEvent extends HomeEvent {
  const FetchHomeDataEvent();
}
