import 'package:equatable/equatable.dart';

/// Clean domain entity representing an aid need.
class NeedEntity extends Equatable {
  /// Unique need ID.
  final int id;

  /// Name of the need.
  final String name;

  /// Optional brief description.
  final String? brief;

  /// Category name.
  final String categoryName;

  /// Associated points/weight value.
  final int point;

  /// Fulfillment status.
  final bool granted;

  /// Creates a [NeedEntity].
  const NeedEntity({
    required this.id,
    required this.name,
    this.brief,
    required this.categoryName,
    required this.point,
    required this.granted,
  });

  @override
  List<Object?> get props => [id, name, brief, categoryName, point, granted];
}
