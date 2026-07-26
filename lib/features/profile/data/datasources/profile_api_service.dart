import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/models/generic_list_response.dart';
import '../../../../core/network/models/generic_response.dart';
import '../models/edit_profile_request.dart';
import '../models/image_model.dart';
import '../models/notification_model.dart';
import '../models/profile_model.dart';

part 'profile_api_service.g.dart';

/// Retrofit REST client interface for Profile & User endpoints.
@RestApi(baseUrl: ApiEndpoints.baseUrl)
abstract class ProfileApiService {
  /// Factory constructor for [ProfileApiService].
  factory ProfileApiService(Dio dio, {String baseUrl}) = _ProfileApiService;

  /// Fetches user profile.
  @GET(ApiEndpoints.userProfile)
  Future<GenericResponse<ProfileModel>> userProfile();

  /// Updates user profile.
  @POST(ApiEndpoints.userProfile)
  Future<GenericResponse<ProfileModel>> userProfileUpdate(
    @Body() EditProfileReqeust request,
  );

  /// Lists user photos.
  @GET(ApiEndpoints.userPhotos)
  Future<GenericResponse<GenericListResponse<List<ImageModel>>>> userPhotosList(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('search') String? search,
  );

  /// Deletes user photo by id.
  @DELETE(ApiEndpoints.userPhotosDelete)
  Future<GenericResponse<ImageModel>> userPhotosDelete(@Path('id') int id);

  /// Lists user notifications.
  @GET(ApiEndpoints.userNotifications)
  Future<GenericResponse<GenericListResponse<List<NotificationModel>>>>
  userNotifications(
    @Query('page') int page,
    @Query('page_size') int pageSize,
    @Query('search') String? search,
  );
}
