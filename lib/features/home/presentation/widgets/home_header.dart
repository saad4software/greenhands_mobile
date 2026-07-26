import 'package:flutter/material.dart';
import '../../../../core/theme/app_typography.dart';
import '../../domain/entities/home_entity.dart';

/// Header widget displaying home title and summary metrics.
class HomeHeader extends StatelessWidget {
  /// Home entity data.
  final HomeEntity data;

  /// Creates a [HomeHeader] widget.
  const HomeHeader({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(12),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.title, style: AppTypography.headlineLarge),
          const SizedBox(height: 8.0),
          Text(data.description, style: AppTypography.bodyMedium),
          const SizedBox(height: 16.0),
          Row(
            children: [
              Icon(Icons.eco, color: theme.colorScheme.primary),
              const SizedBox(width: 8.0),
              Text(
                '${data.activeProjectsCount} Active Initiatives',
                style: AppTypography.titleMedium.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
