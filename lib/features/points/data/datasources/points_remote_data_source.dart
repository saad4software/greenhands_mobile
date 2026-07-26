import '../../../../core/error/exceptions.dart';
import '../../../../core/network/models/generic_list_response.dart';
import '../../../../core/network/models/generic_response.dart';
import '../../../profile/data/models/profile_model.dart';
import '../models/edit_point_request.dart';
import '../models/point_model.dart';
import 'points_api_service.dart';

/// Contract for Points remote data source.
abstract class PointsRemoteDataSource {
  /// Fetches collection points.
  Future<GenericResponse<GenericListResponse<List<PointModel>>>> getPoints({
    required int page,
    required int pageSize,
    String? search,
    double? minLat,
    double? maxLat,
    double? minLng,
    double? maxLng,
  });

  /// Fetches organizers profiles list.
  Future<GenericResponse<GenericListResponse<List<ProfileModel>>>>
  getOrganizers({
    required int page,
    required int pageSize,
    String? search,
    double? minLat,
    double? maxLat,
    double? minLng,
    double? maxLng,
  });

  /// Fetches current taker's point.
  Future<GenericResponse<PointModel>> getTakerPoint();

  /// Updates current taker's point details.
  Future<GenericResponse<PointModel>> updateTakerPoint(
    EditPointRequest request,
  );
}

/// Implementation of [PointsRemoteDataSource] using [PointsApiService].
class PointsRemoteDataSourceImpl implements PointsRemoteDataSource {
  final PointsApiService _apiService;

  /// Creates an instance of [PointsRemoteDataSourceImpl].
  PointsRemoteDataSourceImpl(this._apiService);

  @override
  Future<GenericResponse<GenericListResponse<List<PointModel>>>> getPoints({
    required int page,
    required int pageSize,
    String? search,
    double? minLat,
    double? maxLat,
    double? minLng,
    double? maxLng,
  }) async {
    try {
      return await _apiService.points(
        page,
        pageSize,
        search,
        minLat,
        maxLat,
        minLng,
        maxLng,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<GenericListResponse<List<ProfileModel>>>>
  getOrganizers({
    required int page,
    required int pageSize,
    String? search,
    double? minLat,
    double? maxLat,
    double? minLng,
    double? maxLng,
  }) async {
    try {
      return await _apiService.organizers(
        page,
        pageSize,
        search,
        minLat,
        maxLat,
        minLng,
        maxLng,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<PointModel>> getTakerPoint() async {
    try {
      return await _apiService.takerPoint();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<PointModel>> updateTakerPoint(
    EditPointRequest request,
  ) async {
    try {
      return await _apiService.takerPointUpdate(request);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
