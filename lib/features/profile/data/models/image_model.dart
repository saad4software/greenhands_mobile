import 'package:equatable/equatable.dart';

/// DTO representing an uploaded image asset.
class ImageModel extends Equatable {
  /// Timestamp of creation.
  final DateTime created;

  /// File URL or data file path string.
  final String datafile;

  /// Image pixel width.
  final int width;

  /// Image pixel height.
  final int height;

  /// Image name.
  final String name;

  /// Unique image identifier.
  final int id;

  /// Creates an [ImageModel] instance.
  const ImageModel({
    required this.created,
    required this.datafile,
    required this.width,
    required this.height,
    required this.name,
    required this.id,
  });

  /// Factory constructor for creating an [ImageModel] from JSON.
  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
    created: DateTime.parse(json['created'] as String),
    datafile: json['datafile'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    name: json['name'] as String,
    id: json['id'] as int,
  );

  /// Converts an [ImageModel] into a JSON map.
  Map<String, dynamic> toJson() => {
    'created': created.toIso8601String(),
    'datafile': datafile,
    'width': width,
    'height': height,
    'name': name,
    'id': id,
  };

  /// Creates a copy of [ImageModel] with optional new values.
  ImageModel copyWith({
    DateTime? created,
    String? datafile,
    int? width,
    int? height,
    String? name,
    int? id,
  }) => ImageModel(
    created: created ?? this.created,
    datafile: datafile ?? this.datafile,
    width: width ?? this.width,
    height: height ?? this.height,
    name: name ?? this.name,
    id: id ?? this.id,
  );

  @override
  List<Object?> get props => [created, datafile, width, height, name, id];
}
