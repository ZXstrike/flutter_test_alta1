import 'package:flutter/material.dart';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_alta1/app_screen/advance_input_field/advance_app.dart';

void main() {
  testWidgets('Cheking is widget is showed', (WidgetTester tester) async {
    await tester.pumpWidget(const AdvanceMSApp());

    final dateField = find.ancestor(
        of: find.text('date'), matching: find.byType(TextFormField));

    expect(dateField, findsOneWidget);
    expect(find.text('date'), findsOneWidget);
    expect(find.text('Pick Color!'), findsOneWidget);
    expect(find.text('Pick File'), findsOneWidget);
  });
}