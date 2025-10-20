// Basic Flutter widget test for Fuego Wallet

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:xfg_wallet/main.dart';

void main() {
  testWidgets('Fuego Wallet app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const XFGWalletApp());

    // Wait for the typewriter animation to complete but before navigation (1.5 seconds)
    await tester.pump(const Duration(milliseconds: 1500));

    // Verify that our app starts with the splash screen
    expect(find.text('Fyrefly XF₲_wallet'), findsOneWidget);
    expect(find.text('Privacy Blockchain Banking'), findsOneWidget);
  });
}
