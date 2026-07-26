import 'package:equatable/equatable.dart';
import '../../domain/entities/need_entity.dart';

/// Sealed base state for NeedsBloc.
sealed class NeedsState extends Equatable {
  const NeedsState();

  @override
  List<Object?> get props => [];
}

/// Initial state of NeedsBloc.
class NeedsInitial extends NeedsState {
  const NeedsInitial();
}

/// Loading state while fetching needs.
class NeedsLoading extends NeedsState {
  const NeedsLoading();
}

/// State when needs have successfully loaded.
class NeedsLoaded extends NeedsState {
  /// List of aid needs.
  final List<NeedEntity> needs;

  /// Creates a [NeedsLoaded] state.
  const NeedsLoaded(this.needs);

  @override
  List<Object?> get props => [needs];
}

/// Error state when fetching needs fails.
class NeedsError extends NeedsState {
  /// User-friendly error message.
  final String message;

  /// Creates a [NeedsError] state.
  const NeedsError(this.message);

  @override
  List<Object?> get props => [message];
}
