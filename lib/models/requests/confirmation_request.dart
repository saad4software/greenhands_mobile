import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ConfirmationRequest {

  const ConfirmationRequest({
    required this.requestId,
    required this.status,
    required this.message,
  });

  final int requestId;
  final String status;
  final String message;

  factory ConfirmationRequest.fromJson(Map<String,dynamic> json) => ConfirmationRequest(
    requestId: json['request_id'] as int,
    status: json['status'] as String,
    message: json['message'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'request_id': requestId,
    'status': status,
    'message': message
  };

  ConfirmationRequest clone() => ConfirmationRequest(
    requestId: requestId,
    status: status,
    message: message
  );


  ConfirmationRequest copyWith({
    int? requestId,
    String? status,
    String? message
  }) => ConfirmationRequest(
    requestId: requestId ?? this.requestId,
    status: status ?? this.status,
    message: message ?? this.message,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ConfirmationRequest && requestId == other.requestId && status == other.status && message == other.message;

  @override
  int get hashCode => requestId.hashCode ^ status.hashCode ^ message.hashCode;

}
