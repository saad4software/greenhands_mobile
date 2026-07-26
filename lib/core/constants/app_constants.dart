/// App-wide constants for Greenhands application.
abstract final class AppConstants {
  /// Application name.
  static const String appName = 'Greenhands';

  /// Connection timeout duration in milliseconds for HTTP requests.
  static const int connectTimeout = 30000;

  /// Receive timeout duration in milliseconds for HTTP requests.
  static const int receiveTimeout = 30000;

  /// Storage key for user authentication tokens.
  static const String authTokenKey = 'AUTH_TOKEN';
}
