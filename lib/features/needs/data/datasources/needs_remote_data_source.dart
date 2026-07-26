import '../../../../core/error/exceptions.dart';
import '../../../../core/network/models/generic_list_response.dart';
import '../../../../core/network/models/generic_response.dart';
import '../models/need_model.dart';
import '../models/need_request.dart';
import '../models/provide_need_request.dart';
import 'needs_api_service.dart';

/// Contract for Needs remote data source.
abstract class NeedsRemoteDataSource {
  /// Fetches paginated public needs.
  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> getNeeds({
    required int page,
    required int pageSize,
    String? search,
  });

  /// Lists items offered/provided by giver.
  Future<GenericResponse<GenericListResponse<List<NeedModel>>>>
  giverProvideList({required int page, required int pageSize, String? search});

  /// Submits an offer to provide a need.
  Future<GenericResponse<NeedModel>> giverProvideNeed(
    ProvideNeedReqeust request,
  );

  /// Lists needs created by taker.
  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> takerNeedsList({
    required int page,
    required int pageSize,
    String? search,
  });

  /// Creates a new need for taker.
  Future<GenericResponse<NeedModel>> takerNeedsCreate(NeedRequest request);

  /// Deletes a need by [id].
  Future<GenericResponse<NeedModel>> takerNeedsDelete(int id);
}

/// Implementation of [NeedsRemoteDataSource] using [NeedsApiService].
class NeedsRemoteDataSourceImpl implements NeedsRemoteDataSource {
  final NeedsApiService _apiService;

  /// Creates an instance of [NeedsRemoteDataSourceImpl].
  NeedsRemoteDataSourceImpl(this._apiService);

  @override
  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> getNeeds({
    required int page,
    required int pageSize,
    String? search,
  }) async {
    try {
      return await _apiService.needs(page, pageSize, search);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<GenericListResponse<List<NeedModel>>>>
  giverProvideList({
    required int page,
    required int pageSize,
    String? search,
  }) async {
    try {
      return await _apiService.giverProvideList(page, pageSize, search);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<NeedModel>> giverProvideNeed(
    ProvideNeedReqeust request,
  ) async {
    try {
      return await _apiService.giverProvideNeed(request);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> takerNeedsList({
    required int page,
    required int pageSize,
    String? search,
  }) async {
    try {
      return await _apiService.takerNeedsList(page, pageSize, search);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<NeedModel>> takerNeedsCreate(
    NeedRequest request,
  ) async {
    try {
      return await _apiService.takerNeedsCreate(request);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<NeedModel>> takerNeedsDelete(int id) async {
    try {
      return await _apiService.takerNeedsDelete(id);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
