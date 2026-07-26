import '../entities/home_entity.dart';
import '../repositories/home_repository.dart';

/// Single-purpose use case for retrieving home dashboard data.
class GetHomeDataUseCase {
  final HomeRepository _repository;

  /// Creates a [GetHomeDataUseCase] with injected [HomeRepository].
  const GetHomeDataUseCase(this._repository);

  /// Executes the usecase.
  Future<HomeEntity> call() async {
    return _repository.getHomeData();
  }
}
