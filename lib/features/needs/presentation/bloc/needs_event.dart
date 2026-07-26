import 'package:equatable/equatable.dart';

/// Sealed base event for NeedsBloc.
sealed class NeedsEvent extends Equatable {
  const NeedsEvent();

  @override
  List<Object?> get props => [];
}

/// Event to fetch/refresh the public needs list.
class FetchNeedsEvent extends NeedsEvent {
  /// Page index.
  final int page;

  /// Search query.
  final String? search;

  /// Creates a [FetchNeedsEvent].
  const FetchNeedsEvent({this.page = 1, this.search});

  @override
  List<Object?> get props => [page, search];
}
