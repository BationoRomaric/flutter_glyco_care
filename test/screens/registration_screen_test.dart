import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glyco_care/screens/registration/registration_screen.dart';
import 'package:glyco_care/theme/app_colors.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('RegistrationScreen', () {
    late Widget registrationScreen;

    setUp(() {
      registrationScreen = const RegistrationScreen();
    });

    testWidgets('devrait afficher le titre Create Your Account',
            (tester) async {
          await pumpTestWidget(tester, registrationScreen);

          expect(find.text('Create Your Account'), findsOneWidget);
        });

    testWidgets('devrait afficher le sous-titre', (tester) async {
      await pumpTestWidget(tester, registrationScreen);

      expect(
        find.text('Join GlycoCare today for clinical-grade diabetes tracking.'),
        findsOneWidget,
      );
    });

    testWidgets('devrait afficher le champ Full Name', (tester) async {
      await pumpTestWidget(tester, registrationScreen);

      expect(find.text('Full Name'), findsOneWidget);
    });

    testWidgets('devrait afficher le champ Date of Birth', (tester) async {
      await pumpTestWidget(tester, registrationScreen);

      expect(find.text('Date of Birth'), findsOneWidget);
    });

    testWidgets('devrait afficher le champ Gender Identity', (tester) async {
      await pumpTestWidget(tester, registrationScreen);

      expect(find.text('Gender Identity'), findsOneWidget);
    });

    testWidgets('devrait afficher le champ Email Address', (tester) async {
      await pumpTestWidget(tester, registrationScreen);

      expect(find.text('Email Address'), findsOneWidget);
    });

    testWidgets('devrait afficher les champs Password', (tester) async {
      await pumpTestWidget(tester, registrationScreen);

      expect(find.text('Password'), findsOneWidget);
      expect(find.text('Confirm Password'), findsOneWidget);
    });

    testWidgets('devrait afficher le sélecteur Diabetes Type', (tester) async {
      await pumpTestWidget(tester, registrationScreen);

      expect(find.text('Diabetes Type'), findsOneWidget);
      expect(find.text('Type 1'), findsOneWidget);
      expect(find.text('Type 2'), findsOneWidget);
      expect(find.text('Gestational'), findsOneWidget);
      expect(find.text('Other'), findsOneWidget);
    });

    testWidgets('devrait permettre la sélection du type de diabète',
            (tester) async {
          await pumpTestWidget(tester, registrationScreen);

          final type1Button = find.text('Type 1');
          await tester.tap(type1Button);
          await tester.pumpAndSettle();

          // Vérifier que le bouton est sélectionné (change de couleur)
          final container = tester.widget<Container>(
            find.ancestor(
              of: find.text('Type 1'),
              matching: find.byType(Container),
            ).first,
          );

          final decoration = container.decoration as BoxDecoration;
          expect(decoration.color, isNotNull);
        });

    testWidgets('devrait afficher la case de consentement', (tester) async {
      await pumpTestWidget(tester, registrationScreen);

      expect(
        find.textContaining('I consent to the secure handling'),
        findsOneWidget,
      );
      expect(find.text('Privacy Policy'), findsOneWidget);
    });

    testWidgets('devrait afficher le bouton Create Account', (tester) async {
      await pumpTestWidget(tester, registrationScreen);

      expect(find.text('Create Account'), findsOneWidget);
    });

    testWidgets('devrait afficher le bouton Back to Login', (tester) async {
      await pumpTestWidget(tester, registrationScreen);

      expect(find.text('Back to Login'), findsOneWidget);
    });

    testWidgets('devrait afficher les éléments de confiance', (tester) async {
      await pumpTestWidget(tester, registrationScreen);

      expect(
        find.textContaining('Your health data is encrypted'),
        findsOneWidget,
      );
      expect(
        find.textContaining('Recommended by over 500+ clinics'),
        findsOneWidget,
      );
    });

    testWidgets('devrait afficher le footer avec copyright', (tester) async {
      await pumpTestWidget(tester, registrationScreen);

      expect(
        find.textContaining('2024 GlycoCare Medical Systems'),
        findsOneWidget,
      );
    });

    testWidgets('devrait valider le formulaire avant soumission',
            (tester) async {
          await pumpTestWidget(tester, registrationScreen);

          // Tenter de soumettre sans remplir
          final submitButton = find.text('Create Account');
          await tester.tap(submitButton);
          await tester.pumpAndSettle();

          // Vérifier que les erreurs de validation apparaissent
          expect(find.text('Full name is required'), findsWidgets);
        });

    testWidgets('devrait permettre de remplir le formulaire complet',
            (tester) async {
          await pumpTestWidget(tester, registrationScreen);

          // Remplir les champs
          await tester.enterText(find.byType(TextFormField).at(0), 'John Doe');
          await tester.enterText(
              find.byType(TextFormField).at(2), 'john@example.com');
          await tester.enterText(find.byType(TextFormField).at(3), 'password123');
          await tester.enterText(find.byType(TextFormField).at(4), 'password123');

          // Sélectionner le type de diabète
          await tester.tap(find.text('Type 1'));
          await tester.pumpAndSettle();

          // Cocher le consentement
          await tester.tap(find.textContaining('I consent'));
          await tester.pumpAndSettle();

          // Vérifier que le formulaire est rempli
          expect(find.text('John Doe'), findsOneWidget);
          expect(find.text('john@example.com'), findsOneWidget);
        });

    testWidgets('devrait retourner à l\'écran de connexion', (tester) async {
      await pumpTestWidget(tester, registrationScreen);

      final backButton = find.text('Back to Login');
      await tester.tap(backButton);
      await tester.pumpAndSettle();

      // Vérifier que l'écran de connexion est affiché
      expect(find.text('Welcome Back'), findsOneWidget);
    });
  });
}