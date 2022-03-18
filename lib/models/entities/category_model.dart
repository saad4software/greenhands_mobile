import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';

import '../entities/image_model.dart';

@immutable
class CategoryModel {

  const CategoryModel({
    required this.name,
    required this.id,
    this.iconModel,
  });

  final String name;
  final int id;
  final ImageModel? iconModel;

  factory CategoryModel.fromJson(Map<String,dynamic> json) => CategoryModel(
    name: json['name'] as String,
    id: json['id'] as int,
    iconModel: json['icon_model'] != null ? ImageModel.fromJson(json['icon_model'] as Map<String, dynamic>) : null
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'icon_model': iconModel?.toJson()
  };

  CategoryModel clone() => CategoryModel(
    name: name,
    id: id,
    iconModel: iconModel?.clone()
  );


  CategoryModel copyWith({
    String? name,
    int? id,
    Optional<ImageModel?>? iconModel
  }) => CategoryModel(
    name: name ?? this.name,
    id: id ?? this.id,
    iconModel: checkOptional(iconModel, this.iconModel),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is CategoryModel && name == other.name && id == other.id && iconModel == other.iconModel;

  @override
  int get hashCode => name.hashCode ^ id.hashCode ^ iconModel.hashCode;

}
