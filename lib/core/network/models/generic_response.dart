import 'package:equatable/equatable.dart';

/// Generic envelope response for API endpoints.
class GenericResponse<T> extends Equatable {
  /// Status string (e.g. 'success', 'error').
  final String status;

  /// HTTP or application response status code.
  final int code;

  /// Optional message detailing the response.
  final String? message;

  /// Payload data of type [T].
  final T? data;

  /// Creates a [GenericResponse] instance.
  const GenericResponse({
    required this.status,
    required this.code,
    this.message,
    this.data,
  });

  /// Deserializes JSON into [GenericResponse].
  factory GenericResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return GenericResponse<T>(
      status: json['status'] as String,
      code: json['code'] as int,
      message: json['message'] as String?,
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }

  /// Serializes [GenericResponse] to JSON.
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return <String, dynamic>{
      'status': status,
      'code': code,
      'message': message,
      'data': data != null ? toJsonT(data as T) : null,
    };
  }

  @override
  List<Object?> get props => [status, code, message, data];
}
