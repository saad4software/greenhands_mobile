import 'package:flutter/material.dart';
import 'app_colors.dart';

/// Typography definitions for Greenhands application.
abstract final class AppTypography {
  /// Heading 1 text style.
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 28.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimaryLight,
  );

  /// Title medium text style.
  static const TextStyle titleMedium = TextStyle(
    fontSize: 18.0,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimaryLight,
  );

  /// Body large text style.
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textPrimaryLight,
  );

  /// Body medium text style.
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.normal,
    color: AppColors.textSecondary,
  );
}
