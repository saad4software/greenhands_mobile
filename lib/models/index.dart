export 'responses/generic_list_response.dart';
export 'responses/generic_response.dart';
export 'responses/geo_location_response.dart';
export 'entities/verification_request_model.dart';
export 'entities/token_model.dart';
export 'entities/category_model.dart';
export 'entities/profile_model.dart';
export 'entities/notification_model.dart';
export 'entities/point_model.dart';
export 'entities/image_model.dart';
export 'entities/need_model.dart';
export 'requests/login_request.dart';
export 'requests/need_request.dart';
export 'requests/provide_need_reqeust.dart';
export 'requests/edit_point_request.dart';
export 'requests/verification_request.dart';
export 'requests/anonymous_login_request.dart';
export 'requests/confirmation_request.dart';
export 'requests/edit_profile_reqeust.dart';
export 'requests/register_request.dart';
import 'package:quiver/core.dart';

T? checkOptional<T>(Optional<T?>? optional, T? def) {
  // No value given, just take default value
  if (optional == null) return def;

  // We have an input value
  if (optional.isPresent) return optional.value;

  // We have a null inside the optional
  return null;
}
