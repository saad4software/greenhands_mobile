import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/home_entity.dart';

part 'home_model.g.dart';

/// Data Transfer Object for Home data payload.
@JsonSerializable()
class HomeModel extends HomeEntity {
  /// Creates a [HomeModel].
  const HomeModel({
    required super.title,
    required super.description,
    required super.activeProjectsCount,
  });

  /// Factory constructor creating [HomeModel] from JSON map.
  factory HomeModel.fromJson(Map<String, dynamic> json) =>
      _$HomeModelFromJson(json);

  /// Converts [HomeModel] to JSON map.
  Map<String, dynamic> toJson() => _$HomeModelToJson(this);
}
