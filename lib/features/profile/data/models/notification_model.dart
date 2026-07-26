import 'package:equatable/equatable.dart';

/// DTO representing a user notification.
class NotificationModel extends Equatable {
  /// Notification title string.
  final String title;

  /// Brief notification content summary.
  final String brief;

  /// Created date string.
  final String created;

  /// Creates a [NotificationModel] instance.
  const NotificationModel({
    required this.title,
    required this.brief,
    required this.created,
  });

  /// Factory constructor for creating a [NotificationModel] from JSON.
  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        title: json['title'] as String,
        brief: json['brief'] as String,
        created: json['created'] as String,
      );

  /// Converts a [NotificationModel] into a JSON map.
  Map<String, dynamic> toJson() => {
    'title': title,
    'brief': brief,
    'created': created,
  };

  /// Creates a copy of [NotificationModel] with optional new values.
  NotificationModel copyWith({String? title, String? brief, String? created}) =>
      NotificationModel(
        title: title ?? this.title,
        brief: brief ?? this.brief,
        created: created ?? this.created,
      );

  @override
  List<Object?> get props => [title, brief, created];
}
