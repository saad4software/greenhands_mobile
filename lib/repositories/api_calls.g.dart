// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_calls.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _ApiCalls implements ApiCalls {
  _ApiCalls(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://127.0.0.1:8000/api/';
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
  Future<GenericResponse<GenericListResponse<PointModel>>> points(
      page, page_size, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': page_size,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<GenericListResponse<PointModel>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'points/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<GenericListResponse<PointModel>>.fromJson(
        _result.data!,
        (json) => GenericListResponse<PointModel>.fromJson(
            json, (json) => PointModel.fromJson(json)));
    return value;
  }

  @override
  Future<GenericResponse<GenericListResponse<NeedModel>>> needs(
      page, page_size, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': page_size,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<GenericListResponse<NeedModel>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'needs/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<GenericListResponse<NeedModel>>.fromJson(
        _result.data!,
        (json) => GenericListResponse<NeedModel>.fromJson(
            json, (json) => NeedModel.fromJson(json)));
    return value;
  }

  @override
  Future<GenericResponse<GenericListResponse<ProfileModel>>> organizers(
      page, page_size, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': page_size,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<GenericListResponse<ProfileModel>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'organizers/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<GenericListResponse<ProfileModel>>.fromJson(
        _result.data!,
        (json) => GenericListResponse<ProfileModel>.fromJson(
            json, (json) => ProfileModel.fromJson(json)));
    return value;
  }

  @override
  Future<GenericResponse<GenericListResponse<CategoryModel>>> categories(
      page, page_size, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': page_size,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<GenericListResponse<CategoryModel>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'categories/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<GenericListResponse<CategoryModel>>.fromJson(
        _result.data!,
        (json) => GenericListResponse<CategoryModel>.fromJson(
            json, (json) => CategoryModel.fromJson(json)));
    return value;
  }

  @override
  Future<GenericResponse<GenericListResponse<ImageModel>>> userPhotosList(
      page, page_size, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': page_size,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<GenericListResponse<ImageModel>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user/photos/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<GenericListResponse<ImageModel>>.fromJson(
        _result.data!,
        (json) => GenericListResponse<ImageModel>.fromJson(
            json, (json) => ImageModel.fromJson(json)));
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
  Future<GenericResponse<GenericListResponse<NotificationModel>>>
      userNotifications(page, page_size, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': page_size,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<GenericListResponse<NotificationModel>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'user/notifications/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        GenericResponse<GenericListResponse<NotificationModel>>.fromJson(
            _result.data!,
            (json) => GenericListResponse<NotificationModel>.fromJson(
                json, (json) => NotificationModel.fromJson(json)));
    return value;
  }

  @override
  Future<GenericResponse<GenericListResponse<NeedModel>>> giverProvideList(
      page, page_size, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': page_size,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<GenericListResponse<NeedModel>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'giver/provide/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<GenericListResponse<NeedModel>>.fromJson(
        _result.data!,
        (json) => GenericListResponse<NeedModel>.fromJson(
            json, (json) => NeedModel.fromJson(json)));
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
  Future<GenericResponse<GenericListResponse<NeedModel>>> takerNeedsList(
      page, page_size, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': page_size,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse<GenericListResponse<NeedModel>>>(
            Options(method: 'GET', headers: _headers, extra: _extra)
                .compose(_dio.options, 'taker/needs/',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = GenericResponse<GenericListResponse<NeedModel>>.fromJson(
        _result.data!,
        (json) => GenericListResponse<NeedModel>.fromJson(
            json, (json) => NeedModel.fromJson(json)));
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
  Future<GenericResponse<GenericListResponse<VerificationRequestModel>>>
      takerVerificationRequestsList(page, page_size, search) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'page': page,
      r'page_size': page_size,
      r'search': search
    };
    queryParameters.removeWhere((k, v) => v == null);
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            GenericResponse<GenericListResponse<VerificationRequestModel>>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'taker/verify/',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        GenericResponse<GenericListResponse<VerificationRequestModel>>.fromJson(
            _result.data!,
            (json) => GenericListResponse<VerificationRequestModel>.fromJson(
                json, (json) => VerificationRequestModel.fromJson(json)));
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
  Future<GenericResponse<GenericListResponse<VerificationRequestModel>>>
      organizerVerificationRequestsList() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<
            GenericResponse<GenericListResponse<VerificationRequestModel>>>(
        Options(method: 'GET', headers: _headers, extra: _extra)
            .compose(_dio.options, 'organizer/requests/',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value =
        GenericResponse<GenericListResponse<VerificationRequestModel>>.fromJson(
            _result.data!,
            (json) => GenericListResponse<VerificationRequestModel>.fromJson(
                json, (json) => VerificationRequestModel.fromJson(json)));
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
