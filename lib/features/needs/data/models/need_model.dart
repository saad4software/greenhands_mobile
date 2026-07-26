import 'package:equatable/equatable.dart';
import '../../../categories/data/models/category_model.dart';
import '../../../profile/data/models/image_model.dart';

/// DTO representing an aid need item.
class NeedModel extends Equatable {
  /// Name of the need.
  final String name;

  /// Unique need ID.
  final int id;

  /// Optional list of associated image models.
  final List<ImageModel>? images;

  /// Optional brief description.
  final String? brief;

  /// Category model object.
  final CategoryModel categoryModel;

  /// Point value or associated point ID.
  final int point;

  /// Whether the need has been granted/fulfilled.
  final bool granted;

  /// Creates a [NeedModel] instance.
  const NeedModel({
    required this.name,
    required this.id,
    this.images,
    this.brief,
    required this.categoryModel,
    required this.point,
    required this.granted,
  });

  /// Factory constructor for creating a [NeedModel] from JSON.
  factory NeedModel.fromJson(Map<String, dynamic> json) => NeedModel(
    name: json['name'] as String,
    id: json['id'] as int,
    images: json['images'] != null
        ? (json['images'] as List)
              .map((e) => ImageModel.fromJson(e as Map<String, dynamic>))
              .toList()
        : null,
    brief: json['brief'] as String?,
    categoryModel: CategoryModel.fromJson(
      json['category_model'] as Map<String, dynamic>,
    ),
    point: json['point'] as int,
    granted: json['granted'] as bool,
  );

  /// Converts a [NeedModel] into a JSON map.
  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'images': images?.map((e) => e.toJson()).toList(),
    'brief': brief,
    'category_model': categoryModel.toJson(),
    'point': point,
    'granted': granted,
  };

  /// Creates a copy of [NeedModel] with optional new values.
  NeedModel copyWith({
    String? name,
    int? id,
    List<ImageModel>? images,
    String? brief,
    CategoryModel? categoryModel,
    int? point,
    bool? granted,
  }) => NeedModel(
    name: name ?? this.name,
    id: id ?? this.id,
    images: images ?? this.images,
    brief: brief ?? this.brief,
    categoryModel: categoryModel ?? this.categoryModel,
    point: point ?? this.point,
    granted: granted ?? this.granted,
  );

  @override
  List<Object?> get props => [
    name,
    id,
    images,
    brief,
    categoryModel,
    point,
    granted,
  ];
}
