import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../routes/app_routes.dart';
import '../../utils/app_assets.dart';
import '../../widgets/cached_illustration.dart';
import 'widgets/login_form.dart';
import 'widgets/biometric_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 480),
            color: AppColors.surface,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        const SizedBox(height: 40),
                        // Welcome Illustration
                        _buildWelcomeIllustration(),
                        const SizedBox(height: 24),
                        // Welcome Text
                        _buildWelcomeText(),
                        const SizedBox(height: 32),
                        // Login Form
                        LoginForm(
                          onLoginSuccess: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.dashboard,
                            );
                          },
                        ),
                        const SizedBox(height: 16),
                        // Divider
                        _buildDivider(),
                        const SizedBox(height: 16),
                        // Biometric Button
                        const BiometricButton(),
                      ],
                    ),
                  ),
                ),
                // Footer
                _buildFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomeIllustration() {
    return Center(
      child: CachedIllustration(
        assetPath: AppAssets.welcomeIllustration,
        networkUrl: AppAssets.welcomeIllustrationUrl,
        width: 288,
        height: 288,
        borderRadius: BorderRadius.circular(24),
      ),
    );
  }

  Widget _buildWelcomeText() {
    return Column(
      children: [
        Text(
          'Welcome Back',
          style: AppTypography.headlineLgMobile.copyWith(
            color: AppColors.primary,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Sign in to manage your health with GlycoCare.',
          style: AppTypography.bodyMd.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.outlineVariant,
            thickness: 1,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'OR SECURE ACCESS',
            style: AppTypography.caption.copyWith(
              color: AppColors.outline,
              letterSpacing: 0.5,
            ),
          ),
        ),
        const Expanded(
          child: Divider(
            color: AppColors.outlineVariant,
            thickness: 1,
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Text.rich(
            TextSpan(
              text: "Don't have an account? ",
              style: AppTypography.bodyMd.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
              children: [
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.registration);
                    },
                    child: Text(
                      'Create account',
                      style: AppTypography.labelBold.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.verified_user, color: AppColors.outline, size: 20),
              SizedBox(width: 24),
              Icon(Icons.shield, color: AppColors.outline, size: 20),
              SizedBox(width: 24),
              Icon(Icons.lock_person, color: AppColors.outline, size: 20),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'End-to-End Encrypted & HIPAA Compliant',
            style: AppTypography.caption.copyWith(
              color: AppColors.outline,
            ),
          ),
        ],
      ),
    );
  }
}