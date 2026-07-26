import 'package:equatable/equatable.dart';

/// Clean domain entity representing a user profile or organizer.
class ProfileEntity extends Equatable {
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

  /// Creates a [ProfileEntity].
  const ProfileEntity({
    this.firstName,
    this.lastName,
    this.email,
    this.address,
    this.phone,
    this.lat,
    this.lng,
    required this.role,
  });

  /// Full display name of the profile.
  String get displayName {
    final name = '${firstName ?? ''} ${lastName ?? ''}'.trim();
    return name.isNotEmpty ? name : (phone ?? 'Organizer');
  }

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
