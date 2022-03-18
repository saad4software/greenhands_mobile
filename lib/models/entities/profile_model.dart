import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class ProfileModel {

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

  final String? firstName;
  final String? lastName;
  final String? email;
  final String? address;
  final String? phone;
  final double? lat;
  final double? lng;
  final String role;

  factory ProfileModel.fromJson(Map<String,dynamic> json) => ProfileModel(
    firstName: json['first_name'] != null ? json['first_name'] as String : null,
    lastName: json['last_name'] != null ? json['last_name'] as String : null,
    email: json['email'] != null ? json['email'] as String : null,
    address: json['address'] != null ? json['address'] as String : null,
    phone: json['phone'] != null ? json['phone'] as String : null,
    lat: json['lat'] != null ? json['lat'] as double : null,
    lng: json['lng'] != null ? json['lng'] as double : null,
    role: json['role'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'first_name': firstName,
    'last_name': lastName,
    'email': email,
    'address': address,
    'phone': phone,
    'lat': lat,
    'lng': lng,
    'role': role
  };

  ProfileModel clone() => ProfileModel(
    firstName: firstName,
    lastName: lastName,
    email: email,
    address: address,
    phone: phone,
    lat: lat,
    lng: lng,
    role: role
  );


  ProfileModel copyWith({
    Optional<String?>? firstName,
    Optional<String?>? lastName,
    Optional<String?>? email,
    Optional<String?>? address,
    Optional<String?>? phone,
    Optional<double?>? lat,
    Optional<double?>? lng,
    String? role
  }) => ProfileModel(
    firstName: checkOptional(firstName, this.firstName),
    lastName: checkOptional(lastName, this.lastName),
    email: checkOptional(email, this.email),
    address: checkOptional(address, this.address),
    phone: checkOptional(phone, this.phone),
    lat: checkOptional(lat, this.lat),
    lng: checkOptional(lng, this.lng),
    role: role ?? this.role,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is ProfileModel && firstName == other.firstName && lastName == other.lastName && email == other.email && address == other.address && phone == other.phone && lat == other.lat && lng == other.lng && role == other.role;

  @override
  int get hashCode => firstName.hashCode ^ lastName.hashCode ^ email.hashCode ^ address.hashCode ^ phone.hashCode ^ lat.hashCode ^ lng.hashCode ^ role.hashCode;

}
