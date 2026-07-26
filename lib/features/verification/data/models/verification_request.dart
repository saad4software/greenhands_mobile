import 'package:equatable/equatable.dart';

/// Request DTO for creating a verification request (Taker).
class VerificationRequest extends Equatable {
  /// Target organizer ID.
  final int organizerId;

  /// Verification message.
  final String message;

  /// Creates a [VerificationRequest] instance.
  const VerificationRequest({required this.organizerId, required this.message});

  /// Factory constructor for creating a [VerificationRequest] from JSON.
  factory VerificationRequest.fromJson(Map<String, dynamic> json) =>
      VerificationRequest(
        organizerId: json['organizer_id'] as int,
        message: json['message'] as String,
      );

  /// Converts a [VerificationRequest] into a JSON map.
  Map<String, dynamic> toJson() => {
    'organizer_id': organizerId,
    'message': message,
  };

  /// Creates a copy of [VerificationRequest] with optional new values.
  VerificationRequest copyWith({int? organizerId, String? message}) =>
      VerificationRequest(
        organizerId: organizerId ?? this.organizerId,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [organizerId, message];
}
