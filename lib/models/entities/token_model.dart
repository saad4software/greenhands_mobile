import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class TokenModel {

  const TokenModel({
    required this.refresh,
    required this.access,
    required this.role,
  });

  final String refresh;
  final String access;
  final String role;

  factory TokenModel.fromJson(Map<String,dynamic> json) => TokenModel(
    refresh: json['refresh'] as String,
    access: json['access'] as String,
    role: json['role'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'refresh': refresh,
    'access': access,
    'role': role
  };

  TokenModel clone() => TokenModel(
    refresh: refresh,
    access: access,
    role: role
  );


  TokenModel copyWith({
    String? refresh,
    String? access,
    String? role
  }) => TokenModel(
    refresh: refresh ?? this.refresh,
    access: access ?? this.access,
    role: role ?? this.role,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is TokenModel && refresh == other.refresh && access == other.access && role == other.role;

  @override
  int get hashCode => refresh.hashCode ^ access.hashCode ^ role.hashCode;

}
