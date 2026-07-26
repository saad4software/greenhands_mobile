import '../../../../core/error/exceptions.dart';
import '../../../../core/network/models/generic_list_response.dart';
import '../../../../core/network/models/generic_response.dart';
import '../models/edit_profile_request.dart';
import '../models/image_model.dart';
import '../models/notification_model.dart';
import '../models/profile_model.dart';
import 'profile_api_service.dart';

/// Contract for Profile remote data source.
abstract class ProfileRemoteDataSource {
  /// Fetches the profile of the current user.
  Future<GenericResponse<ProfileModel>> userProfile();

  /// Updates profile of current user.
  Future<GenericResponse<ProfileModel>> userProfileUpdate(
    EditProfileReqeust request,
  );

  /// Retrieves paginated list of user uploaded photos.
  Future<GenericResponse<GenericListResponse<List<ImageModel>>>>
  userPhotosList({required int page, required int pageSize, String? search});

  /// Deletes a specific photo by [id].
  Future<GenericResponse<ImageModel>> userPhotosDelete(int id);

  /// Retrieves paginated user notifications.
  Future<GenericResponse<GenericListResponse<List<NotificationModel>>>>
  userNotifications({required int page, required int pageSize, String? search});
}

/// Implementation of [ProfileRemoteDataSource] using [ProfileApiService].
class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final ProfileApiService _apiService;

  /// Creates an instance of [ProfileRemoteDataSourceImpl].
  ProfileRemoteDataSourceImpl(this._apiService);

  @override
  Future<GenericResponse<ProfileModel>> userProfile() async {
    try {
      return await _apiService.userProfile();
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<ProfileModel>> userProfileUpdate(
    EditProfileReqeust request,
  ) async {
    try {
      return await _apiService.userProfileUpdate(request);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<GenericListResponse<List<ImageModel>>>>
  userPhotosList({
    required int page,
    required int pageSize,
    String? search,
  }) async {
    try {
      return await _apiService.userPhotosList(page, pageSize, search);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<ImageModel>> userPhotosDelete(int id) async {
    try {
      return await _apiService.userPhotosDelete(id);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GenericResponse<GenericListResponse<List<NotificationModel>>>>
  userNotifications({
    required int page,
    required int pageSize,
    String? search,
  }) async {
    try {
      return await _apiService.userNotifications(page, pageSize, search);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
