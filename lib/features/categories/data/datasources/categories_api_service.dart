import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/models/generic_list_response.dart';
import '../../../../core/network/models/generic_response.dart';
import '../models/category_model.dart';

part 'categories_api_service.g.dart';

/// Retrofit REST client interface for Categories endpoints.
@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class CategoriesApiService {
  /// Factory constructor for [CategoriesApiService].
  factory CategoriesApiService(Dio dio, {String baseUrl}) =
      _CategoriesApiService;

  /// Fetches paginated categories list.
  @GET(ApiEndpoints.categories)
  Future<GenericResponse<GenericListResponse<List<CategoryModel>>>> categories(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('search') String? search,
  );
}
