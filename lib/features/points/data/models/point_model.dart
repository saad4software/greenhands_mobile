import 'package:equatable/equatable.dart';
import '../../../needs/data/models/need_model.dart';
import '../../../profile/data/models/image_model.dart';

/// DTO representing a collection / drop-off point.
class PointModel extends Equatable {
  /// Name of the point.
  final String name;

  /// Optional list of images.
  final List<ImageModel>? images;

  /// Latitude coordinate.
  final double lat;

  /// Longitude coordinate.
  final double lng;

  /// Optional brief description.
  final String? brief;

  /// Unique point ID.
  final int id;

  /// Physical address string.
  final String address;

  /// Optional list of associated needs.
  final List<NeedModel>? needsList;

  /// Creates a [PointModel] instance.
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

  /// Factory constructor for creating a [PointModel] from JSON.
  factory PointModel.fromJson(Map<String, dynamic> json) => PointModel(
    name: json['name'] as String,
    images: json['images'] != null
        ? (json['images'] as List)
              .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList()
        : null,
    lat: (json['lat'] as num).toDouble(),
    lng: (json['lng'] as num).toDouble(),
    brief: json['brief'] as String?,
    id: json['id'] as int,
    address: json['address'] as String,
    needsList: json['needs_list'] != null
        ? (json['needs_list'] as List)
              .map((e) => NeedModel.fromJson(e as Map<String, dynamic>))
              .toList()
        : null,
  );

  /// Converts a [PointModel] into a JSON map.
  Map<String, dynamic> toJson() => {
    'name': name,
    'images': images?.map((e) => e.toJson()).toList(),
    'lat': lat,
    'lng': lng,
    'brief': brief,
    'id': id,
    'address': address,
    'needs_list': needsList?.map((e) => e.toJson()).toList(),
  };

  /// Creates a copy of [PointModel] with optional new values.
  PointModel copyWith({
    String? name,
    List<ImageModel>? images,
    double? lat,
    double? lng,
    String? brief,
    int? id,
    String? address,
    List<NeedModel>? needsList,
  }) => PointModel(
    name: name ?? this.name,
    images: images ?? this.images,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    brief: brief ?? this.brief,
    id: id ?? this.id,
    address: address ?? this.address,
    needsList: needsList ?? this.needsList,
  );

  @override
  List<Object?> get props => [
    name,
    images,
    lat,
    lng,
    brief,
    id,
    address,
    needsList,
  ];
}
