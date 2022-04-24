import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:greenhands_mobile/models/index.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'network_interceptor.dart';

part 'api_calls.g.dart';

@RestApi(baseUrl: "http://172.16.246.1:8000/api/")
abstract class ApiCalls {
  factory ApiCalls(Dio dio,{String baseUrl}) = _ApiCalls;


  @POST("login/")
  Future<GenericResponse<TokenModel>> login(@Body() LoginRequest request);

  @POST("anonymous_login/")
  Future<GenericResponse<TokenModel>> anonymousLogin(@Body() AnonymousLoginRequest request);

  @POST("register/")
  Future<GenericResponse<ProfileModel>> register(@Body() RegisterRequest request);

  @GET("http://ip-api.com/json")
  Future<GeoLocationResponse> geoLocation();

  @GET("points/")
  Future<GenericResponse<GenericListResponse<List<PointModel>>>> points(
      @Query("page") int page,
      @Query("page_size") int pageSize,
      @Query("search") String? search,
      @Query("min_lat") double? minLat,
      @Query("max_lat") double? maxLat,
      @Query("min_lng") double? minLng,
      @Query("max_lng") double? maxLng);

  @GET("needs/")
  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> needs(
      @Query("page") int page,
      @Query("page_size") int pageSize,
      @Query("search") String? search);

  @GET("organizers/")
  Future<GenericResponse<GenericListResponse<List<ProfileModel>>>> organizers(
      @Query("page") int page,
      @Query("page_size") int pageSize,
      @Query("search") String? search,
      @Query("min_lat") double? minLat,
      @Query("max_lat") double? maxLat,
      @Query("min_lng") double? minLng,
      @Query("max_lng") double? maxLng);

  @GET("categories/")
  Future<GenericResponse<GenericListResponse<List<CategoryModel>>>> categories(
      @Query("page") int page,
      @Query("page_size") int pageSize,
      @Query("search") String? search);



  @GET("user/photos/")
  Future<GenericResponse<GenericListResponse<List<ImageModel>>>> userPhotosList(
      @Query("page") int page,
      @Query("page_size") int pageSize,
      @Query("search") String? search);

  // @POST("user/photos/")
  // Future<GenericResponse<ImageModel>> userPhotosCreate();

  @DELETE("user/photos/{id}")
  Future<GenericResponse<ImageModel>> userPhotosDelete(@Path("id") int id);

  @GET("user/profile/")
  Future<GenericResponse<ProfileModel>> userProfile();

  @GET("user/profile/")
  Future<GenericResponse<ProfileModel>> userProfileUpdate(@Body() EditProfileReqeust request);

  @GET("user/notifications/")
  Future<GenericResponse<GenericListResponse<List<NotificationModel>>>> userNotifications(
      @Query("page") int page,
      @Query("page_size") int pageSize,
      @Query("search") String? search);



  @GET("giver/provide/")
  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> giverProvideList(
      @Query("page") int page,
      @Query("page_size") int pageSize,
      @Query("search") String? search);

  @POST("giver/provide/")
  Future<GenericResponse<NeedModel>> giverProvideNeed(@Body() ProvideNeedReqeust request);



  @GET("taker/needs/")
  Future<GenericResponse<GenericListResponse<List<NeedModel>>>> takerNeedsList(
      @Query("page") int page,
      @Query("page_size") int pageSize,
      @Query("search") String? search);

  @DELETE("taker/needs/{id}")
  Future<GenericResponse<NeedModel>> takerNeedsDelete(@Path("id") int id);

  @POST("taker/needs/")
  Future<GenericResponse<NeedModel>> takerNeedsCreate(@Body() NeedRequest request);

  @GET("taker/point/")
  Future<GenericResponse<PointModel>> takerPoint();

  @POST("taker/point/")
  Future<GenericResponse<PointModel>> takerPointUpdate(@Body() EditPointRequest request);

  @GET("taker/verify/")
  Future<GenericResponse<GenericListResponse<List<VerificationRequestModel>>>> takerVerificationRequestsList(
      @Query("page") int page,
      @Query("page_size") int pageSize,
      @Query("search") String? search);

  @POST("taker/verify/")
  Future<GenericResponse<VerificationRequestModel>> takerVerificationRequestsCreate(@Body() VerificationRequest request);


  @GET("organizer/requests/")
  Future<GenericResponse<GenericListResponse<List<VerificationRequestModel>>>> organizerVerificationRequestsList(
      @Query("page") int page,
      @Query("page_size") int pageSize,
      @Query("search") String? search);

  @POST("organizer/requests/")
  Future<GenericResponse<VerificationRequestModel>> organizerVerificationRequestsCreate(@Body() ConfirmationRequest request);

}