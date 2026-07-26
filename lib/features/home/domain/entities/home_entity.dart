import 'package:equatable/equatable.dart';

/// Entity representing home dashboard data.
class HomeEntity extends Equatable {
  /// Welcome message.
  final String title;

  /// Subtitle description.
  final String description;

  /// Active initiative or project count.
  final int activeProjectsCount;

  /// Creates a [HomeEntity].
  const HomeEntity({
    required this.title,
    required this.description,
    required this.activeProjectsCount,
  });

  @override
  List<Object?> get props => [title, description, activeProjectsCount];
}
