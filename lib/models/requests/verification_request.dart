import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class VerificationRequest {

  const VerificationRequest({
    required this.organizerId,
    required this.message,
  });

  final int organizerId;
  final String message;

  factory VerificationRequest.fromJson(Map<String,dynamic> json) => VerificationRequest(
    organizerId: json['organizer_id'] as int,
    message: json['message'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'organizer_id': organizerId,
    'message': message
  };

  VerificationRequest clone() => VerificationRequest(
    organizerId: organizerId,
    message: message
  );


  VerificationRequest copyWith({
    int? organizerId,
    String? message
  }) => VerificationRequest(
    organizerId: organizerId ?? this.organizerId,
    message: message ?? this.message,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is VerificationRequest && organizerId == other.organizerId && message == other.message;

  @override
  int get hashCode => organizerId.hashCode ^ message.hashCode;

}
