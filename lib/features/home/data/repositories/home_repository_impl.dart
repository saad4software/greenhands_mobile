import '../../domain/entities/home_entity.dart';
import '../../domain/repositories/home_repository.dart';
import '../datasources/home_remote_data_source.dart';

/// Implementation of [HomeRepository] domain contract.
class HomeRepositoryImpl implements HomeRepository {
  final HomeRemoteDataSource _remoteDataSource;

  /// Creates [HomeRepositoryImpl] with injected [HomeRemoteDataSource].
  HomeRepositoryImpl(this._remoteDataSource);

  @override
  Future<HomeEntity> getHomeData() async {
    return await _remoteDataSource.getHomeData();
  }
}
