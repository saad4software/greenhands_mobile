import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class EditProfileReqeust {

  const EditProfileReqeust({
    required this.email,
    required this.address,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.lat,
    required this.lng,
  });

  final String email;
  final String address;
  final String firstName;
  final String lastName;
  final String phone;
  final double lat;
  final double lng;

  factory EditProfileReqeust.fromJson(Map<String,dynamic> json) => EditProfileReqeust(
    email: json['email'] as String,
    address: json['address'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    phone: json['phone'] as String,
    lat: json['lat'] as double,
    lng: json['lng'] as double
  );
  
  Map<String, dynamic> toJson() => {
    'email': email,
    'address': address,
    'first_name': firstName,
    'last_name': lastName,
    'phone': phone,
    'lat': lat,
    'lng': lng
  };

  EditProfileReqeust clone() => EditProfileReqeust(
    email: email,
    address: address,
    firstName: firstName,
    lastName: lastName,
    phone: phone,
    lat: lat,
    lng: lng
  );


  EditProfileReqeust copyWith({
    String? email,
    String? address,
    String? firstName,
    String? lastName,
    String? phone,
    double? lat,
    double? lng
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
  bool operator ==(Object other) => identical(this, other)
    || other is EditProfileReqeust && email == other.email && address == other.address && firstName == other.firstName && lastName == other.lastName && phone == other.phone && lat == other.lat && lng == other.lng;

  @override
  int get hashCode => email.hashCode ^ address.hashCode ^ firstName.hashCode ^ lastName.hashCode ^ phone.hashCode ^ lat.hashCode ^ lng.hashCode;

}
