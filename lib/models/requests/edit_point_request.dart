import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class EditPointRequest {

  const EditPointRequest({
    required this.name,
    required this.images,
    required this.lat,
    required this.lng,
    required this.brief,
    required this.address,
  });

  final String name;
  final List<int> images;
  final double lat;
  final double lng;
  final String brief;
  final String address;

  factory EditPointRequest.fromJson(Map<String,dynamic> json) => EditPointRequest(
    name: json['name'] as String,
    images: (json['images'] as List? ?? []).map((e) => e as int).toList(),
    lat: json['lat'] as double,
    lng: json['lng'] as double,
    brief: json['brief'] as String,
    address: json['address'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'images': images.map((e) => e.toString()).toList(),
    'lat': lat,
    'lng': lng,
    'brief': brief,
    'address': address
  };

  EditPointRequest clone() => EditPointRequest(
    name: name,
    images: images.toList(),
    lat: lat,
    lng: lng,
    brief: brief,
    address: address
  );


  EditPointRequest copyWith({
    String? name,
    List<int>? images,
    double? lat,
    double? lng,
    String? brief,
    String? address
  }) => EditPointRequest(
    name: name ?? this.name,
    images: images ?? this.images,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    brief: brief ?? this.brief,
    address: address ?? this.address,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is EditPointRequest && name == other.name && images == other.images && lat == other.lat && lng == other.lng && brief == other.brief && address == other.address;

  @override
  int get hashCode => name.hashCode ^ images.hashCode ^ lat.hashCode ^ lng.hashCode ^ brief.hashCode ^ address.hashCode;

}
