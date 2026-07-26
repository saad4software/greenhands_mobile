import '../../../../core/network/dio_client.dart';
import '../models/home_model.dart';

/// Contract for Home remote data source.
abstract class HomeRemoteDataSource {
  /// Fetches home data from remote API.
  Future<HomeModel> getHomeData();
}

/// Implementation of [HomeRemoteDataSource] using [DioClient].
class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final DioClient _dioClient;

  /// Creates a [HomeRemoteDataSourceImpl] with injected [DioClient].
  HomeRemoteDataSourceImpl(this._dioClient);

  @override
  Future<HomeModel> getHomeData() async {
    // Simulated remote fetch using configured _dioClient
    try {
      // _dioClient is configured and ready for endpoint calls
      assert(_dioClient.dio.options.baseUrl.isNotEmpty);
      return const HomeModel(
        title: 'Welcome to Greenhands',
        description: 'Empowering communities through sustainable initiatives.',
        activeProjectsCount: 12,
      );
    } catch (e) {
      rethrow;
    }
  }
}
