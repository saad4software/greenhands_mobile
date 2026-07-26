import 'package:equatable/equatable.dart';

/// DTO representing a user profile.
class ProfileModel extends Equatable {
  /// First name of the user.
  final String? firstName;

  /// Last name of the user.
  final String? lastName;

  /// Email address.
  final String? email;

  /// Physical address string.
  final String? address;

  /// Contact phone number.
  final String? phone;

  /// Latitude coordinate.
  final double? lat;

  /// Longitude coordinate.
  final double? lng;

  /// Role of the user.
  final String role;

  /// Creates a [ProfileModel] instance.
  const ProfileModel({
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.phone,
    this.lat,
    this.lng,
    required this.role,
  });

  /// Factory constructor for creating a [ProfileModel] from JSON.
  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    email: json['email'] as String?,
    address: json['address'] as String?,
    phone: json['phone'] as String?,
    lat: json['lat'] != null ? (json['lat'] as num).toDouble() : null,
    lng: json['lng'] != null ? (json['lng'] as num).toDouble() : null,
    role: json['role'] as String,
  );

  /// Converts a [ProfileModel] into a JSON map.
  Map<String, dynamic> toJson() => {
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'address': address,
    'phone': phone,
    'lat': lat,
    'lng': lng,
    'role': role,
  };

  /// Creates a copy of [ProfileModel] with optional new values.
  ProfileModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? address,
    String? phone,
    double? lat,
    double? lng,
    String? role,
  }) => ProfileModel(
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    email: email ?? this.email,
    address: address ?? this.address,
    phone: phone ?? this.phone,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    role: role ?? this.role,
  );

  @override
  List<Object?> get props => [
    firstName,
    lastName,
    email,
    address,
    phone,
    lat,
    lng,
    role,
  ];
}
