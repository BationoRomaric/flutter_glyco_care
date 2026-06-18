import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glyco_care/screens/registration/widgets/diabetes_type_selector.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('DiabetesTypeSelector', () {
    String? selectedType;

    Widget createSelector() {
      return DiabetesTypeSelector(
        selectedType: selectedType,
        onTypeSelected: (type) {
          selectedType = type;
        },
      );
    }

    setUp(() {
      selectedType = null;
    });

    testWidgets('devrait afficher les 4 types de diabète', (tester) async {
      await pumpTestWidget(tester, createSelector());

      expect(find.text('Type 1'), findsOneWidget);
      expect(find.text('Type 2'), findsOneWidget);
      expect(find.text('Gestational'), findsOneWidget);
      expect(find.text('Other'), findsOneWidget);
    });

    testWidgets('devrait permettre de sélectionner Type 1', (tester) async {
      await pumpTestWidget(tester, createSelector());

      await tester.tap(find.text('Type 1'));
      await tester.pumpAndSettle();

      expect(selectedType, 'type1');
    });

    testWidgets('devrait permettre de sélectionner Type 2', (tester) async {
      await pumpTestWidget(tester, createSelector());

      await tester.tap(find.text('Type 2'));
      await tester.pumpAndSettle();

      expect(selectedType, 'type2');
    });

    testWidgets('devrait permettre de sélectionner Gestational',
            (tester) async {
          await pumpTestWidget(tester, createSelector());

          await tester.tap(find.text('Gestational'));
          await tester.pumpAndSettle();

          expect(selectedType, 'gestational');
        });

    testWidgets('devrait permettre de sélectionner Other', (tester) async {
      await pumpTestWidget(tester, createSelector());

      await tester.tap(find.text('Other'));
      await tester.pumpAndSettle();

      expect(selectedType, 'other');
    });

    testWidgets('un seul type devrait être sélectionnable à la fois',
            (tester) async {
          await pumpTestWidget(tester, createSelector());

          await tester.tap(find.text('Type 1'));
          await tester.pumpAndSettle();

          expect(selectedType, 'type1');

          await tester.tap(find.text('Type 2'));
          await tester.pumpAndSettle();

          expect(selectedType, 'type2');
        });

    testWidgets('devrait changer l\'apparence du bouton sélectionné',
            (tester) async {
          // Créer avec Type 1 déjà sélectionné
          selectedType = 'type1';
          await pumpTestWidget(tester, createSelector());

          // Vérifier que le conteneur a la couleur de sélection
          final type1Container = tester.widget<Container>(
            find.ancestor(
              of: find.text('Type 1'),
              matching: find.byType(Container),
            ).first,
          );

          final decoration = type1Container.decoration as BoxDecoration;
          expect(decoration.color, isNotNull);
        });
  });
}