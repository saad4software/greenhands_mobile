import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import '../core/constants/app_constants.dart';
import '../core/theme/app_theme.dart';
import 'router.dart';

/// Root application widget.
class GreenhandsApp extends StatelessWidget {
  /// AppRouter instance.
  final AppRouter appRouter;

  /// Creates a [GreenhandsApp] with given [appRouter].
  const GreenhandsApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp.router(
        title: AppConstants.appName,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: appRouter.config(),
      ),
    );
  }
}
