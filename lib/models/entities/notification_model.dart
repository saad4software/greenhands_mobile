import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class NotificationModel {

  const NotificationModel({
    required this.title,
    required this.brief,
    required this.created,
  });

  final String title;
  final String brief;
  final String created;

  factory NotificationModel.fromJson(Map<String,dynamic> json) => NotificationModel(
    title: json['title'] as String,
    brief: json['brief'] as String,
    created: json['created'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'title': title,
    'brief': brief,
    'created': created
  };

  NotificationModel clone() => NotificationModel(
    title: title,
    brief: brief,
    created: created
  );


  NotificationModel copyWith({
    String? title,
    String? brief,
    String? created
  }) => NotificationModel(
    title: title ?? this.title,
    brief: brief ?? this.brief,
    created: created ?? this.created,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is NotificationModel && title == other.title && brief == other.brief && created == other.created;

  @override
  int get hashCode => title.hashCode ^ brief.hashCode ^ created.hashCode;

}
