import '../entities/need_entity.dart';

/// Domain repository contract for Needs.
abstract class NeedsRepository {
  /// Fetches paginated public needs.
  Future<List<NeedEntity>> getNeeds({
    int page = 1,
    int pageSize = 20,
    String? search,
  });
}
