import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';

/// Helper pour wrapper les widgets dans MaterialApp pour les tests
Widget createTestApp(Widget child) {
  return MaterialApp(
    home: Scaffold(
      body: child,
    ),
  );
}

/// Helper pour créer un widget avec thème
Widget createThemedTestApp(Widget child) {
  return MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
      primaryColor: const Color(0xFF004CCD),
      scaffoldBackgroundColor: const Color(0xFFF7FAFC),
    ),
    home: Scaffold(
      body: child,
    ),
  );
}

/// Helper pour pump un widget avec MaterialApp
Future<void> pumpTestWidget(
    WidgetTester tester,
    Widget widget,
    ) async {
  await tester.pumpWidget(createThemedTestApp(widget));
  await tester.pumpAndSettle();
}

/// Matchers personnalisés pour les couleurs
Matcher isPrimaryColor() {
  return isSameColorAs(const Color(0xFF004CCD));
}

Matcher isSurfaceColor() {
  return isSameColorAs(const Color(0xFFF7FAFC));
}

/// Vérifie si deux couleurs sont identiques
Matcher isSameColorAs(Color expectedColor) {
  return _ColorMatcher(expectedColor);
}

class _ColorMatcher extends Matcher {
  final Color expectedColor;

  _ColorMatcher(this.expectedColor);

  @override
  bool matches(dynamic item, Map matchState) {
    if (item is Color) {
      return item.toARGB32() == expectedColor.toARGB32();
    }
    return false;
  }

  @override
  Description describe(Description description) {
    return description.add('is same color as $expectedColor');
  }
}