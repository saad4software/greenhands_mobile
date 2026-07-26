import '../entities/point_entity.dart';
import '../repositories/points_repository.dart';

/// Single-purpose use case to fetch collection points within map bounds.
class GetPointsUseCase {
  final PointsRepository _repository;

  /// Creates a [GetPointsUseCase] with injected [PointsRepository].
  const GetPointsUseCase(this._repository);

  /// Executes fetching points for [params].
  Future<List<PointEntity>> call(MapRegionParams params) async {
    return await _repository.getPoints(params);
  }
}
