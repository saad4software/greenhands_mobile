/// Exception thrown when a remote server call fails.
class ServerException implements Exception {
  /// Error message.
  final String message;

  /// Optional HTTP status code.
  final int? statusCode;

  /// Creates a [ServerException].
  const ServerException(this.message, {this.statusCode});
}

/// Exception thrown when a local cache or database operation fails.
class CacheException implements Exception {
  /// Error message.
  final String message;

  /// Creates a [CacheException].
  const CacheException(this.message);
}

/// Exception thrown when network is unreachable.
class NetworkException implements Exception {
  /// Error message.
  final String message;

  /// Creates a [NetworkException].
  const NetworkException([this.message = 'Network operation failed.']);
}
