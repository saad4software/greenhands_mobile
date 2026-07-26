import 'package:equatable/equatable.dart';
import '../../../profile/data/models/image_model.dart';

/// DTO representing an item category.
class CategoryModel extends Equatable {
  /// Name of the category.
  final String name;

  /// Unique category ID.
  final int id;

  /// Optional icon image model.
  final ImageModel? iconModel;

  /// Creates a [CategoryModel] instance.
  const CategoryModel({required this.name, required this.id, this.iconModel});

  /// Factory constructor for creating a [CategoryModel] from JSON.
  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
    name: json['name'] as String,
    id: json['id'] as int,
    iconModel: json['icon_model'] != null
        ? ImageModel.fromJson(json['icon_model'] as Map<String, dynamic>)
        : null,
  );

  /// Converts a [CategoryModel] into a JSON map.
  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'icon_model': iconModel?.toJson(),
  };

  /// Creates a copy of [CategoryModel] with optional new values.
  CategoryModel copyWith({String? name, int? id, ImageModel? iconModel}) =>
      CategoryModel(
        name: name ?? this.name,
        id: id ?? this.id,
        iconModel: iconModel ?? this.iconModel,
      );

  @override
  List<Object?> get props => [name, id, iconModel];
}
