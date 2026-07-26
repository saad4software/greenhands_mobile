import 'package:equatable/equatable.dart';

/// DTO for authentication tokens and user role.
class TokenModel extends Equatable {
  /// Refresh token string.
  final String refresh;

  /// Access token string.
  final String access;

  /// Role of the user.
  final String role;

  /// Creates a [TokenModel] instance.
  const TokenModel({
    required this.refresh,
    required this.access,
    required this.role,
  });

  /// Factory constructor for creating a [TokenModel] from JSON.
  factory TokenModel.fromJson(Map<String, dynamic> json) => TokenModel(
    refresh: json['refresh'] as String,
    access: json['access'] as String,
    role: json['role'] as String,
  );

  /// Converts a [TokenModel] into a JSON map.
  Map<String, dynamic> toJson() => {
    'refresh': refresh,
    'access': access,
    'role': role,
  };

  /// Creates a copy of [TokenModel] with optional new values.
  TokenModel copyWith({String? refresh, String? access, String? role}) =>
      TokenModel(
        refresh: refresh ?? this.refresh,
        access: access ?? this.access,
        role: role ?? this.role,
      );

  @override
  List<Object?> get props => [refresh, access, role];
}
