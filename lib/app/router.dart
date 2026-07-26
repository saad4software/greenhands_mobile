import 'package:auto_route/auto_route.dart';
import '../features/home/presentation/pages/home_page.dart';

part 'router.gr.dart';

/// Main declarative AppRouter configuration for navigation.
@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
  ];
}
