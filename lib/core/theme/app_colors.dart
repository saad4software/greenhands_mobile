import 'package:flutter/material.dart';

/// Color tokens for the Greenhands application.
abstract final class AppColors {
  /// Primary eco-friendly green color.
  static const Color primary = Color(0xFF2E7D32);

  /// Secondary complementary accent green.
  static const Color secondary = Color(0xFF81C784);

  /// Background color for light theme.
  static const Color backgroundLight = Color(0xFFF8F9FA);

  /// Background color for dark theme.
  static const Color backgroundDark = Color(0xFF121212);

  /// Surface color for cards and elevated components in light theme.
  static const Color surfaceLight = Colors.white;

  /// Surface color for cards and elevated components in dark theme.
  static const Color surfaceDark = Color(0xFF1E1E1E);

  /// Text primary color in light theme.
  static const Color textPrimaryLight = Color(0xFF1F2937);

  /// Text primary color in dark theme.
  static const Color textPrimaryDark = Color(0xFFF9FAFB);

  /// Text secondary color.
  static const Color textSecondary = Color(0xFF6B7280);

  /// Error color.
  static const Color error = Color(0xFFD32F2F);
}
