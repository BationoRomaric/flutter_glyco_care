import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

class CachedIllustration extends StatelessWidget {
  final String assetPath;
  final String networkUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final BorderRadius? borderRadius;

  const CachedIllustration({
    super.key,
    required this.assetPath,
    required this.networkUrl,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(24),
      child: Image.network(
        networkUrl,
        width: width,
        height: height,
        fit: fit,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return _buildLoadingPlaceholder();
        },
        errorBuilder: (context, error, stackTrace) {
          return _buildFallback();
        },
      ),
    );
  }

  Widget _buildLoadingPlaceholder() {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.surfaceContainer,
        borderRadius: borderRadius ?? BorderRadius.circular(24),
      ),
      child: const Center(
        child: CircularProgressIndicator(
          color: AppColors.primary,
        ),
      ),
    );
  }

  Widget _buildFallback() {
    return Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: AppColors.primaryFixed,
            borderRadius: borderRadius ?? BorderRadius.circular(24),
          ),
          child: const Center(
            child: Icon(
              Icons.medical_services,
              color: AppColors.primary,
              size: 80,
            ),
          ),
        );
      },
    );
  }
}