import 'package:equatable/equatable.dart';
import '../../domain/entities/home_entity.dart';

/// Sealed base class for Home feature BLoC states.
sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

/// Initial state before data fetching begins.
final class HomeInitial extends HomeState {
  const HomeInitial();
}

/// State indicating home data is currently loading.
final class HomeLoading extends HomeState {
  const HomeLoading();
}

/// State representing successfully loaded home data.
final class HomeLoaded extends HomeState {
  /// Loaded home entity data.
  final HomeEntity data;

  /// Creates a [HomeLoaded] state.
  const HomeLoaded(this.data);

  @override
  List<Object?> get props => [data];
}

/// State representing an error encountered during data fetching.
final class HomeError extends HomeState {
  /// Error message description.
  final String message;

  /// Creates a [HomeError] state.
  const HomeError(this.message);

  @override
  List<Object?> get props => [message];
}
