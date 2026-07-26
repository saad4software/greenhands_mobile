import '../../../profile/domain/entities/profile_entity.dart';
import '../repositories/points_repository.dart';

/// Single-purpose use case to fetch organizers within map bounds.
class GetOrganizersUseCase {
  final PointsRepository _repository;

  /// Creates a [GetOrganizersUseCase] with injected [PointsRepository].
  const GetOrganizersUseCase(this._repository);

  /// Executes fetching organizers for [params].
  Future<List<ProfileEntity>> call(MapRegionParams params) async {
    return await _repository.getOrganizers(params);
  }
}
