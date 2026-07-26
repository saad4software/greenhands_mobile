import '../../domain/entities/need_entity.dart';
import '../../domain/repositories/needs_repository.dart';
import '../datasources/needs_remote_data_source.dart';

/// Data layer implementation of [NeedsRepository].
class NeedsRepositoryImpl implements NeedsRepository {
  final NeedsRemoteDataSource _remoteDataSource;

  /// Creates a [NeedsRepositoryImpl] with injected [_remoteDataSource].
  NeedsRepositoryImpl(this._remoteDataSource);

  @override
  Future<List<NeedEntity>> getNeeds({
    int page = 1,
    int pageSize = 20,
    String? search,
  }) async {
    final response = await _remoteDataSource.getNeeds(
      page: page,
      pageSize: pageSize,
      search: search,
    );

    final needsList = response.data?.results ?? [];
    return needsList
        .map(
          (model) => NeedEntity(
            id: model.id,
            name: model.name,
            brief: model.brief,
            categoryName: model.categoryModel.name,
            point: model.point,
            granted: model.granted,
          ),
        )
        .toList();
  }
}
