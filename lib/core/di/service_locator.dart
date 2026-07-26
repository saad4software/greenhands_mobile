import 'package:get_it/get_it.dart';
import '../../features/auth/data/datasources/auth_api_service.dart';
import '../../features/auth/data/datasources/auth_remote_data_source.dart';
import '../../features/categories/data/datasources/categories_api_service.dart';
import '../../features/categories/data/datasources/categories_remote_data_source.dart';
import '../../features/home/data/datasources/home_remote_data_source.dart';
import '../../features/home/data/repositories/home_repository_impl.dart';
import '../../features/home/domain/repositories/home_repository.dart';
import '../../features/home/domain/usecases/get_home_data_usecase.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/location/data/datasources/location_api_service.dart';
import '../../features/location/data/datasources/location_remote_data_source.dart';
import '../../features/needs/data/datasources/needs_api_service.dart';
import '../../features/needs/data/datasources/needs_remote_data_source.dart';
import '../../features/points/data/datasources/points_api_service.dart';
import '../../features/points/data/datasources/points_remote_data_source.dart';
import '../../features/profile/data/datasources/profile_api_service.dart';
import '../../features/profile/data/datasources/profile_remote_data_source.dart';
import '../../features/verification/data/datasources/verification_api_service.dart';
import '../../features/verification/data/datasources/verification_remote_data_source.dart';
import '../../features/needs/data/repositories/needs_repository_impl.dart';
import '../../features/needs/domain/repositories/needs_repository.dart';
import '../../features/needs/domain/usecases/get_needs_usecase.dart';
import '../../features/needs/presentation/bloc/needs_bloc.dart';
import '../../features/points/data/repositories/points_repository_impl.dart';
import '../../features/points/domain/repositories/points_repository.dart';
import '../../features/points/domain/usecases/get_organizers_usecase.dart';
import '../../features/points/domain/usecases/get_points_usecase.dart';
import '../../features/points/presentation/bloc/points_bloc.dart';
import '../network/dio_client.dart';

/// Global service locator instance.
final GetIt sl = GetIt.instance;

/// Initializes app-wide dependency injection registrations.
Future<void> setupServiceLocator() async {
  // Core
  sl.registerLazySingleton<DioClient>(() => DioClient());

  // Auth Feature - API Service & Data Source
  sl.registerLazySingleton<AuthApiService>(
    () => AuthApiService(sl<DioClient>().dio),
  );
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl<AuthApiService>()),
  );

  // Profile Feature - API Service & Data Source
  sl.registerLazySingleton<ProfileApiService>(
    () => ProfileApiService(sl<DioClient>().dio),
  );
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(sl<ProfileApiService>()),
  );

  // Categories Feature - API Service & Data Source
  sl.registerLazySingleton<CategoriesApiService>(
    () => CategoriesApiService(sl<DioClient>().dio),
  );
  sl.registerLazySingleton<CategoriesRemoteDataSource>(
    () => CategoriesRemoteDataSourceImpl(sl<CategoriesApiService>()),
  );

  // Points Feature - API Service, Repositories, Use Cases & BLoCs
  sl.registerLazySingleton<PointsApiService>(
    () => PointsApiService(sl<DioClient>().dio),
  );
  sl.registerLazySingleton<PointsRemoteDataSource>(
    () => PointsRemoteDataSourceImpl(sl<PointsApiService>()),
  );
  sl.registerLazySingleton<PointsRepository>(
    () => PointsRepositoryImpl(sl<PointsRemoteDataSource>()),
  );
  sl.registerLazySingleton<GetPointsUseCase>(
    () => GetPointsUseCase(sl<PointsRepository>()),
  );
  sl.registerLazySingleton<GetOrganizersUseCase>(
    () => GetOrganizersUseCase(sl<PointsRepository>()),
  );
  sl.registerFactory<PointsBloc>(
    () => PointsBloc(sl<GetPointsUseCase>(), sl<GetOrganizersUseCase>()),
  );

  // Needs Feature - API Service, Repositories, Use Cases & BLoCs
  sl.registerLazySingleton<NeedsApiService>(
    () => NeedsApiService(sl<DioClient>().dio),
  );
  sl.registerLazySingleton<NeedsRemoteDataSource>(
    () => NeedsRemoteDataSourceImpl(sl<NeedsApiService>()),
  );
  sl.registerLazySingleton<NeedsRepository>(
    () => NeedsRepositoryImpl(sl<NeedsRemoteDataSource>()),
  );
  sl.registerLazySingleton<GetNeedsUseCase>(
    () => GetNeedsUseCase(sl<NeedsRepository>()),
  );
  sl.registerFactory<NeedsBloc>(() => NeedsBloc(sl<GetNeedsUseCase>()));


  // Verification Feature - API Service & Data Source
  sl.registerLazySingleton<VerificationApiService>(
    () => VerificationApiService(sl<DioClient>().dio),
  );
  sl.registerLazySingleton<VerificationRemoteDataSource>(
    () => VerificationRemoteDataSourceImpl(sl<VerificationApiService>()),
  );

  // Location Feature - API Service & Data Source
  sl.registerLazySingleton<LocationApiService>(
    () => LocationApiService(sl<DioClient>().dio),
  );
  sl.registerLazySingleton<LocationRemoteDataSource>(
    () => LocationRemoteDataSourceImpl(sl<LocationApiService>()),
  );

  // Home Feature - Data Sources
  sl.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(sl<DioClient>()),
  );

  // Home Feature - Repositories
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(sl<HomeRemoteDataSource>()),
  );

  // Home Feature - Use Cases
  sl.registerLazySingleton<GetHomeDataUseCase>(
    () => GetHomeDataUseCase(sl<HomeRepository>()),
  );

  // Home Feature - BLoCs
  sl.registerFactory<HomeBloc>(() => HomeBloc(sl<GetHomeDataUseCase>()));
}

