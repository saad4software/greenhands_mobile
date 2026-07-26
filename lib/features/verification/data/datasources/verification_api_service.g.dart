// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verification_api_service.dart';

// dart format off

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers,unused_element,unnecessary_string_interpolations,unused_element_parameter,avoid_unused_constructor_parameters,unreachable_from_main,avoid_redundant_argument_values

class _VerificationApiService implements VerificationApiService {
  _VerificationApiService(this._dio, {this.baseUrl, this.errorLogger}) {
    baseUrl ??= 'http://172.16.126.1:8000/api/';
  }

  final Dio _dio;

  String? baseUrl;

  final ParseErrorLogger? errorLogger;

  @override
  Future<GenericResponse<GenericListResponse<List<VerificationRequestModel>>>>
  takerVerificationRequestsList(int page, int pageSize, String? search) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': pageSize,
      r'search': search,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<
          GenericResponse<GenericListResponse<List<VerificationRequestModel>>>
        >(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'taker/verify/',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GenericResponse<GenericListResponse<List<VerificationRequestModel>>>
    _value;
    try {
      _value =
          GenericResponse<
            GenericListResponse<List<VerificationRequestModel>>
          >.fromJson(
            _result.data!,
            (json) =>
                GenericListResponse<List<VerificationRequestModel>>.fromJson(
                  json as Map<String, dynamic>,
                  (json) => json is List<dynamic>
                      ? json
                            .map<VerificationRequestModel>(
                              (i) => VerificationRequestModel.fromJson(
                                i as Map<String, dynamic>,
                              ),
                            )
                            .toList()
                      : List.empty(),
                ),
          );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<GenericResponse<VerificationRequestModel>>
  takerVerificationRequestsCreate(VerificationRequest request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<GenericResponse<VerificationRequestModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'taker/verify/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GenericResponse<VerificationRequestModel> _value;
    try {
      _value = GenericResponse<VerificationRequestModel>.fromJson(
        _result.data!,
        (json) =>
            VerificationRequestModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<GenericResponse<GenericListResponse<List<VerificationRequestModel>>>>
  organizerVerificationRequestsList(
    int page,
    int pageSize,
    String? search,
  ) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': pageSize,
      r'search': search,
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    const Map<String, dynamic>? _data = null;
    final _options =
        _setStreamType<
          GenericResponse<GenericListResponse<List<VerificationRequestModel>>>
        >(
          Options(method: 'GET', headers: _headers, extra: _extra)
              .compose(
                _dio.options,
                'organizer/requests/',
                queryParameters: queryParameters,
                data: _data,
              )
              .copyWith(
                baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl),
              ),
        );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GenericResponse<GenericListResponse<List<VerificationRequestModel>>>
    _value;
    try {
      _value =
          GenericResponse<
            GenericListResponse<List<VerificationRequestModel>>
          >.fromJson(
            _result.data!,
            (json) =>
                GenericListResponse<List<VerificationRequestModel>>.fromJson(
                  json as Map<String, dynamic>,
                  (json) => json is List<dynamic>
                      ? json
                            .map<VerificationRequestModel>(
                              (i) => VerificationRequestModel.fromJson(
                                i as Map<String, dynamic>,
                              ),
                            )
                            .toList()
                      : List.empty(),
                ),
          );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  @override
  Future<GenericResponse<VerificationRequestModel>>
  organizerVerificationRequestsCreate(ConfirmationRequest request) async {
    final _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _options = _setStreamType<GenericResponse<VerificationRequestModel>>(
      Options(method: 'POST', headers: _headers, extra: _extra)
          .compose(
            _dio.options,
            'organizer/requests/',
            queryParameters: queryParameters,
            data: _data,
          )
          .copyWith(baseUrl: _combineBaseUrls(_dio.options.baseUrl, baseUrl)),
    );
    final _result = await _dio.fetch<Map<String, dynamic>>(_options);
    late GenericResponse<VerificationRequestModel> _value;
    try {
      _value = GenericResponse<VerificationRequestModel>.fromJson(
        _result.data!,
        (json) =>
            VerificationRequestModel.fromJson(json as Map<String, dynamic>),
      );
    } on Object catch (e, s) {
      errorLogger?.logError(e, s, _options, response: _result);
      rethrow;
    }
    return _value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(String dioBaseUrl, String? baseUrl) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}

// dart format on
