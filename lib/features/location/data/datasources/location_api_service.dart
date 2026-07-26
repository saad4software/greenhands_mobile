import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../models/geo_location_response.dart';

part 'location_api_service.g.dart';

/// Retrofit REST client interface for IP Geolocation endpoint.
@RestApi()
abstract class LocationApiService {
  /// Factory constructor for [LocationApiService].
  factory LocationApiService(Dio dio, {String baseUrl}) = _LocationApiService;

  /// Fetches IP geolocation data.
  @GET(ApiEndpoints.geoLocation)
  Future<GeoLocationResponse> geoLocation();
}
