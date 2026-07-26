import 'package:equatable/equatable.dart';

/// Request DTO for logging in.
class LoginRequest extends Equatable {
  /// Username or identifier.
  final String username;

  /// Password string.
  final String password;

  /// Creates a [LoginRequest] instance.
  const LoginRequest({required this.username, required this.password});

  /// Factory constructor for creating a [LoginRequest] from JSON.
  factory LoginRequest.fromJson(Map<String, dynamic> json) => LoginRequest(
    username: json['username'] as String,
    password: json['password'] as String,
  );

  /// Converts a [LoginRequest] into a JSON map.
  Map<String, dynamic> toJson() => {'username': username, 'password': password};

  /// Creates a copy of [LoginRequest] with optional new values.
  LoginRequest copyWith({String? username, String? password}) => LoginRequest(
    username: username ?? this.username,
    password: password ?? this.password,
  );

  @override
  List<Object?> get props => [username, password];
}
