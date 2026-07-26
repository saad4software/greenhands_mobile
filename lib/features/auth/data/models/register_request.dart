import 'package:equatable/equatable.dart';

/// Request DTO for registering a new user profile.
class RegisterRequest extends Equatable {
  /// User email address.
  final String email;

  /// Assigned role string.
  final String role;

  /// Physical address string.
  final String address;

  /// User password.
  final String password;

  /// Device print identifier.
  final String print;

  /// User first name.
  final String firstName;

  /// User last name.
  final String lastName;

  /// Phone number string.
  final String phone;

  /// Latitude coordinate.
  final double lat;

  /// Longitude coordinate.
  final double lng;

  /// Creates a [RegisterRequest] instance.
  const RegisterRequest({
    required this.email,
    required this.role,
    required this.address,
    required this.password,
    required this.print,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.lat,
    required this.lng,
  });

  /// Factory constructor for creating a [RegisterRequest] from JSON.
  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      RegisterRequest(
        email: json['email'] as String,
        role: json['role'] as String,
        address: json['address'] as String,
        password: json['password'] as String,
        print: json['print'] as String,
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String,
        phone: json['phone'] as String,
        lat: (json['lat'] as num).toDouble(),
        lng: (json['lng'] as num).toDouble(),
      );

  /// Converts a [RegisterRequest] into a JSON map.
  Map<String, dynamic> toJson() => {
    'email': email,
    'role': role,
    'address': address,
    'password': password,
    'print': print,
    'first_name': firstName,
    'last_name': lastName,
    'phone': phone,
    'lat': lat,
    'lng': lng,
  };

  /// Creates a copy of [RegisterRequest] with optional new values.
  RegisterRequest copyWith({
    String? email,
    String? role,
    String? address,
    String? password,
    String? print,
    String? firstName,
    String? lastName,
    String? phone,
    double? lat,
    double? lng,
  }) => RegisterRequest(
    email: email ?? this.email,
    role: role ?? this.role,
    address: address ?? this.address,
    password: password ?? this.password,
    print: print ?? this.print,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    phone: phone ?? this.phone,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
  );

  @override
  List<Object?> get props => [
    email,
    role,
    address,
    password,
    print,
    firstName,
    lastName,
    phone,
    lat,
    lng,
  ];
}
