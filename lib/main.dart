import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/router.dart';
import 'core/di/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupServiceLocator();

  final appRouter = AppRouter();
  runApp(GreenhandsApp(appRouter: appRouter));
}
