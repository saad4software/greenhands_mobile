import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/models/generic_response.dart';
import '../../../profile/data/models/profile_model.dart';
import '../models/anonymous_login_request.dart';
import '../models/login_request.dart';
import '../models/register_request.dart';
import '../models/token_model.dart';

part 'auth_api_service.g.dart';

/// Retrofit REST client interface for Auth endpoints.
@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class AuthApiService {
  /// Factory constructor for [AuthApiService].
  factory AuthApiService(Dio dio, {String baseUrl}) = _AuthApiService;

  /// User login endpoint.
  @POST(ApiEndpoints.login)
  Future<GenericResponse<TokenModel>> login(@Body() LoginRequest request);

  /// Anonymous login endpoint.
  @POST(ApiEndpoints.anonymousLogin)
  Future<GenericResponse<TokenModel>> anonymousLogin(
    @Body() AnonymousLoginRequest request,
  );

  /// User registration endpoint.
  @POST(ApiEndpoints.register)
  Future<GenericResponse<ProfileModel>> register(
    @Body() RegisterRequest request,
  );
}
