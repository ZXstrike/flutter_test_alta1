import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_alta1/app_screen/just_for_ui_testing/just_for_testing.dart';

void main() {
  testWidgets('Prioritas 2', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: JustForTesting(),
    ));

    expect(find.text('Just For Testing'), findsNWidgets(2));

    expect(find.byIcon(Icons.add), findsOneWidget);
  });
}
