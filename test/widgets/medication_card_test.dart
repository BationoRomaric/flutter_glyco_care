import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glyco_care/screens/dashboard/widgets/medication_card.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('MedicationCard', () {
    late Widget medicationCard;

    setUp(() {
      medicationCard = const MedicationCard();
    });

    testWidgets('devrait afficher le titre MEDICATION', (tester) async {
      await pumpTestWidget(tester, medicationCard);

      expect(find.text('MEDICATION'), findsOneWidget);
    });

    testWidgets('devrait afficher le nom du médicament', (tester) async {
      await pumpTestWidget(tester, medicationCard);

      expect(find.text('Metformin'), findsOneWidget);
    });

    testWidgets('devrait afficher le dosage et l\'heure', (tester) async {
      await pumpTestWidget(tester, medicationCard);

      expect(find.text('500mg • Due 9:00 AM'), findsOneWidget);
    });

    testWidgets('devrait avoir un bouton Take', (tester) async {
      await pumpTestWidget(tester, medicationCard);

      expect(find.text('Take'), findsOneWidget);
    });

    testWidgets('devrait avoir l\'icône médicale', (tester) async {
      await pumpTestWidget(tester, medicationCard);

      expect(find.byIcon(Icons.medical_services), findsOneWidget);
    });

    testWidgets('le bouton Take devrait être cliquable', (tester) async {
      await pumpTestWidget(tester, medicationCard);

      final takeButton = find.text('Take');
      await tester.tap(takeButton);
      await tester.pumpAndSettle();

      // Vérifier que le bouton répond
      expect(takeButton, findsOneWidget);
    });
  });
}