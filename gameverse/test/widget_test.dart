import 'package:flutter_test/flutter_test.dart';
import 'package:gameverse/main.dart';

void main() {
  testWidgets('App launches smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const GameVerseApp());
    expect(find.byType(GameVerseApp), findsOneWidget);
  });
}
