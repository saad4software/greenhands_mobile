import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';


class NetworkInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
    debugPrint('REQUEST[${options.method}] => PATH: ${options.uri.toString()}');
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    super.onError(err, handler);
    debugPrint('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.uri.toString()}');
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
    debugPrint('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.uri.toString()}');
    // debugPrint('RESPONSE => BODY: ${printJson(response.data as Map<String, dynamic>)}' );
  }

  String printJson(Map<String, dynamic> map){
    final str = json.encode(map);
    final object = json.decode(str);
    final prettyString = const JsonEncoder.withIndent('  ').convert(object);
    return prettyString;
  }
}