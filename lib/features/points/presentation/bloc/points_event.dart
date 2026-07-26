import 'package:equatable/equatable.dart';

/// Sealed base event for PointsBloc.
sealed class PointsEvent extends Equatable {
  const PointsEvent();

  @override
  List<Object?> get props => [];
}

/// Event to fetch collection points & organizers inside visible map region.
class FetchMapDataEvent extends PointsEvent {
  /// Minimum latitude.
  final double minLat;

  /// Maximum latitude.
  final double maxLat;

  /// Minimum longitude.
  final double minLng;

  /// Maximum longitude.
  final double maxLng;

  /// Creates a [FetchMapDataEvent].
  const FetchMapDataEvent({
    required this.minLat,
    required this.maxLat,
    required this.minLng,
    required this.maxLng,
  });

  @override
  List<Object?> get props => [minLat, maxLat, minLng, maxLng];
}
