import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_create/main.dart';

void main() {
  testWidgets('Test PeriodicTableApp', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(PeriodicTableApp());

    // Verify that the title of the AppBar is shown.
    expect(find.text('Periodic Table'), findsOneWidget);

    // Verify that the CircularProgressIndicator is shown initially.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // You can add more expectations/assertions as needed to thoroughly test your UI.
  });
}
