import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import 'password_field.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onLoginSuccess;

  const LoginForm({
    super.key,
    required this.onLoginSuccess,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() => _isLoading = false);
        widget.onLoginSuccess();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email Field
        _buildLabel('Email Address'),
        const SizedBox(height: 4),
        _buildTextField(
          controller: _emailController,
          hint: 'name@example.com',
          icon: Icons.mail_outline,
          keyboardType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        // Password Field
        _buildLabel('Password'),
        const SizedBox(height: 4),
        PasswordField(controller: _passwordController),
        const SizedBox(height: 16),
        // Remember Me & Forgot Password
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildRememberMe(),
            _buildForgotPassword(),
          ],
        ),
        const SizedBox(height: 32),
        // Sign In Button
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: _isLoading ? null : _handleLogin,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: AppColors.onPrimary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(999),
              ),
              elevation: 8,
              shadowColor: AppColors.primary.withOpacity(0.3),
            ),
            child: _isLoading
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppColors.onPrimary,
                  ),
                ),
                const SizedBox(width: 12),
                Text(
                  'Authenticating...',
                  style: AppTypography.headlineMd.copyWith(
                    color: AppColors.onPrimary,
                  ),
                ),
              ],
            )
                : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign In',
                  style: AppTypography.headlineMd.copyWith(
                    color: AppColors.onPrimary,
                  ),
                ),
                const SizedBox(width: 8),
                const Icon(Icons.login, size: 20),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 4),
        child: Text(
          text,
          style: AppTypography.labelBold.copyWith(
            color: AppColors.onSurfaceVariant,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    required IconData icon,
    TextInputType? keyboardType,
  }) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant),
        color: AppColors.surfaceContainerLowest,
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: AppTypography.bodyMd.copyWith(
            color: AppColors.outline,
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.only(left: 12, right: 8),
            child: Icon(icon, color: AppColors.outline, size: 20),
          ),
          prefixIconConstraints: const BoxConstraints(
            minWidth: 48,
            minHeight: 24,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 12,
          ),
        ),
        style: AppTypography.bodyMd.copyWith(
          color: AppColors.onBackground,
        ),
      ),
    );
  }

  Widget _buildRememberMe() {
    return GestureDetector(
      onTap: () => setState(() => _rememberMe = !_rememberMe),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                color:
                _rememberMe ? AppColors.primary : AppColors.outlineVariant,
                width: 2,
              ),
              color: _rememberMe ? AppColors.primary : Colors.transparent,
            ),
            child: _rememberMe
                ? const Icon(Icons.check, size: 14, color: Colors.white)
                : null,
          ),
          const SizedBox(width: 12),
          Text(
            'Remember me',
            style: AppTypography.labelBold.copyWith(
              color: AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPassword() {
    return GestureDetector(
      onTap: () {},
      child: Text(
        'Forgot Password?',
        style: AppTypography.labelBold.copyWith(
          color: AppColors.primary,
        ),
      ),
    );
  }
}