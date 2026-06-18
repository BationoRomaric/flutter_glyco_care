import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glyco_care/screens/login/widgets/login_form.dart';
import '../helpers/test_helpers.dart';

void main() {
  group('LoginForm', () {
    bool loginSuccessCalled = false;

    Widget createLoginForm() {
      return LoginForm(
        onLoginSuccess: () {
          loginSuccessCalled = true;
        },
      );
    }

    setUp(() {
      loginSuccessCalled = false;
    });

    testWidgets('devrait afficher les champs email et password',
            (tester) async {
          await pumpTestWidget(tester, createLoginForm());

          expect(find.text('Email Address'), findsOneWidget);
          expect(find.text('Password'), findsOneWidget);
        });

    testWidgets('devrait permettre la saisie de l\'email', (tester) async {
      await pumpTestWidget(tester, createLoginForm());

      final emailField = find.byType(TextField).first;
      await tester.enterText(emailField, 'test@example.com');

      expect(find.text('test@example.com'), findsOneWidget);
    });

    testWidgets('devrait permettre la saisie du mot de passe', (tester) async {
      await pumpTestWidget(tester, createLoginForm());

      final passwordField = find.byType(TextField).last;
      await tester.enterText(passwordField, 'password123');

      // Le texte ne devrait pas être visible car obscurci
      expect(find.text('password123'), findsNothing);
    });

    testWidgets('devrait afficher Remember me', (tester) async {
      await pumpTestWidget(tester, createLoginForm());

      expect(find.text('Remember me'), findsOneWidget);
    });

    testWidgets('devrait afficher Forgot Password', (tester) async {
      await pumpTestWidget(tester, createLoginForm());

      expect(find.text('Forgot Password?'), findsOneWidget);
    });

    testWidgets('devrait afficher le bouton Sign In', (tester) async {
      await pumpTestWidget(tester, createLoginForm());

      expect(find.text('Sign In'), findsOneWidget);
    });

    testWidgets('devrait appeler onLoginSuccess après authentification',
            (tester) async {
          await pumpTestWidget(tester, createLoginForm());

          final signInButton = find.text('Sign In');
          await tester.tap(signInButton);

          // Attendre l'animation de chargement
          await tester.pump(const Duration(seconds: 2));
          await tester.pumpAndSettle();

          expect(loginSuccessCalled, isTrue);
        });

    testWidgets('devrait montrer un indicateur de chargement pendant l\'auth',
            (tester) async {
          await pumpTestWidget(tester, createLoginForm());

          final signInButton = find.text('Sign In');
          await tester.tap(signInButton);
          await tester.pump();

          expect(find.text('Authenticating...'), findsOneWidget);
          expect(find.byType(CircularProgressIndicator), findsOneWidget);
        });

    testWidgets('devrait permettre de cocher Remember me', (tester) async {
      await pumpTestWidget(tester, createLoginForm());

      final rememberMe = find.text('Remember me');
      await tester.tap(rememberMe);
      await tester.pump();

      expect(find.byIcon(Icons.check), findsOneWidget);
    });
  });
}