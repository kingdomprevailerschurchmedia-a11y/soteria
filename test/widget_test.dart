import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soteria/main.dart';

void main() {
  testWidgets('Dashboard title smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const ProviderScope(
        child: SoteriaApp(),
      ),
    );

    // Verify that the dashboard title is present.
    expect(find.text('Soteria Dashboard'), findsOneWidget);
  });
}
