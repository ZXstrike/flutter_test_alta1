import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_alta1/app_screen/get_contact_provider/get_contact_app.dart';

void main() {
  testWidgets('Eksplorasi', (WidgetTester tester) async {
    await tester.pumpWidget(const GetContactProviderApp());

    expect(find.text('ContactListProvider'), findsOneWidget);

    final nameTextField = find.ancestor(
      of: find.text('Name'),
      matching: find.byType(TextFormField),
    );

    final numberTextField = find.ancestor(
      of: find.text('Number'),
      matching: find.byType(TextFormField),
    );

    final submitButton = find.ancestor(
      of: find.text('Submit'),
      matching: find.byType(FilledButton),
    );

    expect(nameTextField, findsOneWidget);

    await tester.enterText(nameTextField, 'Udin Baba');

    expect(numberTextField, findsOneWidget);

    await tester.enterText(numberTextField, '087634535232');

    expect(
        find.ancestor(
          of: find.text('Udin Baba'),
          matching: find.byType(TextFormField),
        ),
        findsOneWidget);

    expect(
        find.ancestor(
          of: find.text('087634535232'),
          matching: find.byType(TextFormField),
        ),
        findsOneWidget);

    expect(submitButton, findsOneWidget);

    await tester.tap(submitButton);

    expect(
        find.ancestor(
          of: find.text('Udin Baba'),
          matching: find.byType(TextFormField),
        ),
        findsNothing);

    expect(
        find.ancestor(
          of: find.text('08763453523'),
          matching: find.byType(TextFormField),
        ),
        findsNothing);

    await tester.pump();

    expect(find.text('Udin Baba'), findsOneWidget);
  });
}