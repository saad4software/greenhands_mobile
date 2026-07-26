import 'package:dio/dio.dart';
import '../constants/api_endpoints.dart';
import '../constants/app_constants.dart';

/// Configured [Dio] client for managing network requests.
class DioClient {
  /// Internal [Dio] instance.
  final Dio _dio;

  /// Creates a [DioClient] instance with custom options and interceptors.
  DioClient({Dio? dio})
    : _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: ApiEndpoints.baseUrl,
              connectTimeout: const Duration(
                milliseconds: AppConstants.connectTimeout,
              ),
              receiveTimeout: const Duration(
                milliseconds: AppConstants.receiveTimeout,
              ),
              headers: <String, String>{
                'Content-Type': 'application/json',
                'Accept': 'application/json',
              },
            ),
          ) {
    _dio.interceptors.add(
      LogInterceptor(requestBody: true, responseBody: true),
    );
  }

  /// Exposes underlying [Dio] instance.
  Dio get dio => _dio;

  /// Executes GET request.
  Future<Response<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.get<T>(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  /// Executes POST request.
  Future<Response<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    return _dio.post<T>(
      path,
      data: data,
      queryParameters: queryParameters,
      options: options,
    );
  }
}
