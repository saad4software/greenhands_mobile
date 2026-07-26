import '../../../../core/error/exceptions.dart';
import '../models/geo_location_response.dart';
import 'location_api_service.dart';

/// Contract for Location remote data source.
abstract class LocationRemoteDataSource {
  /// Fetches IP geolocation data.
  Future<GeoLocationResponse> getGeoLocation();
}

/// Implementation of [LocationRemoteDataSource] using [LocationApiService].
class LocationRemoteDataSourceImpl implements LocationRemoteDataSource {
  final LocationApiService _apiService;

  /// Creates an instance of [LocationRemoteDataSourceImpl].
  LocationRemoteDataSourceImpl(this._apiService);

  @override
  Future<GeoLocationResponse> getGeoLocation() async {
    try {
      return await _apiService.geoLocation();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
