import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';

import '../entities/profile_model.dart';

@immutable
class VerificationRequestModel {

  const VerificationRequestModel({
    required this.id,
    required this.status,
    required this.created,
    required this.senderModel,
    required this.message,
  });

  final int id;
  final String status;
  final String created;
  final ProfileModel senderModel;
  final String message;

  factory VerificationRequestModel.fromJson(Map<String,dynamic> json) => VerificationRequestModel(
    id: json['id'] as int,
    status: json['status'] as String,
    created: json['created'] as String,
    senderModel: ProfileModel.fromJson(json['sender_model'] as Map<String, dynamic>),
    message: json['message'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'status': status,
    'created': created,
    'sender_model': senderModel.toJson(),
    'message': message
  };

  VerificationRequestModel clone() => VerificationRequestModel(
    id: id,
    status: status,
    created: created,
    senderModel: senderModel.clone(),
    message: message
  );


  VerificationRequestModel copyWith({
    int? id,
    String? status,
    String? created,
    ProfileModel? senderModel,
    String? message
  }) => VerificationRequestModel(
    id: id ?? this.id,
    status: status ?? this.status,
    created: created ?? this.created,
    senderModel: senderModel ?? this.senderModel,
    message: message ?? this.message,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is VerificationRequestModel && id == other.id && status == other.status && created == other.created && senderModel == other.senderModel && message == other.message;

  @override
  int get hashCode => id.hashCode ^ status.hashCode ^ created.hashCode ^ senderModel.hashCode ^ message.hashCode;

}
