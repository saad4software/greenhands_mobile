import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/points_repository.dart';
import '../../domain/usecases/get_organizers_usecase.dart';
import '../../domain/usecases/get_points_usecase.dart';
import 'points_event.dart';
import 'points_state.dart';

/// BLoC managing map points and organizers data.
class PointsBloc extends Bloc<PointsEvent, PointsState> {
  final GetPointsUseCase _getPointsUseCase;
  final GetOrganizersUseCase _getOrganizersUseCase;

  /// Creates a [PointsBloc] with injected use cases.
  PointsBloc(this._getPointsUseCase, this._getOrganizersUseCase)
      : super(const PointsInitial()) {
    on<FetchMapDataEvent>(_onFetchMapData);
  }

  Future<void> _onFetchMapData(
    FetchMapDataEvent event,
    Emitter<PointsState> emit,
  ) async {
    emit(const PointsLoading());
    try {
      final params = MapRegionParams(
        minLat: event.minLat,
        maxLat: event.maxLat,
        minLng: event.minLng,
        maxLng: event.maxLng,
      );

      final pointsResult = await _getPointsUseCase(params);
      final organizersResult = await _getOrganizersUseCase(params);

      emit(PointsLoaded(points: pointsResult, organizers: organizersResult));
    } catch (e) {
      emit(PointsError(e.toString()));
    }
  }
}
