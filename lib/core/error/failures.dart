import 'package:equatable/equatable.dart';

/// Base Failure class representing domain-level error results.
abstract class Failure extends Equatable {
  /// User-friendly error message.
  final String message;

  /// Creates a [Failure] with an error message.
  const Failure(this.message);

  @override
  List<Object?> get props => [message];
}

/// Represents a failure originating from remote API calls.
class ServerFailure extends Failure {
  /// Optional status code from the server response.
  final int? statusCode;

  /// Creates a [ServerFailure].
  const ServerFailure(super.message, {this.statusCode});

  @override
  List<Object?> get props => [message, statusCode];
}

/// Represents a failure during local storage or caching operations.
class CacheFailure extends Failure {
  /// Creates a [CacheFailure].
  const CacheFailure(super.message);
}

/// Represents a failure due to network connectivity issues.
class NetworkFailure extends Failure {
  /// Creates a [NetworkFailure].
  const NetworkFailure([super.message = 'No Internet connection.']);
}
