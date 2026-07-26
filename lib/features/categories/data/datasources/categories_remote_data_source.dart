import '../../../../core/error/exceptions.dart';
import '../../../../core/network/models/generic_list_response.dart';
import '../../../../core/network/models/generic_response.dart';
import '../models/category_model.dart';
import 'categories_api_service.dart';

/// Contract for Categories remote data source.
abstract class CategoriesRemoteDataSource {
  /// Fetches paginated categories list.
  Future<GenericResponse<GenericListResponse<List<CategoryModel>>>>
  getCategories({required int page, required int pageSize, String? search});
}

/// Implementation of [CategoriesRemoteDataSource] using [CategoriesApiService].
class CategoriesRemoteDataSourceImpl implements CategoriesRemoteDataSource {
  final CategoriesApiService _apiService;

  /// Creates an instance of [CategoriesRemoteDataSourceImpl].
  CategoriesRemoteDataSourceImpl(this._apiService);

  @override
  Future<GenericResponse<GenericListResponse<List<CategoryModel>>>>
  getCategories({
    required int page,
    required int pageSize,
    String? search,
  }) async {
    try {
      return await _apiService.categories(page, pageSize, search);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
