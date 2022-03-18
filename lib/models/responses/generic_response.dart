import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class GenericResponse<T> {

  const GenericResponse({
    required this.status,
    required this.code,
    this.message,
    this.data,
  });

  final String status;
  final int code;
  final String? message;
  final T? data;

  factory GenericResponse.fromJson(Map<String,dynamic> json, Function fromJsonModel) => GenericResponse(
    status: json['status'] as String,
    code: json['code'] as int,
    message: json['message'] != null ? json['message'] as String : null,
    data: json['data'] != null ? fromJsonModel(json['data']) as T : null
  );
  
  Map<String, dynamic> toJson(Map<String, dynamic> Function() toJsonModel) => {
    'status': status,
    'code': code,
    'message': message,
    'data': toJsonModel()
  };

  GenericResponse clone() => GenericResponse(
    status: status,
    code: code,
    message: message,
    data: data
  );


  GenericResponse copyWith({
    String? status,
    int? code,
    Optional<String?>? message,
    Optional<T?>? data
  }) => GenericResponse(
    status: status ?? this.status,
    code: code ?? this.code,
    message: checkOptional(message, this.message),
    data: checkOptional(data, this.data),
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is GenericResponse && status == other.status && code == other.code && message == other.message && data == other.data;

  @override
  int get hashCode => status.hashCode ^ code.hashCode ^ message.hashCode ^ data.hashCode;

}
