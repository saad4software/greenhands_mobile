import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import '../index.dart';



@immutable
class GenericListResponse<T> {

  const GenericListResponse({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  final int count;
  final String? next;
  final String? previous;
  final T results;

  factory GenericListResponse.fromJson(Map<String,dynamic> json, Function fromJsonModel) => GenericListResponse(
    count: json['count'] as int,
    next: json['next'] != null ? json['next'] as String : null,
    previous: json['previous'] != null ? json['previous'] as String : null,
    results: fromJsonModel(json['results']) as T
  );
  
  Map<String, dynamic> toJson(Map<String, dynamic> Function() toJsonModel) => {
    'count': count,
    'next': next,
    'previous': previous,
    'results': toJsonModel()
  };

  GenericListResponse clone() => GenericListResponse(
    count: count,
    next: next,
    previous: previous,
    results: results
  );


  GenericListResponse copyWith({
    int? count,
    Optional<String?>? next,
    Optional<String?>? previous,
    T? results
  }) => GenericListResponse(
    count: count ?? this.count,
    next: checkOptional(next, this.next),
    previous: checkOptional(previous, this.previous),
    results: results ?? this.results,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is GenericListResponse && count == other.count && next == other.next && previous == other.previous && results == other.results;

  @override
  int get hashCode => count.hashCode ^ next.hashCode ^ previous.hashCode ^ results.hashCode;

}
