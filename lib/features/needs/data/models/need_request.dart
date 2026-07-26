import 'package:equatable/equatable.dart';

/// Request DTO for creating a new need (Taker).
class NeedRequest extends Equatable {
  /// Name of the requested item/need.
  final String name;

  /// Optional list of image IDs.
  final List<int>? images;

  /// Brief explanation of the need.
  final String brief;

  /// Category ID.
  final int category;

  /// Creates a [NeedRequest] instance.
  const NeedRequest({
    required this.name,
    this.images,
    required this.brief,
    required this.category,
  });

  /// Factory constructor for creating a [NeedRequest] from JSON.
  factory NeedRequest.fromJson(Map<String, dynamic> json) => NeedRequest(
    name: json['name'] as String,
    images: json['images'] != null
        ? (json['images'] as List).map((e) => e as int).toList()
        : null,
    brief: json['brief'] as String,
    category: json['category'] as int,
  );

  /// Converts a [NeedRequest] into a JSON map.
  Map<String, dynamic> toJson() => {
    'name': name,
    'images': images,
    'brief': brief,
    'category': category,
  };

  /// Creates a copy of [NeedRequest] with optional new values.
  NeedRequest copyWith({
    String? name,
    List<int>? images,
    String? brief,
    int? category,
  }) => NeedRequest(
    name: name ?? this.name,
    images: images ?? this.images,
    brief: brief ?? this.brief,
    category: category ?? this.category,
  );

  @override
  List<Object?> get props => [name, images, brief, category];
}
