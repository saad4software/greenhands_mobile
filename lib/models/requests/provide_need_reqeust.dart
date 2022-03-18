import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ProvideNeedReqeust {

  const ProvideNeedReqeust({
    required this.needId,
    required this.message,
  });

  final int needId;
  final String message;

  factory ProvideNeedReqeust.fromJson(Map<String,dynamic> json) => ProvideNeedReqeust(
    needId: json['need_id'] as int,
    message: json['message'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'need_id': needId,
    'message': message
  };

  ProvideNeedReqeust clone() => ProvideNeedReqeust(
    needId: needId,
    message: message
  );


  ProvideNeedReqeust copyWith({
    int? needId,
    String? message
  }) => ProvideNeedReqeust(
    needId: needId ?? this.needId,
    message: message ?? this.message,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ProvideNeedReqeust && needId == other.needId && message == other.message;

  @override
  int get hashCode => needId.hashCode ^ message.hashCode;

}
