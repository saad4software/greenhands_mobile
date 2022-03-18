import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class NeedRequest {

  const NeedRequest({
    required this.name,
    this.images,
    required this.brief,
    required this.category,
  });

  final String name;
  final List<int>? images;
  final String brief;
  final int category;

  factory NeedRequest.fromJson(Map<String,dynamic> json) => NeedRequest(
    name: json['name'] as String,
    images: json['images'] != null ? (json['images'] as List? ?? []).map((e) => e as int).toList() : null,
    brief: json['brief'] as String,
    category: json['category'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'images': images?.map((e) => e.toString()).toList(),
    'brief': brief,
    'category': category
  };

  NeedRequest clone() => NeedRequest(
    name: name,
    images: images?.toList(),
    brief: brief,
    category: category
  );


  NeedRequest copyWith({
    String? name,
    Optional<List<int>?>? images,
    String? brief,
    int? category
  }) => NeedRequest(
    name: name ?? this.name,
    images: checkOptional(images, this.images),
    brief: brief ?? this.brief,
    category: category ?? this.category,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is NeedRequest && name == other.name && images == other.images && brief == other.brief && category == other.category;

  @override
  int get hashCode => name.hashCode ^ images.hashCode ^ brief.hashCode ^ category.hashCode;

}
