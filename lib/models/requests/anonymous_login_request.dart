import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class AnonymousLoginRequest {

  const AnonymousLoginRequest({
    required this.print,
    required this.role,
  });

  final String print;
  final String role;

  factory AnonymousLoginRequest.fromJson(Map<String,dynamic> json) => AnonymousLoginRequest(
    print: json['print'] as String,
    role: json['role'] as String
  );
  
  Map<String, dynamic> toJson() => {
    'print': print,
    'role': role
  };

  AnonymousLoginRequest clone() => AnonymousLoginRequest(
    print: print,
    role: role
  );


  AnonymousLoginRequest copyWith({
    String? print,
    String? role
  }) => AnonymousLoginRequest(
    print: print ?? this.print,
    role: role ?? this.role,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is AnonymousLoginRequest && print == other.print && role == other.role;

  @override
  int get hashCode => print.hashCode ^ role.hashCode;

}
