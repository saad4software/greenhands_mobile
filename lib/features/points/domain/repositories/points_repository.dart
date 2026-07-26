import '../../../profile/domain/entities/profile_entity.dart';
import '../entities/point_entity.dart';


/// Bounding box query parameters for fetching map markers within a visible region.
class MapRegionParams {
  /// Minimum latitude (southwest).
  final double minLat;

  /// Maximum latitude (northeast).
  final double maxLat;

  /// Minimum longitude (southwest).
  final double minLng;

  /// Maximum longitude (northeast).
  final double maxLng;

  /// Page number.
  final int page;

  /// Page size limit.
  final int pageSize;

  /// Creates a [MapRegionParams].
  const MapRegionParams({
    required this.minLat,
    required this.maxLat,
    required this.minLng,
    required this.maxLng,
    this.page = 1,
    this.pageSize = 50,
  });
}

/// Domain contract repository for points & organizers.
abstract class PointsRepository {
  /// Fetches collection points bounded by map coordinates.
  Future<List<PointEntity>> getPoints(MapRegionParams params);

  /// Fetches organizers bounded by map coordinates.
  Future<List<ProfileEntity>> getOrganizers(MapRegionParams params);
}
