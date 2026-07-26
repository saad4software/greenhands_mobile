/// API endpoint constants for remote network calls.
abstract final class ApiEndpoints {
  /// Base API URL.
  static const String baseUrl = 'http://172.16.126.1:8000/api/';

  /// Auth endpoints
  static const String login = 'login/';
  static const String anonymousLogin = 'anonymous_login/';
  static const String register = 'register/';

  /// Geolocation external endpoint
  static const String geoLocation = 'http://ip-api.com/json';

  /// Points and Categories endpoints
  static const String points = 'points/';
  static const String needs = 'needs/';
  static const String organizers = 'organizers/';
  static const String categories = 'categories/';

  /// User profile endpoints
  static const String userPhotos = 'user/photos/';
  static const String userPhotosDelete = 'user/photos/{id}';
  static const String userProfile = 'user/profile/';
  static const String userNotifications = 'user/notifications/';

  /// Giver endpoints
  static const String giverProvide = 'giver/provide/';

  /// Taker endpoints
  static const String takerNeeds = 'taker/needs/';
  static const String takerNeedsDelete = 'taker/needs/{id}';
  static const String takerPoint = 'taker/point/';
  static const String takerVerify = 'taker/verify/';

  /// Organizer endpoints
  static const String organizerRequests = 'organizer/requests/';

  /// Endpoint for fetching home dashboard data.
  static const String homeData = 'home';
}
