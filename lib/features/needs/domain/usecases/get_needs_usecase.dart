import '../entities/need_entity.dart';
import '../repositories/needs_repository.dart';

/// Single-purpose use case for fetching public needs.
class GetNeedsUseCase {
  final NeedsRepository _repository;

  /// Creates a [GetNeedsUseCase] with injected [NeedsRepository].
  const GetNeedsUseCase(this._repository);

  /// Executes fetching needs list.
  Future<List<NeedEntity>> call({
    int page = 1,
    int pageSize = 20,
    String? search,
  }) async {
    return await _repository.getNeeds(
      page: page,
      pageSize: pageSize,
      search: search,
    );
  }
}
