import 'package:equatable/equatable.dart';

/// Request DTO for editing a user profile.
class EditProfileReqeust extends Equatable {
  /// User email.
  final String email;

  /// Physical address string.
  final String address;

  /// User first name.
  final String firstName;

  /// User last name.
  final String lastName;

  /// Contact phone number.
  final String phone;

  /// Latitude coordinate.
  final double lat;

  /// Longitude coordinate.
  final double lng;

  /// Creates an [EditProfileReqeust] instance.
  const EditProfileReqeust({
    required this.email,
    required this.address,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.lat,
    required this.lng,
  });

  /// Factory constructor for creating an [EditProfileReqeust] from JSON.
  factory EditProfileReqeust.fromJson(Map<String, dynamic> json) =>
      EditProfileReqeust(
        email: json['email'] as String,
        address: json['address'] as String,
        firstName: json['first_name'] as String,
        lastName: json['last_name'] as String,
        phone: json['phone'] as String,
        lat: (json['lat'] as num).toDouble(),
        lng: (json['lng'] as num).toDouble(),
      );

  /// Converts an [EditProfileReqeust] into a JSON map.
  Map<String, dynamic> toJson() => {
    'email': email,
    'address': address,
    'first_name': firstName,
    'last_name': lastName,
    'phone': phone,
    'lat': lat,
    'lng': lng,
  };

  /// Creates a copy of [EditProfileReqeust] with optional new values.
  EditProfileReqeust copyWith({
    String? email,
    String? address,
    String? firstName,
    String? lastName,
    String? phone,
    double? lat,
    double? lng,
  }) => EditProfileReqeust(
    email: email ?? this.email,
    address: address ?? this.address,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    phone: phone ?? this.phone,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
  );

  @override
  List<Object?> get props => [
    email,
    address,
    firstName,
    lastName,
    phone,
    lat,
    lng,
  ];
}
