import 'package:equatable/equatable.dart';

/// Clean domain entity representing a collection / drop-off point.
class PointEntity extends Equatable {
  /// Unique point ID.
  final int id;

  /// Name of the point.
  final String name;

  /// Latitude coordinate.
  final double lat;

  /// Longitude coordinate.
  final double lng;

  /// Physical address string.
  final String address;

  /// Optional brief description.
  final String? brief;

  /// Creates a [PointEntity].
  const PointEntity({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
    required this.address,
    this.brief,
  });

  @override
  List<Object?> get props => [id, name, lat, lng, address, brief];
}
