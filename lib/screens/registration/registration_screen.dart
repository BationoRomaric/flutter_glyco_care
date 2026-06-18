import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_typography.dart';
import '../../routes/app_routes.dart';
import 'widgets/trust_elements.dart';
import 'widgets/registration_form.dart';


class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          // Top App Bar
          SliverAppBar(
            pinned: true,
            floating: false,
            backgroundColor: AppColors.surface.withOpacity(0.9),
            elevation: 1,
            shadowColor: Colors.black.withOpacity(0.05),
            title: Row(
              children: [
                const Icon(
                  Icons.medical_services,
                  color: AppColors.primary,
                  size: 28,
                ),
                const SizedBox(width: 8),
                Text(
                  'GlycoCare',
                  style: AppTypography.headlineMd.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Text(
                  'Patient Portal',
                  style: AppTypography.labelBold.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ),
            ],
          ),
          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Illustration
                  _buildIllustration(),
                  const SizedBox(height: 32),
                  // Trust Elements
                  const TrustElements(),
                  const SizedBox(height: 32),
                  // Form Title
                  Text(
                    'Create Your Account',
                    style: AppTypography.headlineLgMobile.copyWith(
                      color: AppColors.onSurface,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Join GlycoCare today for clinical-grade diabetes tracking.',
                    style: AppTypography.bodyLg.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(height: 24),
                  // Registration Form
                  RegistrationForm(
                    onRegistrationSuccess: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.dashboard,
                      );
                    },
                  ),
                  const SizedBox(height: 12),
                  // Back to Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppColors.primary,
                        side: const BorderSide(
                          color: AppColors.outlineVariant,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Back to Login',
                        style: AppTypography.labelBold.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIllustration() {
    return Center(
      child: Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          color: AppColors.secondaryContainer.withOpacity(0.2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32),
          child: Image.network(
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAMvhHegRqQnmQJQjz87GHr_FwTVaqk5MHkIvVCsYXT7LK-M6S2ucQR9BRfhai-S0p822IbGBYVTHEp8rSjcNajjIAqHKUFc4UW5mLwSWsjx2IN9_cQvjvRqHvuHlppCFbORdK444hSIvd812wAHphYuZ5bWzriIiX-hZWPAhzu9-aQAvyB7xLOzdwwq6r7hpWB8agRtnBmfMYxS5AqpqgZ820GQoIFPy4c18nEcYtINTedNOr1PlJBR6P68yYSpiHb6F08zauFJcGO',
            fit: BoxFit.contain,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32),
                  color: AppColors.primaryFixed,
                ),
                child: const Center(
                  child: Icon(
                    Icons.person,
                    size: 80,
                    color: AppColors.primary,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}