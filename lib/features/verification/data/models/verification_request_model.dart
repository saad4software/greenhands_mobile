import 'package:equatable/equatable.dart';
import '../../../profile/data/models/profile_model.dart';

/// DTO representing a verification request.
class VerificationRequestModel extends Equatable {
  /// Unique request ID.
  final int id;

  /// Verification status string (e.g. 'pending', 'approved').
  final String status;

  /// Created date string.
  final String created;

  /// Profile model of the sender.
  final ProfileModel senderModel;

  /// Additional message content.
  final String message;

  /// Creates a [VerificationRequestModel] instance.
  const VerificationRequestModel({
    required this.id,
    required this.status,
    required this.created,
    required this.senderModel,
    required this.message,
  });

  /// Factory constructor for creating a [VerificationRequestModel] from JSON.
  factory VerificationRequestModel.fromJson(Map<String, dynamic> json) =>
      VerificationRequestModel(
        id: json['id'] as int,
        status: json['status'] as String,
        created: json['created'] as String,
        senderModel: ProfileModel.fromJson(
          json['sender_model'] as Map<String, dynamic>,
        ),
        message: json['message'] as String,
      );

  /// Converts a [VerificationRequestModel] into a JSON map.
  Map<String, dynamic> toJson() => {
    'id': id,
    'status': status,
    'created': created,
    'sender_model': senderModel.toJson(),
    'message': message,
  };

  /// Creates a copy of [VerificationRequestModel] with optional new values.
  VerificationRequestModel copyWith({
    int? id,
    String? status,
    String? created,
    ProfileModel? senderModel,
    String? message,
  }) => VerificationRequestModel(
    id: id ?? this.id,
    status: status ?? this.status,
    created: created ?? this.created,
    senderModel: senderModel ?? this.senderModel,
    message: message ?? this.message,
  );

  @override
  List<Object?> get props => [id, status, created, senderModel, message];
}
