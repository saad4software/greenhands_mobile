import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/models/generic_list_response.dart';
import '../../../../core/network/models/generic_response.dart';
import '../../../profile/data/models/profile_model.dart';
import '../models/edit_point_request.dart';
import '../models/point_model.dart';

part 'points_api_service.g.dart';

/// Retrofit REST client interface for Points & Organizers endpoints.
@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class PointsApiService {
  /// Factory constructor for [PointsApiService].
  factory PointsApiService(Dio dio, {String baseUrl}) = _PointsApiService;

  /// Fetches collection points filtered by page, search query, or bounding box coordinates.
  @GET(ApiEndpoints.points)
  Future<GenericResponse<GenericListResponse<List<PointModel>>>> points(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('search') String? search,
    @Query('min_lat') double? minLat,
    @Query('max_lat') double? maxLat,
    @Query('min_lng') double? minLng,
    @Query('max_lng') double? maxLng,
  );

  /// Fetches organizers list.
  @GET(ApiEndpoints.organizers)
  Future<GenericResponse<GenericListResponse<List<ProfileModel>>>> organizers(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('search') String? search,
    @Query('min_lat') double? minLat,
    @Query('max_lat') double? maxLat,
    @Query('min_lng') double? minLng,
    @Query('max_lng') double? maxLng,
  );

  /// Fetches taker point.
  @GET(ApiEndpoints.takerPoint)
  Future<GenericResponse<PointModel>> takerPoint();

  /// Updates taker point details.
  @POST(ApiEndpoints.takerPoint)
  Future<GenericResponse<PointModel>> takerPointUpdate(
    @Body() EditPointRequest request,
  );
}
