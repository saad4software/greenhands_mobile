import 'package:equatable/equatable.dart';

/// Request DTO for providing/granting a need (Giver).
class ProvideNeedReqeust extends Equatable {
  /// ID of the target need.
  final int needId;

  /// Message from the giver.
  final String message;

  /// Creates a [ProvideNeedReqeust] instance.
  const ProvideNeedReqeust({required this.needId, required this.message});

  /// Factory constructor for creating a [ProvideNeedReqeust] from JSON.
  factory ProvideNeedReqeust.fromJson(Map<String, dynamic> json) =>
      ProvideNeedReqeust(
        needId: json['need_id'] as int,
        message: json['message'] as String,
      );

  /// Converts a [ProvideNeedReqeust] into a JSON map.
  Map<String, dynamic> toJson() => {'need_id': needId, 'message': message};

  /// Creates a copy of [ProvideNeedReqeust] with optional new values.
  ProvideNeedReqeust copyWith({int? needId, String? message}) =>
      ProvideNeedReqeust(
        needId: needId ?? this.needId,
        message: message ?? this.message,
      );

  @override
  List<Object?> get props => [needId, message];
}
