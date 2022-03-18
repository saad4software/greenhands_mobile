import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class RegisterRequest {

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

  final String email;
  final String role;
  final String address;
  final String password;
  final String print;
  final String firstName;
  final String lastName;
  final String phone;
  final double lat;
  final double lng;

  factory RegisterRequest.fromJson(Map<String,dynamic> json) => RegisterRequest(
    email: json['email'] as String,
    role: json['role'] as String,
    address: json['address'] as String,
    password: json['password'] as String,
    print: json['print'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    phone: json['phone'] as String,
    lat: json['lat'] as double,
    lng: json['lng'] as double
  );
  
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
    'lng': lng
  };

  RegisterRequest clone() => RegisterRequest(
    email: email,
    role: role,
    address: address,
    password: password,
    print: print,
    firstName: firstName,
    lastName: lastName,
    phone: phone,
    lat: lat,
    lng: lng
  );


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
    double? lng
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
  bool operator ==(Object other) => identical(this, other)
    || other is RegisterRequest && email == other.email && role == other.role && address == other.address && password == other.password && print == other.print && firstName == other.firstName && lastName == other.lastName && phone == other.phone && lat == other.lat && lng == other.lng;

  @override
  int get hashCode => email.hashCode ^ role.hashCode ^ address.hashCode ^ password.hashCode ^ print.hashCode ^ firstName.hashCode ^ lastName.hashCode ^ phone.hashCode ^ lat.hashCode ^ lng.hashCode;

}
