import '../../../profile/domain/entities/profile_entity.dart';
import '../../domain/entities/point_entity.dart';
import '../../domain/repositories/points_repository.dart';
import '../datasources/points_remote_data_source.dart';

/// Implementation of [PointsRepository].
class PointsRepositoryImpl implements PointsRepository {
  final PointsRemoteDataSource _remoteDataSource;

  /// Creates a [PointsRepositoryImpl] with injected [_remoteDataSource].
  PointsRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<PointEntity>> getPoints(MapRegionParams params) async {
    final response = await _remoteDataSource.getPoints(
      page: params.page,
      pageSize: params.pageSize,
      minLat: params.minLat,
      maxLat: params.maxLat,
      minLng: params.minLng,
      maxLng: params.maxLng,
    );

    final pointsList = response.data?.results ?? [];
    return pointsList
        .map(
          (model) => PointEntity(
            id: model.id,
            name: model.name,
            lat: model.lat,
            lng: model.lng,
            address: model.address,
            brief: model.brief,
          ),
        )
        .toList();
  }

  @override
  Future<List<ProfileEntity>> getOrganizers(MapRegionParams params) async {
    final response = await _remoteDataSource.getOrganizers(
      page: params.page,
      pageSize: params.pageSize,
      minLat: params.minLat,
      maxLat: params.maxLat,
      minLng: params.minLng,
      maxLng: params.maxLng,
    );

    final organizersList = response.data?.results ?? [];

    return organizersList
        .map(
          (model) => ProfileEntity(
            firstName: model.firstName,
            lastName: model.lastName,
            email: model.email,
            address: model.address,
            phone: model.phone,
            lat: model.lat,
            lng: model.lng,
            role: model.role,
          ),
        )
        .toList();
  }
}
