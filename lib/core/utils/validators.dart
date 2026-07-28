/// Reusable validation logic for the application.
class Validators {
  /// Validates email format.
  static String? email(String? value) {
    if (value == null || value.isEmpty) return 'Email is required';
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) return 'Enter a valid email address';
    return null;
  }

  /// Validates password strength and requirements.
  static String? password(String? value) {
    if (value == null || value.isEmpty) return 'Password is required';
    if (value.length < 8) return 'Password must be at least 8 characters';
    if (!value.contains(RegExp(r'[A-Z]'))) return 'Must contain an uppercase letter';
    if (!value.contains(RegExp(r'[a-z]'))) return 'Must contain a lowercase letter';
    if (!value.contains(RegExp(r'[0-9]'))) return 'Must contain a number';
    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) return 'Must contain a special character';
    return null;
  }

  /// Validates password confirmation.
  static String? confirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) return 'Please confirm your password';
    if (value != password) return 'Passwords do not match';
    return null;
  }

  /// Validates username format.
  static String? username(String? value) {
    if (value == null || value.isEmpty) return 'Username is required';
    if (value.length < 3) return 'Username must be at least 3 characters';
    if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
      return 'Only letters, numbers, and underscores allowed';
    }
    return null;
  }

  /// Validates required text fields.
  static String? required(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) return '$fieldName is required';
    return null;
  }

  /// Validates referral code format (optional).
  static String? referralCode(String? value) {
    if (value == null || value.isEmpty) return null;
    if (value.length < 4) return 'Referral code is too short';
    return null;
  }
}
