import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:widget/widgets.dart';

void main() {
  group('SuccessDialogTest', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(const SuccessDialog(title: "title"));

      // Verify that the SuccessDialog is rendered correctly
      expect(find.text('Success'), findsOneWidget);
      expect(find.text('Your action was successful!'), findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
    });

    testWidgets('calls onPressed callback when button is pressed',
        (WidgetTester tester) async {
      bool callbackCalled = false;

      await tester.pumpWidget(const SuccessDialog(title: "title"));

      // Tap the button
      await tester.tap(find.byType(IconButton));

      // Rebuild the widget after the tap
      await tester.pump();

      // Verify that the callback was called
      expect(callbackCalled, isTrue);
    });
  });

  group('OptionDialogTests', () {});
}
