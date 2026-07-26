import 'package:flutter_test/flutter_test.dart';

import 'package:greenhands/app/app.dart';
import 'package:greenhands/app/router.dart';
import 'package:greenhands/core/di/service_locator.dart';

void main() {
  setUp(() async {
    await sl.reset();
    await setupServiceLocator();
  });

  testWidgets('GreenhandsApp launches and renders Home screen with 3 bottom navigation tabs', (
    WidgetTester tester,
  ) async {
    final appRouter = AppRouter();
    await tester.pumpWidget(GreenhandsApp(appRouter: appRouter));
    await tester.pumpAndSettle();

    expect(find.text('Map'), findsWidgets);
    expect(find.text('Needs'), findsWidgets);
    expect(find.text('More'), findsWidgets);
  });
}
