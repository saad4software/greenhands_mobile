import '../../../../core/error/exceptions.dart';
import '../../../../core/network/models/generic_response.dart';
import '../../../profile/data/models/profile_model.dart';
import '../models/anonymous_login_request.dart';
import '../models/login_request.dart';
import '../models/register_request.dart';
import '../models/token_model.dart';
import 'auth_api_service.dart';

/// Contract for Auth remote data source.
abstract class AuthRemoteDataSource {
  /// Authenticates user with username and password.
  Future<GenericResponse<TokenModel>> login(LoginRequest request);

  /// Authenticates device anonymously.
  Future<GenericResponse<TokenModel>> anonymousLogin(
    AnonymousLoginRequest request,
  );

  /// Registers a new user.
  Future<GenericResponse<ProfileModel>> register(RegisterRequest request);
}

/// Implementation of [AuthRemoteDataSource] delegating to [AuthApiService].
class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final AuthApiService _apiService;

  /// Creates an instance of [AuthRemoteDataSourceImpl].
  AuthRemoteDataSourceImpl(this._apiService);

  @override
  Future<GenericResponse<TokenModel>> login(LoginRequest request) async {
    try {
      return await _apiService.login(request);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<TokenModel>> anonymousLogin(
    AnonymousLoginRequest request,
  ) async {
    try {
      return await _apiService.anonymousLogin(request);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<ProfileModel>> register(
    RegisterRequest request,
  ) async {
    try {
      return await _apiService.register(request);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
