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
  late SharedPreferences preferences;

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
    preferences = await SharedPreferences.getInstance();

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
      PrefModel.instance.saveData(preferences);

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

  Future<GeoLocationResponse> geoLocation(){
    return apiCalls.geoLocation();
  }

  Future<GenericResponse<GenericListResponse<List<PointModel>>>> points(int page, int page_size, String? search){
    return apiCalls.points(page, page_size, search);
  }

  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> needs(int page, int page_size, String? search){
    return apiCalls.needs(page, page_size, search);
  }

  Future<GenericResponse<GenericListResponse<List<ProfileModel>>>> organizers(int page, int page_size, String? search){
    return apiCalls.organizers(page, page_size, search);
  }

  Future<GenericResponse<GenericListResponse<List<CategoryModel>>>> categories(int page, int page_size, String? search){
    return apiCalls.categories(page, page_size, search);
  }



  Future<GenericResponse<GenericListResponse<List<ImageModel>>>> userPhotosList(@Query("page") int page, @Query("page_size") int page_size, @Query("search") String? search){
    return apiCalls.userPhotosList(page, page_size, search);
  }

  // @POST("user/photos/")
  // Future<GenericResponse<ImageModel>> userPhotosCreate();

  Future<GenericResponse<ImageModel>> userPhotosDelete(@Path("id") int id){
    return apiCalls.userPhotosDelete(id);
  }

  Future<GenericResponse<ProfileModel>> userProfile(){
    return apiCalls.userProfile();
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

  Future<GenericResponse<GenericListResponse<List<NotificationModel>>>> userNotifications(@Query("page") int page, @Query("page_size") int page_size, @Query("search") String? search){
    return apiCalls.userNotifications(page, page_size, search);
  }



  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> giverProvideList(@Query("page") int page, @Query("page_size") int page_size, @Query("search") String? search){
    return apiCalls.giverProvideList(page, page_size, search);
  }

  Future<GenericResponse<NeedModel>> giverProvideNeed({
    needId,
    message,
  }){
    final request = ProvideNeedReqeust(needId: needId, message: message);
    return apiCalls.giverProvideNeed(request);
  }



  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> takerNeedsList(@Query("page") int page, @Query("page_size") int page_size, @Query("search") String? search){
    return apiCalls.takerNeedsList(page, page_size, search);
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

  Future<GenericResponse<PointModel>> takerPoint(){
    return apiCalls.takerPoint();
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

  Future<GenericResponse<GenericListResponse<VerificationRequestModel>>> takerVerificationRequestsList(@Query("page") int page, @Query("page_size") int page_size, @Query("search") String? search){
    return takerVerificationRequestsList(page, page_size, search);
  }

  Future<GenericResponse<VerificationRequestModel>> takerVerificationRequestsCreate({
    organizerId,
    message,
  }){
    final request = VerificationRequest(organizerId: organizerId, message: message);
    return apiCalls.takerVerificationRequestsCreate(request);
  }


  Future<GenericResponse<GenericListResponse<List<VerificationRequestModel>>>> organizerVerificationRequestsList(){
    return apiCalls.organizerVerificationRequestsList();
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

