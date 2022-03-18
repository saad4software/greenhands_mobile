import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ImageModel {

  const ImageModel({
    required this.created,
    required this.datafile,
    required this.width,
    required this.height,
    required this.name,
    required this.id,
  });

  final DateTime created;
  final String datafile;
  final int width;
  final int height;
  final String name;
  final int id;

  factory ImageModel.fromJson(Map<String,dynamic> json) => ImageModel(
    created: DateTime.parse(json['created'] as String),
    datafile: json['datafile'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
    name: json['name'] as String,
    id: json['id'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'created': created.toIso8601String(),
    'datafile': datafile,
    'width': width,
    'height': height,
    'name': name,
    'id': id
  };

  ImageModel clone() => ImageModel(
    created: created,
    datafile: datafile,
    width: width,
    height: height,
    name: name,
    id: id
  );


  ImageModel copyWith({
    DateTime? created,
    String? datafile,
    int? width,
    int? height,
    String? name,
    int? id
  }) => ImageModel(
    created: created ?? this.created,
    datafile: datafile ?? this.datafile,
    width: width ?? this.width,
    height: height ?? this.height,
    name: name ?? this.name,
    id: id ?? this.id,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ImageModel && created == other.created && datafile == other.datafile && width == other.width && height == other.height && name == other.name && id == other.id;

  @override
  int get hashCode => created.hashCode ^ datafile.hashCode ^ width.hashCode ^ height.hashCode ^ name.hashCode ^ id.hashCode;

}
