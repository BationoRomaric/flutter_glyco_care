import 'package:flutter/material.dart';
import '../../../theme/app_colors.dart';
import '../../../theme/app_typography.dart';
import 'diabetes_type_selector.dart';
import 'consent_checkbox.dart';

class RegistrationForm extends StatefulWidget {
  final VoidCallback onRegistrationSuccess;

  const RegistrationForm({
    super.key,
    required this.onRegistrationSuccess,
  });

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameController = TextEditingController();
  final _dobController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _selectedGender;
  String? _selectedDiabetesType;
  bool _consentGiven = false;
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  void dispose() {
    _fullNameController.dispose();
    _dobController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      if (!_consentGiven) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Please accept the Privacy Policy to continue.'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
        );
        return;
      }
      widget.onRegistrationSuccess();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Full Name
          _buildLabel('Full Name'),
          const SizedBox(height: 4),
          _buildTextField(
            controller: _fullNameController,
            hint: 'Enter your full legal name',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Full name is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // DOB & Gender Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Date of Birth'),
                    const SizedBox(height: 4),
                    _buildDateField(),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Gender Identity'),
                    const SizedBox(height: 4),
                    _buildGenderDropdown(),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Email
          _buildLabel('Email Address'),
          const SizedBox(height: 4),
          _buildTextField(
            controller: _emailController,
            hint: 'name@example.com',
            keyboardType: TextInputType.emailAddress,
            prefixIcon: Icons.email_outlined,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Email is required';
              }
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return 'Enter a valid email address';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),

          // Password Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Password'),
                    const SizedBox(height: 4),
                    _buildPasswordField(
                      controller: _passwordController,
                      obscureText: _obscurePassword,
                      onToggleVisibility: () {
                        setState(() => _obscurePassword = !_obscurePassword);
                      },
                      hint: 'Min. 8 characters',
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 8) {
                          return 'Min. 8 characters';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLabel('Confirm Password'),
                    const SizedBox(height: 4),
                    _buildPasswordField(
                      controller: _confirmPasswordController,
                      obscureText: _obscureConfirmPassword,
                      onToggleVisibility: () {
                        setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                      },
                      hint: 'Repeat password',
                      validator: (value) {
                        if (value != _passwordController.text) {
                          return 'Passwords do not match';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Diabetes Type Selector
          _buildLabel('Diabetes Type'),
          const SizedBox(height: 12),
          DiabetesTypeSelector(
            selectedType: _selectedDiabetesType,
            onTypeSelected: (type) {
              setState(() => _selectedDiabetesType = type);
            },
          ),
          const SizedBox(height: 24),

          // Consent Checkbox
          ConsentCheckbox(
            isChecked: _consentGiven,
            onChanged: (value) {
              setState(() => _consentGiven = value);
            },
          ),
          const SizedBox(height: 32),

          // Submit Button
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: _handleSubmit,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.onPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 8,
                shadowColor: AppColors.primary.withOpacity(0.3),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create Account',
                    style: AppTypography.labelBold.copyWith(
                      color: AppColors.onPrimary,
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Icon(Icons.arrow_forward, size: 18),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Text(
      text,
      style: AppTypography.labelBold.copyWith(
        color: AppColors.onSurfaceVariant,
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String hint,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
    IconData? prefixIcon,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      style: AppTypography.bodyMd.copyWith(
        color: AppColors.onSurface,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTypography.bodyMd.copyWith(
          color: AppColors.outline,
        ),
        prefixIcon: prefixIcon != null
            ? Padding(
          padding: const EdgeInsets.only(left: 12, right: 8),
          child: Icon(
            prefixIcon,
            color: AppColors.outline,
            size: 20,
          ),
        )
            : null,
        filled: true,
        fillColor: AppColors.surfaceContainerLowest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback onToggleVisibility,
    required String hint,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: AppTypography.bodyMd.copyWith(
        color: AppColors.onSurface,
      ),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: AppTypography.bodyMd.copyWith(
          color: AppColors.outline,
        ),
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12, left: 8),
          child: GestureDetector(
            onTap: onToggleVisibility,
            child: Icon(
              obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: AppColors.outline,
              size: 20,
            ),
          ),
        ),
        filled: true,
        fillColor: AppColors.surfaceContainerLowest,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.outlineVariant),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.error, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }

  Widget _buildDateField() {
    return GestureDetector(
      onTap: () async {
        final date = await showDatePicker(
          context: context,
          initialDate: DateTime(1990),
          firstDate: DateTime(1900),
          lastDate: DateTime.now(),
          builder: (context, child) {
            return Theme(
              data: Theme.of(context).copyWith(
                colorScheme: const ColorScheme.light(
                  primary: AppColors.primary,
                ),
              ),
              child: child!,
            );
          },
        );
        if (date != null) {
          _dobController.text =
          '${date.month.toString().padLeft(2, '0')}/${date.day.toString().padLeft(2, '0')}/${date.year}';
        }
      },
      child: AbsorbPointer(
        child: _buildTextField(
          controller: _dobController,
          hint: 'MM/DD/YYYY',
          prefixIcon: Icons.calendar_today_outlined,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Date of birth is required';
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildGenderDropdown() {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.outlineVariant),
        color: AppColors.surfaceContainerLowest,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _selectedGender,
          hint: Text(
            'Select gender',
            style: AppTypography.bodyMd.copyWith(
              color: AppColors.outline,
            ),
          ),
          isExpanded: true,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: AppColors.outline,
          ),
          items: const [
            DropdownMenuItem(
              value: 'female',
              child: Text('Female'),
            ),
            DropdownMenuItem(
              value: 'male',
              child: Text('Male'),
            ),
            DropdownMenuItem(
              value: 'non-binary',
              child: Text('Non-binary'),
            ),
            DropdownMenuItem(
              value: 'prefer_not_to_say',
              child: Text('Prefer not to say'),
            ),
          ],
          onChanged: (value) {
            setState(() => _selectedGender = value);
          },
          style: AppTypography.bodyMd.copyWith(
            color: AppColors.onSurface,
          ),
        ),
      ),
    );
  }
}