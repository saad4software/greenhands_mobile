import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';

import '../entities/image_model.dart';
import '../entities/category_model.dart';

@immutable
class NeedModel {

  const NeedModel({
    required this.name,
    required this.id,
    this.images,
    this.brief,
    required this.categoryModel,
    required this.point,
    required this.granted,
  });

  final String name;
  final int id;
  final List<ImageModel>? images;
  final String? brief;
  final CategoryModel categoryModel;
  final int point;
  final bool granted;

  factory NeedModel.fromJson(Map<String,dynamic> json) => NeedModel(
    name: json['name'] as String,
    id: json['id'] as int,
    images: json['images'] != null ? (json['images'] as List? ?? []).map((e) => ImageModel.fromJson(e as Map<String, dynamic>)).toList() : null,
    brief: json['brief'] != null ? json['brief'] as String : null,
    categoryModel: CategoryModel.fromJson(json['category_model'] as Map<String, dynamic>),
    point: json['point'] as int,
    granted: json['granted'] as bool
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'id': id,
    'images': images?.map((e) => e.toJson()).toList(),
    'brief': brief,
    'category_model': categoryModel.toJson(),
    'point': point,
    'granted': granted
  };

  NeedModel clone() => NeedModel(
    name: name,
    id: id,
    images: images?.map((e) => e.clone()).toList(),
    brief: brief,
    categoryModel: categoryModel.clone(),
    point: point,
    granted: granted
  );


  NeedModel copyWith({
    String? name,
    int? id,
    Optional<List<ImageModel>?>? images,
    Optional<String?>? brief,
    CategoryModel? categoryModel,
    int? point,
    bool? granted
  }) => NeedModel(
    name: name ?? this.name,
    id: id ?? this.id,
    images: checkOptional(images, this.images),
    brief: checkOptional(brief, this.brief),
    categoryModel: categoryModel ?? this.categoryModel,
    point: point ?? this.point,
    granted: granted ?? this.granted,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is NeedModel && name == other.name && id == other.id && images == other.images && brief == other.brief && categoryModel == other.categoryModel && point == other.point && granted == other.granted;

  @override
  int get hashCode => name.hashCode ^ id.hashCode ^ images.hashCode ^ brief.hashCode ^ categoryModel.hashCode ^ point.hashCode ^ granted.hashCode;

}
