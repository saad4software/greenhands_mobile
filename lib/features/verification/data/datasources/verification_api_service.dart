import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/models/generic_list_response.dart';
import '../../../../core/network/models/generic_response.dart';
import '../models/confirmation_request.dart';
import '../models/verification_request.dart';
import '../models/verification_request_model.dart';

part 'verification_api_service.g.dart';

/// Retrofit REST client interface for Verification & Confirmation endpoints.
@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class VerificationApiService {
  /// Factory constructor for [VerificationApiService].
  factory VerificationApiService(Dio dio, {String baseUrl}) =
      _VerificationApiService;

  /// Lists verification requests created by taker.
  @GET(ApiEndpoints.takerVerify)
  Future<GenericResponse<GenericListResponse<List<VerificationRequestModel>>>>
  takerVerificationRequestsList(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('search') String? search,
  );

  /// Creates a verification request (Taker).
  @POST(ApiEndpoints.takerVerify)
  Future<GenericResponse<VerificationRequestModel>>
  takerVerificationRequestsCreate(@Body() VerificationRequest request);

  /// Lists requests received by organizer.
  @GET(ApiEndpoints.organizerRequests)
  Future<GenericResponse<GenericListResponse<List<VerificationRequestModel>>>>
  organizerVerificationRequestsList(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('search') String? search,
  );

  /// Responds/confirms a request (Organizer).
  @POST(ApiEndpoints.organizerRequests)
  Future<GenericResponse<VerificationRequestModel>>
  organizerVerificationRequestsCreate(@Body() ConfirmationRequest request);
}
