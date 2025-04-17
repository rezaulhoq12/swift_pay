import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swiftpay_clone/main.dart';

void main() {
  testWidgets('Login screen loads with all fields', (WidgetTester tester) async {
    // Build SwiftPayApp and trigger a frame
    await tester.pumpWidget(const SwiftPayApp());

    // Wait for widgets to settle
    await tester.pumpAndSettle();

    // Check for login screen texts and form fields
    expect(find.text('Login to Your Account'), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2)); // Username & Email
    expect(find.text('Login'), findsOneWidget);
    expect(find.text("Don't have an account?"), findsOneWidget);
    expect(find.text('Register'), findsOneWidget);
  });
}
