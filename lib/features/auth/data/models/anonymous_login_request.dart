import 'package:equatable/equatable.dart';

/// Request DTO for anonymous authentication.
class AnonymousLoginRequest extends Equatable {
  /// Device print or fingerprint token.
  final String print;

  /// Optional user role.
  final String? role;

  /// Creates an [AnonymousLoginRequest] instance.
  const AnonymousLoginRequest({required this.print, this.role});

  /// Factory constructor for creating an [AnonymousLoginRequest] from JSON.
  factory AnonymousLoginRequest.fromJson(Map<String, dynamic> json) =>
      AnonymousLoginRequest(
        print: json['print'] as String,
        role: json['role'] as String?,
      );

  /// Converts an [AnonymousLoginRequest] into a JSON map.
  Map<String, dynamic> toJson() => {'print': print, 'role': role};

  /// Creates a copy of [AnonymousLoginRequest] with optional new values.
  AnonymousLoginRequest copyWith({String? print, String? role}) =>
      AnonymousLoginRequest(
        print: print ?? this.print,
        role: role ?? this.role,
      );

  @override
  List<Object?> get props => [print, role];
}
