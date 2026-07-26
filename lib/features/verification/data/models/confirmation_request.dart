import 'package:equatable/equatable.dart';

/// Request DTO for responding/confirming a request (Organizer).
class ConfirmationRequest extends Equatable {
  /// Target request ID.
  final int requestId;

  /// Response status string.
  final String status;

  /// Response message.
  final String message;

  /// Creates a [ConfirmationRequest] instance.
  const ConfirmationRequest({
    required this.requestId,
    required this.status,
    required this.message,
  });

  /// Factory constructor for creating a [ConfirmationRequest] from JSON.
  factory ConfirmationRequest.fromJson(Map<String, dynamic> json) =>
      ConfirmationRequest(
        requestId: json['request_id'] as int,
        status: json['status'] as String,
        message: json['message'] as String,
      );

  /// Converts a [ConfirmationRequest] into a JSON map.
  Map<String, dynamic> toJson() => {
    'request_id': requestId,
    'status': status,
    'message': message,
  };

  /// Creates a copy of [ConfirmationRequest] with optional new values.
  ConfirmationRequest copyWith({
    int? requestId,
    String? status,
    String? message,
  }) => ConfirmationRequest(
    requestId: requestId ?? this.requestId,
    status: status ?? this.status,
    message: message ?? this.message,
  );

  @override
  List<Object?> get props => [requestId, status, message];
}
