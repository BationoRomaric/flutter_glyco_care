import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.06),
            blurRadius: 20,
          ),
        ],
        border: Border.all(
          color: AppColors.outlineVariant.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.person, color: AppColors.primary, size: 20),
              const SizedBox(width: 8),
              Text(
                'PROFILE',
                style: AppTypography.labelBold.copyWith(
                  color: AppColors.onSurfaceVariant,
                  letterSpacing: 1.4,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Stack(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.primary.withOpacity(0.2),
                        width: 2,
                      ),
                    ),
                    child: ClipOval(
                      child: Image.network(
                        'https://lh3.googleusercontent.com/aida-public/AB6AXuCMzB-zWFDGAroSMs4DWIm_HoFwWcEk94rOBaaL-DYpPujKq-IjhlrvGl4s8gNhGkj1D62e2XcSgrAesAcwg8kKlrakVPad4CJUXulG1PtrbiDN2WwY4fcOEk635VY_75Hp0pk0ugu2Z4pF2ujTDI6Y8EWd7Tj3_hb8kNaE2F9uFBBUoA2kIe3FYg4btv2AFRgC_jXy0otc6ZzIJGpMGLSTVx0EquUmV42LAdSya8jlgJ_xK9gQ9UhG7-8eEaVvdd_FhW7jt1JhpzPt',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: AppColors.primaryContainer,
                          child: const Icon(Icons.person, color: AppColors.primary),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.white,
                        size: 14,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Johnathan Doe',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: AppColors.onSurface,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'john.doe@example.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: AppColors.outline,
              ),
            ],
          ),
        ],
      ),
    );
  }
}