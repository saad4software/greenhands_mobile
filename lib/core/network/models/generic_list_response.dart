import 'package:equatable/equatable.dart';

/// Generic paginated list response wrapper.
class GenericListResponse<T> extends Equatable {
  /// Total count of items.
  final int count;

  /// URL for the next page of results, if available.
  final String? next;

  /// URL for the previous page of results, if available.
  final String? previous;

  /// List or container of results payload of type [T].
  final T results;

  /// Creates a [GenericListResponse] instance.
  const GenericListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  /// Deserializes JSON into [GenericListResponse].
  factory GenericListResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return GenericListResponse<T>(
      count: json['count'] as int,
      next: json['next'] as String?,
      previous: json['previous'] as String?,
      results: fromJsonT(json['results']),
    );
  }

  /// Serializes [GenericListResponse] to JSON.
  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) {
    return <String, dynamic>{
      'count': count,
      'next': next,
      'previous': previous,
      'results': toJsonT(results),
    };
  }

  @override
  List<Object?> get props => [count, next, previous, results];
}
