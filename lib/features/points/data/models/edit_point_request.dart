import 'package:equatable/equatable.dart';

/// Request DTO for editing a point.
class EditPointRequest extends Equatable {
  /// Name of the point.
  final String name;

  /// List of image IDs.
  final List<int> images;

  /// Latitude coordinate.
  final double lat;

  /// Longitude coordinate.
  final double lng;

  /// Brief description of the point.
  final String brief;

  /// Physical address string.
  final String address;

  /// Creates an [EditPointRequest] instance.
  const EditPointRequest({
    required this.name,
    required this.images,
    required this.lat,
    required this.lng,
    required this.brief,
    required this.address,
  });

  /// Factory constructor for creating an [EditPointRequest] from JSON.
  factory EditPointRequest.fromJson(Map<String, dynamic> json) =>
      EditPointRequest(
        name: json['name'] as String,
        images: (json['images'] as List).map((e) => e as int).toList(),
        lat: (json['lat'] as num).toDouble(),
        lng: (json['lng'] as num).toDouble(),
        brief: json['brief'] as String,
        address: json['address'] as String,
      );

  /// Converts an [EditPointRequest] into a JSON map.
  Map<String, dynamic> toJson() => {
    'name': name,
    'images': images.map((e) => e.toString()).toList(),
    'lat': lat,
    'lng': lng,
    'brief': brief,
    'address': address,
  };

  /// Creates a copy of [EditPointRequest] with optional new values.
  EditPointRequest copyWith({
    String? name,
    List<int>? images,
    double? lat,
    double? lng,
    String? brief,
    String? address,
  }) => EditPointRequest(
    name: name ?? this.name,
    images: images ?? this.images,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    brief: brief ?? this.brief,
    address: address ?? this.address,
  );

  @override
  List<Object?> get props => [name, images, lat, lng, brief, address];
}
