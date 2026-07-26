import 'package:equatable/equatable.dart';

/// Response DTO for external IP geolocation endpoint.
class GeoLocationResponse extends Equatable {
  /// Query status string (e.g. 'success').
  final String status;

  /// Country name.
  final String country;

  /// ISO country code.
  final String countryCode;

  /// Region code string.
  final String region;

  /// Region name string.
  final String regionName;

  /// City name.
  final String city;

  /// Postal/Zip code string.
  final String zip;

  /// Latitude coordinate.
  final double lat;

  /// Longitude coordinate.
  final double lon;

  /// Timezone identifier string.
  final String timezone;

  /// Internet Service Provider string.
  final String isp;

  /// Organization name string.
  final String org;

  /// AS number and name.
  final String as;

  /// IP address queried.
  final String query;

  /// Creates a [GeoLocationResponse] instance.
  const GeoLocationResponse({
    required this.status,
    required this.country,
    required this.countryCode,
    required this.region,
    required this.regionName,
    required this.city,
    required this.zip,
    required this.lat,
    required this.lon,
    required this.timezone,
    required this.isp,
    required this.org,
    required this.as,
    required this.query,
  });

  /// Factory constructor for creating a [GeoLocationResponse] from JSON.
  factory GeoLocationResponse.fromJson(Map<String, dynamic> json) =>
      GeoLocationResponse(
        status: json['status'] as String,
        country: json['country'] as String,
        countryCode: json['countryCode'] as String,
        region: json['region'] as String,
        regionName: json['regionName'] as String,
        city: json['city'] as String,
        zip: json['zip'] as String,
        lat: (json['lat'] as num).toDouble(),
        lon: (json['lon'] as num).toDouble(),
        timezone: json['timezone'] as String,
        isp: json['isp'] as String,
        org: json['org'] as String,
        as: json['as'] as String,
        query: json['query'] as String,
      );

  /// Converts a [GeoLocationResponse] into a JSON map.
  Map<String, dynamic> toJson() => {
    'status': status,
    'country': country,
    'countryCode': countryCode,
    'region': region,
    'regionName': regionName,
    'city': city,
    'zip': zip,
    'lat': lat,
    'lon': lon,
    'timezone': timezone,
    'isp': isp,
    'org': org,
    'as': as,
    'query': query,
  };

  /// Creates a copy of [GeoLocationResponse] with optional new values.
  GeoLocationResponse copyWith({
    String? status,
    String? country,
    String? countryCode,
    String? region,
    String? regionName,
    String? city,
    String? zip,
    double? lat,
    double? lon,
    String? timezone,
    String? isp,
    String? org,
    String? as,
    String? query,
  }) => GeoLocationResponse(
    status: status ?? this.status,
    country: country ?? this.country,
    countryCode: countryCode ?? this.countryCode,
    region: region ?? this.region,
    regionName: regionName ?? this.regionName,
    city: city ?? this.city,
    zip: zip ?? this.zip,
    lat: lat ?? this.lat,
    lon: lon ?? this.lon,
    timezone: timezone ?? this.timezone,
    isp: isp ?? this.isp,
    org: org ?? this.org,
    as: as ?? this.as,
    query: query ?? this.query,
  );

  @override
  List<Object?> get props => [
    status,
    country,
    countryCode,
    region,
    regionName,
    city,
    zip,
    lat,
    lon,
    timezone,
    isp,
    org,
    as,
    query,
  ];
}
