import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';

import '../entities/image_model.dart';
import '../entities/need_model.dart';

@immutable
class PointModel {

  const PointModel({
    required this.name,
    this.images,
    required this.lat,
    required this.lng,
    this.brief,
    required this.id,
    required this.address,
    this.needsList,
  });

  final String name;
  final List<ImageModel>? images;
  final double lat;
  final double lng;
  final String? brief;
  final int id;
  final String address;
  final List<NeedModel>? needsList;

  factory PointModel.fromJson(Map<String,dynamic> json) => PointModel(
    name: json['name'] as String,
    images: json['images'] != null ? (json['images'] as List? ?? []).map((e) => ImageModel.fromJson(e as Map<String, dynamic>)).toList() : null,
    lat: json['lat'] as double,
    lng: json['lng'] as double,
    brief: json['brief'] != null ? json['brief'] as String : null,
    id: json['id'] as int,
    address: json['address'] as String,
    needsList: json['needs_list'] != null ? (json['needs_list'] as List? ?? []).map((e) => NeedModel.fromJson(e as Map<String, dynamic>)).toList() : null
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'images': images?.map((e) => e.toJson()).toList(),
    'lat': lat,
    'lng': lng,
    'brief': brief,
    'id': id,
    'address': address,
    'needs_list': needsList?.map((e) => e.toJson()).toList()
  };

  PointModel clone() => PointModel(
    name: name,
    images: images?.map((e) => e.clone()).toList(),
    lat: lat,
    lng: lng,
    brief: brief,
    id: id,
    address: address,
    needsList: needsList?.map((e) => e.clone()).toList()
  );


  PointModel copyWith({
    String? name,
    Optional<List<ImageModel>?>? images,
    double? lat,
    double? lng,
    Optional<String?>? brief,
    int? id,
    String? address,
    Optional<List<NeedModel>?>? needsList
  }) => PointModel(
    name: name ?? this.name,
    images: checkOptional(images, this.images),
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    brief: checkOptional(brief, this.brief),
    id: id ?? this.id,
    address: address ?? this.address,
    needsList: checkOptional(needsList, this.needsList),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is PointModel && name == other.name && images == other.images && lat == other.lat && lng == other.lng && brief == other.brief && id == other.id && address == other.address && needsList == other.needsList;

  @override
  int get hashCode => name.hashCode ^ images.hashCode ^ lat.hashCode ^ lng.hashCode ^ brief.hashCode ^ id.hashCode ^ address.hashCode ^ needsList.hashCode;

}
