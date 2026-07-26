import '../entities/home_entity.dart';

/// Abstract repository contract for Home feature.
abstract class HomeRepository {
  /// Fetches home dashboard domain entity data.
  Future<HomeEntity> getHomeData();
}
