import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glyco_care/screens/login/login_screen.dart';
import 'package:glyco_care/theme/app_colors.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('LoginScreen', () {
    late Widget loginScreen;

    setUp(() {
      loginScreen = const LoginScreen();
    });

    testWidgets('devrait afficher le titre Welcome Back', (tester) async {
      await pumpTestWidget(tester, loginScreen);

      expect(find.text('Welcome Back'), findsOneWidget);
    });

    testWidgets('devrait afficher le sous-titre', (tester) async {
      await pumpTestWidget(tester, loginScreen);

      expect(
        find.text('Sign in to manage your health with GlycoCare.'),
        findsOneWidget,
      );
    });

    testWidgets('devrait afficher le champ email', (tester) async {
      await pumpTestWidget(tester, loginScreen);

      expect(find.text('Email Address'), findsOneWidget);
      expect(find.byType(TextField), findsNWidgets(2)); // Email + Password
    });

    testWidgets('devrait afficher le champ password', (tester) async {
      await pumpTestWidget(tester, loginScreen);

      expect(find.text('Password'), findsOneWidget);
    });

    testWidgets('devrait permettre la saisie de l\'email', (tester) async {
      await pumpTestWidget(tester, loginScreen);

      final emailField = find.byType(TextField).first;
      await tester.enterText(emailField, 'test@example.com');

      expect(find.text('test@example.com'), findsOneWidget);
    });

    testWidgets('devrait avoir un bouton Sign In', (tester) async {
      await pumpTestWidget(tester, loginScreen);

      expect(find.text('Sign In'), findsOneWidget);
    });

    testWidgets('devrait afficher le lien Forgot Password', (tester) async {
      await pumpTestWidget(tester, loginScreen);

      expect(find.text('Forgot Password?'), findsOneWidget);
    });

    testWidgets('devrait afficher la case Remember me', (tester) async {
      await pumpTestWidget(tester, loginScreen);

      expect(find.text('Remember me'), findsOneWidget);
    });

    testWidgets('devrait afficher le bouton Face ID', (tester) async {
      await pumpTestWidget(tester, loginScreen);

      expect(find.text('Use Face ID or Touch ID'), findsOneWidget);
    });

    testWidgets('devrait afficher le divider OR SECURE ACCESS', (tester) async {
      await pumpTestWidget(tester, loginScreen);

      expect(find.text('OR SECURE ACCESS'), findsOneWidget);
    });

    testWidgets('devrait afficher le lien Create account', (tester) async {
      await pumpTestWidget(tester, loginScreen);

      expect(find.text('Create account'), findsOneWidget);
    });

    testWidgets('devrait afficher les icônes de sécurité dans le footer',
            (tester) async {
          await pumpTestWidget(tester, loginScreen);

          expect(find.byIcon(Icons.verified_user), findsOneWidget);
          expect(find.byIcon(Icons.shield), findsOneWidget);
          expect(find.byIcon(Icons.lock_person), findsOneWidget);
        });

    testWidgets('devrait afficher le texte HIPAA Compliant', (tester) async {
      await pumpTestWidget(tester, loginScreen);

      expect(
        find.text('End-to-End Encrypted & HIPAA Compliant'),
        findsOneWidget,
      );
    });

    testWidgets('le bouton Sign In devrait montrer un loader au clic',
            (tester) async {
          await pumpTestWidget(tester, loginScreen);

          final signInButton = find.text('Sign In');
          await tester.tap(signInButton);
          await tester.pump();

          expect(find.text('Authenticating...'), findsOneWidget);
        });

    testWidgets('devrait permettre de basculer la visibilité du mot de passe',
            (tester) async {
          await pumpTestWidget(tester, loginScreen);

          final visibilityButton = find.byIcon(Icons.visibility_outlined).first;
          await tester.tap(visibilityButton);
          await tester.pump();

          expect(find.byIcon(Icons.visibility_off_outlined), findsOneWidget);
        });

    testWidgets('devrait permettre de cocher Remember me', (tester) async {
      await pumpTestWidget(tester, loginScreen);

      final rememberMe = find.text('Remember me');
      await tester.tap(rememberMe);
      await tester.pump();

      expect(find.byIcon(Icons.check), findsOneWidget);
    });
  });
}