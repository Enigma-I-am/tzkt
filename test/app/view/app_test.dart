import 'package:flutter_test/flutter_test.dart';
import 'package:tzkt/app/app.dart';
import 'package:tzkt/counter/counter.dart';

void main() {
  group('App', () {
    testWidgets('renders CounterPage', (tester) async {
      await tester.pumpWidget(const App());
      expect(find.byType(HomePage), findsOneWidget);
    });
  });
}
