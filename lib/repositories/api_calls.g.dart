// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_calls.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiCalls implements ApiCalls {
  _ApiCalls(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://172.16.246.1:8000/api/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<GenericResponse<TokenModel>> login(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<TokenModel>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'login/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<TokenModel>.fromJson(
        _result.data!, (json) => TokenModel.fromJson(json));
    return value;
  }

  @override
  Future<GenericResponse<TokenModel>> anonymousLogin(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<TokenModel>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'anonymous_login/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<TokenModel>.fromJson(
        _result.data!, (json) => TokenModel.fromJson(json));
    return value;
  }

  @override
  Future<GenericResponse<ProfileModel>> register(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<ProfileModel>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'register/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<ProfileModel>.fromJson(
        _result.data!, (json) => ProfileModel.fromJson(json));
    return value;
  }

  @override
  Future<GeoLocationResponse> geoLocation() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GeoLocationResponse>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'http://ip-api.com/json',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GeoLocationResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<GenericResponse<GenericListResponse<List<PointModel>>>> points(
      page, pageSize, search, minLat, maxLat, minLng, maxLng) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': pageSize,
      r'search': search,
      r'min_lat': minLat,
      r'max_lat': maxLat,
      r'min_lng': minLng,
      r'max_lng': maxLng
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<GenericListResponse<List<PointModel>>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'points/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        GenericResponse<GenericListResponse<List<PointModel>>>.fromJson(
            _result.data!,
            (json) => GenericListResponse<List<PointModel>>.fromJson(
                json,
                (json) => (json as List<dynamic>)
                    .map<PointModel>(
                        (i) => PointModel.fromJson(i as Map<String, dynamic>))
                    .toList()));
    return value;
  }

  @override
  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> needs(
      page, pageSize, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': pageSize,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<GenericListResponse<List<NeedModel>>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'needs/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        GenericResponse<GenericListResponse<List<NeedModel>>>.fromJson(
            _result.data!,
            (json) => GenericListResponse<List<NeedModel>>.fromJson(
                json,
                (json) => (json as List<dynamic>)
                    .map<NeedModel>(
                        (i) => NeedModel.fromJson(i as Map<String, dynamic>))
                    .toList()));
    return value;
  }

  @override
  Future<GenericResponse<GenericListResponse<List<ProfileModel>>>> organizers(
      page, pageSize, search, minLat, maxLat, minLng, maxLng) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': pageSize,
      r'search': search,
      r'min_lat': minLat,
      r'max_lat': maxLat,
      r'min_lng': minLng,
      r'max_lng': maxLng
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            GenericResponse<GenericListResponse<List<ProfileModel>>>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'organizers/',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        GenericResponse<GenericListResponse<List<ProfileModel>>>.fromJson(
            _result.data!,
            (json) => GenericListResponse<List<ProfileModel>>.fromJson(
                json,
                (json) => (json as List<dynamic>)
                    .map<ProfileModel>(
                        (i) => ProfileModel.fromJson(i as Map<String, dynamic>))
                    .toList()));
    return value;
  }

  @override
  Future<GenericResponse<GenericListResponse<List<CategoryModel>>>> categories(
      page, pageSize, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': pageSize,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            GenericResponse<GenericListResponse<List<CategoryModel>>>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'categories/',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        GenericResponse<GenericListResponse<List<CategoryModel>>>.fromJson(
            _result.data!,
            (json) => GenericListResponse<List<CategoryModel>>.fromJson(
                json,
                (json) => (json as List<dynamic>)
                    .map<CategoryModel>((i) =>
                        CategoryModel.fromJson(i as Map<String, dynamic>))
                    .toList()));
    return value;
  }

  @override
  Future<GenericResponse<GenericListResponse<List<ImageModel>>>> userPhotosList(
      page, pageSize, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': pageSize,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<GenericListResponse<List<ImageModel>>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user/photos/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        GenericResponse<GenericListResponse<List<ImageModel>>>.fromJson(
            _result.data!,
            (json) => GenericListResponse<List<ImageModel>>.fromJson(
                json,
                (json) => (json as List<dynamic>)
                    .map<ImageModel>(
                        (i) => ImageModel.fromJson(i as Map<String, dynamic>))
                    .toList()));
    return value;
  }

  @override
  Future<GenericResponse<ImageModel>> userPhotosDelete(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<ImageModel>>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user/photos/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<ImageModel>.fromJson(
        _result.data!, (json) => ImageModel.fromJson(json));
    return value;
  }

  @override
  Future<GenericResponse<ProfileModel>> userProfile() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<ProfileModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user/profile/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<ProfileModel>.fromJson(
        _result.data!, (json) => ProfileModel.fromJson(json));
    return value;
  }

  @override
  Future<GenericResponse<ProfileModel>> userProfileUpdate(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<ProfileModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user/profile/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<ProfileModel>.fromJson(
        _result.data!, (json) => ProfileModel.fromJson(json));
    return value;
  }

  @override
  Future<GenericResponse<GenericListResponse<List<NotificationModel>>>>
      userNotifications(page, pageSize, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': pageSize,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            GenericResponse<GenericListResponse<List<NotificationModel>>>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'user/notifications/',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        GenericResponse<GenericListResponse<List<NotificationModel>>>.fromJson(
            _result.data!,
            (json) => GenericListResponse<List<NotificationModel>>.fromJson(
                json,
                (json) => (json as List<dynamic>)
                    .map<NotificationModel>((i) =>
                        NotificationModel.fromJson(i as Map<String, dynamic>))
                    .toList()));
    return value;
  }

  @override
  Future<GenericResponse<GenericListResponse<List<NeedModel>>>>
      giverProvideList(page, pageSize, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': pageSize,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<GenericListResponse<List<NeedModel>>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'giver/provide/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        GenericResponse<GenericListResponse<List<NeedModel>>>.fromJson(
            _result.data!,
            (json) => GenericListResponse<List<NeedModel>>.fromJson(
                json,
                (json) => (json as List<dynamic>)
                    .map<NeedModel>(
                        (i) => NeedModel.fromJson(i as Map<String, dynamic>))
                    .toList()));
    return value;
  }

  @override
  Future<GenericResponse<NeedModel>> giverProvideNeed(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<NeedModel>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'giver/provide/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<NeedModel>.fromJson(
        _result.data!, (json) => NeedModel.fromJson(json));
    return value;
  }

  @override
  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> takerNeedsList(
      page, pageSize, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': pageSize,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<GenericListResponse<List<NeedModel>>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'taker/needs/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        GenericResponse<GenericListResponse<List<NeedModel>>>.fromJson(
            _result.data!,
            (json) => GenericListResponse<List<NeedModel>>.fromJson(
                json,
                (json) => (json as List<dynamic>)
                    .map<NeedModel>(
                        (i) => NeedModel.fromJson(i as Map<String, dynamic>))
                    .toList()));
    return value;
  }

  @override
  Future<GenericResponse<NeedModel>> takerNeedsDelete(id) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<NeedModel>>(
            Options(method: 'DELETE', headers: _headers, extra: _extra)
                .compose(_dio.options, 'taker/needs/$id',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<NeedModel>.fromJson(
        _result.data!, (json) => NeedModel.fromJson(json));
    return value;
  }

  @override
  Future<GenericResponse<NeedModel>> takerNeedsCreate(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<NeedModel>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'taker/needs/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<NeedModel>.fromJson(
        _result.data!, (json) => NeedModel.fromJson(json));
    return value;
  }

  @override
  Future<GenericResponse<PointModel>> takerPoint() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<PointModel>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'taker/point/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<PointModel>.fromJson(
        _result.data!, (json) => PointModel.fromJson(json));
    return value;
  }

  @override
  Future<GenericResponse<PointModel>> takerPointUpdate(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<PointModel>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'taker/point/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<PointModel>.fromJson(
        _result.data!, (json) => PointModel.fromJson(json));
    return value;
  }

  @override
  Future<GenericResponse<GenericListResponse<List<VerificationRequestModel>>>>
      takerVerificationRequestsList(page, pageSize, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': pageSize,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            GenericResponse<
                GenericListResponse<List<VerificationRequestModel>>>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'taker/verify/',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<
            GenericListResponse<List<VerificationRequestModel>>>.fromJson(
        _result.data!,
        (json) => GenericListResponse<List<VerificationRequestModel>>.fromJson(
            json,
            (json) => (json as List<dynamic>)
                .map<VerificationRequestModel>((i) =>
                    VerificationRequestModel.fromJson(
                        i as Map<String, dynamic>))
                .toList()));
    return value;
  }

  @override
  Future<GenericResponse<VerificationRequestModel>>
      takerVerificationRequestsCreate(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<VerificationRequestModel>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'taker/verify/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<VerificationRequestModel>.fromJson(
        _result.data!, (json) => VerificationRequestModel.fromJson(json));
    return value;
  }

  @override
  Future<GenericResponse<GenericListResponse<List<VerificationRequestModel>>>>
      organizerVerificationRequestsList(page, pageSize, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': pageSize,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            GenericResponse<
                GenericListResponse<List<VerificationRequestModel>>>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'organizer/requests/',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<
            GenericListResponse<List<VerificationRequestModel>>>.fromJson(
        _result.data!,
        (json) => GenericListResponse<List<VerificationRequestModel>>.fromJson(
            json,
            (json) => (json as List<dynamic>)
                .map<VerificationRequestModel>((i) =>
                    VerificationRequestModel.fromJson(
                        i as Map<String, dynamic>))
                .toList()));
    return value;
  }

  @override
  Future<GenericResponse<VerificationRequestModel>>
      organizerVerificationRequestsCreate(request) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    _data.addAll(request.toJson());
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<VerificationRequestModel>>(
            Options(method: 'POST', headers: _headers, extra: _extra)
                .compose(_dio.options, 'organizer/requests/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<VerificationRequestModel>.fromJson(
        _result.data!, (json) => VerificationRequestModel.fromJson(json));
    return value;
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
}
