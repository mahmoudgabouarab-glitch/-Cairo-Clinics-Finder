import 'package:cairo_clinics_finder/core/utils/app_regex.dart';

class AppValidator {
  static String? Function(String?)? passwordValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your password';
      }
      if (!AppRegex.hasLowerCase(value)) {
        return 'Password must contain at least one lowercase letter';
      }
      if (!AppRegex.hasUpperCase(value)) {
        return 'Password must contain at least one uppercase letter';
      }
      if (!AppRegex.hasNumber(value)) {
        return 'Password must contain at least one number';
      }
      if (!AppRegex.hasSpecialCharacter(value)) {
        return 'Password must contain at least one special character';
      }
      if (!AppRegex.hasMinLength(value)) {
        return 'Password must be at least 8 characters long';
      }
      return null;
    };
  }

  static String? Function(String?)? emailValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your email';
      }

      if (!AppRegex.isEmailValid(value)) {
        return 'Invalid email address';
      }

      return null;
    };
  }

  static String? Function(String?)? phoneValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your phone';
      }

      if (!AppRegex.isPhoneNumberValid(value)) {
        return 'Invalid phone number';
      }

      return null;
    };
  }

  static String? Function(String?)? nameValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter your name';
      }
      if (value.length < 3) {
        return 'Name must be at least 3 characters long';
      }
      return null;
    };
  }
}
