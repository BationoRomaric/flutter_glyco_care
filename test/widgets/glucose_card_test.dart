import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glyco_care/screens/dashboard/widgets/glucose_card.dart';
import 'package:glyco_care/screens/dashboard/widgets/charts/glucose_chart_painter.dart';
import 'package:glyco_care/theme/app_colors.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('GlucoseCard', () {
    late Widget glucoseCard;

    setUp(() {
      glucoseCard = const GlucoseCard();
    });

    testWidgets('devrait afficher le titre CURRENT GLUCOSE', (tester) async {
      await pumpTestWidget(tester, glucoseCard);

      expect(find.text('CURRENT GLUCOSE'), findsOneWidget);
    });

    testWidgets('devrait afficher la valeur 112 mg/dL', (tester) async {
      await pumpTestWidget(tester, glucoseCard);

      expect(find.text('112'), findsOneWidget);
      expect(find.text('mg/dL'), findsOneWidget);
    });

    testWidgets('devrait afficher le statut Normal avec badge vert',
            (tester) async {
          await pumpTestWidget(tester, glucoseCard);

          expect(find.text('Normal'), findsOneWidget);
        });

    testWidgets('devrait afficher "Measured 10 mins ago"', (tester) async {
      await pumpTestWidget(tester, glucoseCard);

      expect(find.text('Measured 10 mins ago'), findsOneWidget);
    });

    testWidgets('devrait contenir un graphique CustomPaint', (tester) async {
      await pumpTestWidget(tester, glucoseCard);

      expect(find.byType(CustomPaint), findsOneWidget);
    });

    testWidgets('devrait afficher "Target Range" sur le graphique',
            (tester) async {
          await pumpTestWidget(tester, glucoseCard);

          expect(find.text('Target Range'), findsOneWidget);
        });

    testWidgets('devrait avoir l\'icône trending_flat', (tester) async {
      await pumpTestWidget(tester, glucoseCard);

      expect(find.byIcon(Icons.trending_flat), findsOneWidget);
    });

    testWidgets('devrait avoir les bonnes dimensions', (tester) async {
      await pumpTestWidget(tester, glucoseCard);

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.borderRadius, BorderRadius.circular(12));
    });

    testWidgets('devrait avoir une ombre portée', (tester) async {
      await pumpTestWidget(tester, glucoseCard);

      final container = tester.widget<Container>(find.byType(Container).first);
      final decoration = container.decoration as BoxDecoration;

      expect(decoration.boxShadow, isNotNull);
      expect(decoration.boxShadow!.length, greaterThan(0));
    });
  });

  group('GlucoseChartPainter', () {
    test('devrait peindre sans erreur', () {
      final painter = GlucoseChartPainter();
      final recorder = PictureRecorder();
      final canvas = Canvas(recorder, const Rect.fromLTWH(0, 0, 400, 160));

      // Ne devrait pas lancer d'exception
      expect(() => painter.paint(canvas, const Size(400, 160)), returnsNormally);
    });

    test('shouldRepaint devrait retourner false', () {
      final painter = GlucoseChartPainter();

      expect(painter.shouldRepaint(painter), isFalse);
    });

    test('shouldRepaint devrait retourner false pour différentes instances',
            () {
          final painter1 = GlucoseChartPainter();
          final painter2 = GlucoseChartPainter();

          expect(painter1.shouldRepaint(painter2), isFalse);
        });
  });
}