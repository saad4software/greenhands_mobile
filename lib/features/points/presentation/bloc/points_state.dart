import 'package:equatable/equatable.dart';
import '../../../profile/domain/entities/profile_entity.dart';
import '../../domain/entities/point_entity.dart';

/// Sealed base state for PointsBloc.
sealed class PointsState extends Equatable {
  const PointsState();

  @override
  List<Object?> get props => [];
}

/// Initial state of PointsBloc.
class PointsInitial extends PointsState {
  const PointsInitial();
}

/// State while fetching points/organizers.
class PointsLoading extends PointsState {
  const PointsLoading();
}

/// State when map data (points & organizers) has loaded.
class PointsLoaded extends PointsState {
  /// Loaded collection points.
  final List<PointEntity> points;

  /// Loaded organizers.
  final List<ProfileEntity> organizers;

  /// Creates a [PointsLoaded] state.
  const PointsLoaded({required this.points, required this.organizers});

  @override
  List<Object?> get props => [points, organizers];
}

/// State when fetching map data fails.
class PointsError extends PointsState {
  /// Error message.
  final String message;

  /// Creates a [PointsError] state.
  const PointsError(this.message);

  @override
  List<Object?> get props => [message];
}
