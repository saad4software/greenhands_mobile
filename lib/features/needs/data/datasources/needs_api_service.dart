import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/models/generic_list_response.dart';
import '../../../../core/network/models/generic_response.dart';
import '../models/need_model.dart';
import '../models/need_request.dart';
import '../models/provide_need_request.dart';

part 'needs_api_service.g.dart';

/// Retrofit REST client interface for Needs endpoints.
@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class NeedsApiService {
  /// Factory constructor for [NeedsApiService].
  factory NeedsApiService(Dio dio, {String baseUrl}) = _NeedsApiService;

  /// Fetches paginated public needs.
  @GET(ApiEndpoints.needs)
  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> needs(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('search') String? search,
  );

  /// Lists items offered/provided by giver.
  @GET(ApiEndpoints.giverProvide)
  Future<GenericResponse<GenericListResponse<List<NeedModel>>>>
  giverProvideList(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('search') String? search,
  );

  /// Submits an offer to provide a need (Giver).
  @POST(ApiEndpoints.giverProvide)
  Future<GenericResponse<NeedModel>> giverProvideNeed(
    @Body() ProvideNeedReqeust request,
  );

  /// Lists needs created by taker.
  @GET(ApiEndpoints.takerNeeds)
  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> takerNeedsList(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('search') String? search,
  );

  /// Creates a new need (Taker).
  @POST(ApiEndpoints.takerNeeds)
  Future<GenericResponse<NeedModel>> takerNeedsCreate(
    @Body() NeedRequest request,
  );

  /// Deletes a need by [id] (Taker).
  @DELETE(ApiEndpoints.takerNeedsDelete)
  Future<GenericResponse<NeedModel>> takerNeedsDelete(@Path('id') int id);
}
