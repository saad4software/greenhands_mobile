import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_needs_usecase.dart';
import 'needs_event.dart';
import 'needs_state.dart';

/// BLoC managing public needs state.
class NeedsBloc extends Bloc<NeedsEvent, NeedsState> {
  final GetNeedsUseCase _getNeedsUseCase;

  /// Creates a [NeedsBloc] with injected [GetNeedsUseCase].
  NeedsBloc(this._getNeedsUseCase) : super(const NeedsInitial()) {
    on<FetchNeedsEvent>(_onFetchNeeds);
  }

  Future<void> _onFetchNeeds(
    FetchNeedsEvent event,
    Emitter<NeedsState> emit,
  ) async {
    emit(const NeedsLoading());
    try {
      final needs = await _getNeedsUseCase(
        page: event.page,
        search: event.search,
      );
      emit(NeedsLoaded(needs));
    } catch (e) {
      emit(NeedsError(e.toString()));
    }
  }
}
