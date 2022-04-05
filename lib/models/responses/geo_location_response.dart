import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class GeoLocationResponse {

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

  final String status;
  final String country;
  final String countryCode;
  final String region;
  final String regionName;
  final String city;
  final String zip;
  final double lat;
  final double lon;
  final String timezone;
  final String isp;
  final String org;
  final String as;
  final String query;

  factory GeoLocationResponse.fromJson(Map<String,dynamic> json) => GeoLocationResponse(
    status: json['status'] as String,
    country: json['country'] as String,
    countryCode: json['countryCode'] as String,
    region: json['region'] as String,
    regionName: json['regionName'] as String,
    city: json['city'] as String,
    zip: json['zip'] as String,
    lat: json['lat'] as double,
    lon: json['lon'] as double,
    timezone: json['timezone'] as String,
    isp: json['isp'] as String,
    org: json['org'] as String,
    as: json['as'] as String,
    query: json['query'] as String
  );
  
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
    'query': query
  };

  GeoLocationResponse clone() => GeoLocationResponse(
    status: status,
    country: country,
    countryCode: countryCode,
    region: region,
    regionName: regionName,
    city: city,
    zip: zip,
    lat: lat,
    lon: lon,
    timezone: timezone,
    isp: isp,
    org: org,
    as: as,
    query: query
  );


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
    String? query
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
  bool operator ==(Object other) => identical(this, other)
    || other is GeoLocationResponse && status == other.status && country == other.country && countryCode == other.countryCode && region == other.region && regionName == other.regionName && city == other.city && zip == other.zip && lat == other.lat && lon == other.lon && timezone == other.timezone && isp == other.isp && org == other.org && as == other.as && query == other.query;

  @override
  int get hashCode => status.hashCode ^ country.hashCode ^ countryCode.hashCode ^ region.hashCode ^ regionName.hashCode ^ city.hashCode ^ zip.hashCode ^ lat.hashCode ^ lon.hashCode ^ timezone.hashCode ^ isp.hashCode ^ org.hashCode ^ as.hashCode ^ query.hashCode;

}
