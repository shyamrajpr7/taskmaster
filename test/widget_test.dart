import 'package:flutter_test/flutter_test.dart';

import 'package:taskmaster/main.dart';

void main() {
  testWidgets('App renders dashboard', (WidgetTester tester) async {
    await tester.pumpWidget(const TaskMasterApp());
    expect(find.textContaining('Hello'), findsOneWidget);
  });
}