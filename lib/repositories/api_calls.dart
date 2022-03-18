import 'package:greenhands_mobile/models/index.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'network_interceptor.dart';

part 'api_calls.g.dart';

@RestApi(baseUrl: "http://127.0.0.1:8000/api/")
abstract class ApiCalls {
  factory ApiCalls(Dio dio,{String baseUrl}) = _ApiCalls;


  static Dio getClient(){
    var dio = Dio(); // with default Options
    dio.options.headers["Content-Type"] = "application/json";
    dio.options.connectTimeout = 5000; //5s
    dio.options.receiveTimeout = 3000;
    dio.interceptors.add(NetworkInterceptor());
    return dio;
  }

  @POST("login/")
  Future<GenericResponse<TokenModel>> login(@Body() LoginRequest request);

  @POST("anonymous_login/")
  Future<GenericResponse<TokenModel>> anonymousLogin(@Body() LoginRequest request);

  @POST("register/")
  Future<GenericResponse<ProfileModel>> register(@Body() RegisterRequest request);

  @GET("points/")
  Future<GenericResponse<GenericListResponse<PointModel>>> points(@Query("page") int page, @Query("page_size") int page_size, @Query("search") String? search);

  @GET("needs/")
  Future<GenericResponse<GenericListResponse<NeedModel>>> needs(@Query("page") int page, @Query("page_size") int page_size, @Query("search") String? search);

  @GET("organizers/")
  Future<GenericResponse<GenericListResponse<ProfileModel>>> organizers(@Query("page") int page, @Query("page_size") int page_size, @Query("search") String? search);

  @GET("categories/")
  Future<GenericResponse<GenericListResponse<CategoryModel>>> categories(@Query("page") int page, @Query("page_size") int page_size, @Query("search") String? search);



  @GET("user/photos/")
  Future<GenericResponse<GenericListResponse<ImageModel>>> userPhotosList(@Query("page") int page, @Query("page_size") int page_size, @Query("search") String? search);

  // @POST("user/photos/")
  // Future<GenericResponse<ImageModel>> userPhotosCreate();

  @DELETE("user/photos/{id}")
  Future<GenericResponse<ImageModel>> userPhotosDelete(@Path("id") int id);

  @GET("user/profile/")
  Future<GenericResponse<ProfileModel>> userProfile();

  @GET("user/profile/")
  Future<GenericResponse<ProfileModel>> userProfileUpdate(@Body() EditProfileReqeust request);

  @GET("user/notifications/")
  Future<GenericResponse<GenericListResponse<NotificationModel>>> userNotifications(@Query("page") int page, @Query("page_size") int page_size, @Query("search") String? search);



  @GET("giver/provide/")
  Future<GenericResponse<GenericListResponse<NeedModel>>> giverProvideList(@Query("page") int page, @Query("page_size") int page_size, @Query("search") String? search);

  @POST("giver/provide/")
  Future<GenericResponse<NeedModel>> giverProvideNeed(@Body() ProvideNeedReqeust request);



  @GET("taker/needs/")
  Future<GenericResponse<GenericListResponse<NeedModel>>> takerNeedsList(@Query("page") int page, @Query("page_size") int page_size, @Query("search") String? search);

  @DELETE("taker/needs/{id}")
  Future<GenericResponse<NeedModel>> takerNeedsDelete(@Path("id") int id);

  @POST("taker/needs/")
  Future<GenericResponse<NeedModel>> takerNeedsCreate(@Body() NeedRequest request);

  @GET("taker/point/")
  Future<GenericResponse<PointModel>> takerPoint();

  @POST("taker/point/")
  Future<GenericResponse<PointModel>> takerPointUpdate(@Body() EditPointRequest request);

  @GET("taker/verify/")
  Future<GenericResponse<GenericListResponse<VerificationRequestModel>>> takerVerificationRequestsList(@Query("page") int page, @Query("page_size") int page_size, @Query("search") String? search);

  @POST("taker/verify/")
  Future<GenericResponse<VerificationRequestModel>> takerVerificationRequestsCreate(@Body() VerificationRequest request);



  @GET("organizer/requests/")
  Future<GenericResponse<GenericListResponse<VerificationRequestModel>>> organizerVerificationRequestsList();

  @POST("organizer/requests/")
  Future<GenericResponse<VerificationRequestModel>> organizerVerificationRequestsCreate(@Body() ConfirmationRequest request);

}