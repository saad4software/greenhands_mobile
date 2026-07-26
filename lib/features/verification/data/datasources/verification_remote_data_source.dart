import '../../../../core/error/exceptions.dart';
import '../../../../core/network/models/generic_list_response.dart';
import '../../../../core/network/models/generic_response.dart';
import '../models/confirmation_request.dart';
import '../models/verification_request.dart';
import '../models/verification_request_model.dart';
import 'verification_api_service.dart';

/// Contract for Verification remote data source.
abstract class VerificationRemoteDataSource {
  /// Lists verification requests created by taker.
  Future<GenericResponse<GenericListResponse<List<VerificationRequestModel>>>>
  takerVerificationRequestsList({
    required int page,
    required int pageSize,
    String? search,
  });

  /// Creates a verification request (Taker).
  Future<GenericResponse<VerificationRequestModel>>
  takerVerificationRequestsCreate(VerificationRequest request);

  /// Lists requests received by organizer.
  Future<GenericResponse<GenericListResponse<List<VerificationRequestModel>>>>
  organizerVerificationRequestsList({
    required int page,
    required int pageSize,
    String? search,
  });

  /// Responds/confirms a request (Organizer).
  Future<GenericResponse<VerificationRequestModel>>
  organizerVerificationRequestsCreate(ConfirmationRequest request);
}

/// Implementation of [VerificationRemoteDataSource] using [VerificationApiService].
class VerificationRemoteDataSourceImpl implements VerificationRemoteDataSource {
  final VerificationApiService _apiService;

  /// Creates an instance of [VerificationRemoteDataSourceImpl].
  VerificationRemoteDataSourceImpl(this._apiService);

  @override
  Future<GenericResponse<GenericListResponse<List<VerificationRequestModel>>>>
  takerVerificationRequestsList({
    required int page,
    required int pageSize,
    String? search,
  }) async {
    try {
      return await _apiService.takerVerificationRequestsList(
        page,
        pageSize,
        search,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<VerificationRequestModel>>
  takerVerificationRequestsCreate(VerificationRequest request) async {
    try {
      return await _apiService.takerVerificationRequestsCreate(request);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<GenericListResponse<List<VerificationRequestModel>>>>
  organizerVerificationRequestsList({
    required int page,
    required int pageSize,
    String? search,
  }) async {
    try {
      return await _apiService.organizerVerificationRequestsList(
        page,
        pageSize,
        search,
      );
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<VerificationRequestModel>>
  organizerVerificationRequestsCreate(ConfirmationRequest request) async {
    try {
      return await _apiService.organizerVerificationRequestsCreate(request);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
