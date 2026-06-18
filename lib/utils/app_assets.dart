import 'package:flutter/material.dart';

class AppAssets {
  // Images
  static const String welcomeIllustration = 'assets/images/welcome_illustration.png';
  static const String doctorIllustration = 'assets/images/doctor_illustration.png';
  static const String avatarPlaceholder = 'assets/images/avatar_placeholder.png';
  static const String logo = 'assets/images/logo.png';

  // Icônes
  static const String appIcon = 'assets/icons/app_icon.png';
  static const String appIconForeground = 'assets/icons/app_icon_foreground.png';
  static const String notificationBadge = 'assets/icons/notification_badge.png';

  // URLs distantes (fallback)
  static const String welcomeIllustrationUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuCAi1o-GB18_0kvyu60_vkUFVXtzlgf8b-CFQAQj_vLSfvVCUdbFSFoPG1OP1w8UzW8k9xRCEdns5wd6SFAE2SvBRjkK1XQH8tExPoRbbgMXpR1XhSBLSrsPWndDZznd-aDVmxy8OdJq9R1PQocZCHnRNXvwsnySffXUedamZI-t1E4uloQD9Z6ek5LALq_cG2GqlwqXOFIXGlhdcqDWztikBQTga-rjLnXvIc7eCiEIbVdFpeOaoWxzI-y9nvzsVEqx9Zwo3xcGsBv';

  static const String doctorIllustrationUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuAMvhHegRqQnmQJQjz87GHr_FwTVaqk5MHkIvVCsYXT7LK-M6S2ucQR9BRfhai-S0p822IbGBYVTHEp8rSjcNajjIAqHKUFc4UW5mLwSWsjx2IN9_cQvjvRqHvuHlppCFbORdK444hSIvd812wAHphYuZ5bWzriIiX-hZWPAhzu9-aQAvyB7xLOzdwwq6r7hpWB8agRtnBmfMYxS5AqpqgZ820GQoIFPy4c18nEcYtINTedNOr1PlJBR6P68yYSpiHb6F08zauFJcGO';

  static const String avatarUrl =
      'https://lh3.googleusercontent.com/aida-public/AB6AXuD-IQve8w5Vstn_OHW6EfUoOQVUzlh-sff6eucVjlGDXEh5bPhc5nTA-5genM0APtVvVmpIJ_oIM_fQsjbkLa8lhjFgKwmtWA0DLFgz7DQNGdJn1PMdZ_qxTZMw4YYHrSBh5UDR0daaP17t1cwdB3P7rIjNG21dqHnVIvzjhIEtHHNAq7uULEUkCQq6eFJmzFDrvyJaJt56G7JgzXKLhr_nCMtV5cGVndsgEyWx7kdK7T591oWZtt3tkzWeWqakmccUTRtyLjp-0SNl';

  // Méthodes helper pour charger les images avec fallback
  static Widget loadImage({
    required String assetPath,
    String? networkUrl,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    Widget? errorWidget,
  }) {
    return Image.asset(
      assetPath,
      width: width,
      height: height,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        if (networkUrl != null) {
          return Image.network(
            networkUrl,
            width: width,
            height: height,
            fit: fit,
            errorBuilder: (context, error, stackTrace) {
              return errorWidget ?? _defaultErrorWidget();
            },
          );
        }
        return errorWidget ?? _defaultErrorWidget();
      },
    );
  }

  static Widget _defaultErrorWidget() {
    return Container(
      color: const Color(0xFFDBE1FF),
      child: const Center(
        child: Icon(
          Icons.broken_image_outlined,
          color: Color(0xFF004CCD),
          size: 48,
        ),
      ),
    );
  }
}