import 'package:flutter/material.dart';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:greenhands_mobile/models/index.dart';
import 'package:greenhands_mobile/repositories/api_calls.dart';
import 'package:greenhands_mobile/utils/pref_model.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'network_interceptor.dart';

class Repository {

  late ApiCalls apiCalls;

  Repository(Dio dio){
    apiCalls = ApiCalls(dio);
  }

  static Dio getClient({String? token}){
    var dio = Dio(); // with default Options
    dio.options.headers["Content-Type"] = "application/json";
    if(token != null){
      dio.options.headers["Authorization"] = "Bearer $token";
    }
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;
    dio.interceptors.add(NetworkInterceptor());
    return dio;
  }

  Future<String?> _getId() async {

    var deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) { // import 'dart:io'
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor; // unique ID on iOS
    } else {
      var androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.androidId; // unique ID on Android
    }
  }



  Future<GenericResponse<TokenModel>> login({
    username,
    password,
  }){
    var request = LoginRequest(username: username, password: password);
    return apiCalls.login(request);
  }

  Future<GenericResponse<TokenModel>> anonymousLogin({
    String? role,
  }) async {
    var print = await _getId() ?? "";
    var request = AnonymousLoginRequest(print: print, role: role);
    var response = await apiCalls.anonymousLogin(request);
    if(response.code == 200){
      PrefModel.instance.token = response.data?.access;
      PrefModel.instance.role = response.data?.role;
      PrefModel.instance.saveData(await SharedPreferences.getInstance());

    }

    return response;
  }

  Future<GenericResponse<ProfileModel>> register ({
    email,
    address,
    password,
    firstName,
    lastName,
    phone,
    lat,
    lng,
  }) async {
    var request = RegisterRequest(
        email: email,
        role: "O",
        address: address,
        password: password,
        print: await _getId() ?? "",
        firstName: firstName,
        lastName: lastName,
        phone: phone,
        lat: lat,
        lng: lng
    );
    debugPrint(request.toString());
    return apiCalls.register(request);
  }

  Future<void> geoLocation() async {
    // get ip location if not already fetched!
    PrefModel.instance.loadData(await SharedPreferences.getInstance());
    if(PrefModel.instance.lng == null){
      final response = await apiCalls.geoLocation();
      PrefModel.instance.lat = response.lat;
      PrefModel.instance.lng = response.lon;
      PrefModel.instance.saveData(await SharedPreferences.getInstance());
    }
  }

  Future<GenericResponse<GenericListResponse<List<PointModel>>>> points(double minLat, double maxLat, double minLng, double maxLng){
    return apiCalls.points(1, -1, null, minLat, maxLat, minLng, maxLng);
  }

  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> needs(int page, int pageSize, String? search){
    return apiCalls.needs(page, pageSize, search);
  }

  Future<GenericResponse<GenericListResponse<List<ProfileModel>>>> organizers(double minLat, double maxLat, double minLng, double maxLng){
    return apiCalls.organizers(1, -1, null, minLat, maxLat, minLng, maxLng);
  }

  Future<GenericResponse<GenericListResponse<List<CategoryModel>>>> categories(int page, int pageSize, String? search){
    return apiCalls.categories(page, pageSize, search);
  }



  Future<GenericResponse<GenericListResponse<List<ImageModel>>>> userPhotosList(int page, int pageSize, String? search){
    return apiCalls.userPhotosList(page, pageSize, search);
  }

  // @POST("user/photos/")
  // Future<GenericResponse<ImageModel>> userPhotosCreate();

  Future<GenericResponse<ImageModel>> userPhotosDelete(@Path("id") int id){
    return apiCalls.userPhotosDelete(id);
  }

  Future<GenericResponse<ProfileModel>> userProfile() async {
    final response = await apiCalls.userProfile();
    PrefModel.instance.loadData(await SharedPreferences.getInstance());
    if(PrefModel.instance.role == "O"){
      PrefModel.instance.lat = response.data?.lat;
      PrefModel.instance.lng = response.data?.lng;
      PrefModel.instance.saveData(await SharedPreferences.getInstance());
    }
    return response;
  }

  Future<GenericResponse<ProfileModel>> userProfileUpdate({
    email,
    address,
    firstName,
    lastName,
    phone,
    lat,
    lng,
  }){
    var request = EditProfileReqeust(email: email, address: address, firstName: firstName, lastName: lastName, phone: phone, lat: lat, lng: lng);
    return apiCalls.userProfileUpdate(request);
  }

  Future<GenericResponse<GenericListResponse<List<NotificationModel>>>> userNotifications(int page, int pageSize, String? search){
    return apiCalls.userNotifications(page, pageSize, search);
  }


  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> giverProvideList(int page, int pageSize, @Query("search") String? search){
    return apiCalls.giverProvideList(page, pageSize, search);
  }

  Future<GenericResponse<NeedModel>> giverProvideNeed({
    needId,
    message,
  }){
    final request = ProvideNeedReqeust(needId: needId, message: message);
    return apiCalls.giverProvideNeed(request);
  }



  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> takerNeedsList(int page, int pageSize, String? search){
    return apiCalls.takerNeedsList(page, pageSize, search);
  }

  Future<GenericResponse<NeedModel>> takerNeedsDelete(@Path("id") int id){
    return apiCalls.takerNeedsDelete(id);
  }

  Future<GenericResponse<NeedModel>> takerNeedsCreate({
    name,
    images,
    brief,
    category,
  }){
    var request = NeedRequest(name: name, images: images, brief: brief, category: category);
    return apiCalls.takerNeedsCreate(request);
  }

  Future<GenericResponse<PointModel>> takerPoint() async{
    final response = await apiCalls.takerPoint();

    PrefModel.instance.loadData(await SharedPreferences.getInstance());
    PrefModel.instance.lat = response.data?.lat;
    PrefModel.instance.lng = response.data?.lng;
    PrefModel.instance.saveData(await SharedPreferences.getInstance());

    return response;
  }

  Future<GenericResponse<PointModel>> takerPointUpdate({
    name,
    images,
    lat,
    lng,
    brief,
    address,
  }){
    var request = EditPointRequest(name: name, images: images, lat: lat, lng: lng, brief: brief, address: address);
    return apiCalls.takerPointUpdate(request);
  }

  Future<GenericResponse<GenericListResponse<VerificationRequestModel>>> takerVerificationRequestsList(int page, int pageSize, String? search){
    return takerVerificationRequestsList(page, pageSize, search);
  }

  Future<GenericResponse<VerificationRequestModel>> takerVerificationRequestsCreate({
    organizerId,
    message,
  }){
    final request = VerificationRequest(organizerId: organizerId, message: message);
    return apiCalls.takerVerificationRequestsCreate(request);
  }


  Future<GenericResponse<GenericListResponse<List<VerificationRequestModel>>>> organizerVerificationRequestsList(int page, int pageSize, String? search){
    return apiCalls.organizerVerificationRequestsList(page, pageSize, search);
  }

  Future<GenericResponse<VerificationRequestModel>> organizerVerificationRequestsCreate({
    requestId,
    status,
    message,
  }){
    final request = ConfirmationRequest(requestId: requestId, status: status, message: message);
    return apiCalls.organizerVerificationRequestsCreate(request);
  }


}

