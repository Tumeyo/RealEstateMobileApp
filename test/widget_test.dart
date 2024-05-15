import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:realestate_project/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our app starts with the initial text or widget.
    expect(find.text('YourInitialText'),
        findsOneWidget); // Update 'YourInitialText' to match your app's initial state
    expect(find.text('YourButton'),
        findsOneWidget); // Update 'YourButton' to match the button text or icon in your app

    // Tap the button or perform the action that triggers the counter increment.
    await tester.tap(find
        .byIcon(Icons.add)); // Update to find your actual button or interaction

    // Trigger a frame after the interaction.
    await tester.pump();

    // Verify that the counter has been updated or the new widget is present after the interaction.
    expect(find.text('YourUpdatedText'),
        findsOneWidget); // Update 'YourUpdatedText' to match the expected text after the interaction
  });
}
