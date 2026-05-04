import 'package:cairo_clinics_finder/core/utils/app_regex.dart';
import 'package:cairo_clinics_finder/generated/locale_keys.g.dart';
import 'package:easy_localization/easy_localization.dart';

class AppValidator {
  static String? Function(String?) passwordValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.validation_password_required.tr();
      }
      if (!AppRegex.hasLowerCase(value)) {
        return LocaleKeys.validation_password_lowercase.tr();
      }
      if (!AppRegex.hasUpperCase(value)) {
        return LocaleKeys.validation_password_uppercase.tr();
      }
      if (!AppRegex.hasNumber(value)) {
        return LocaleKeys.validation_password_number.tr();
      }
      if (!AppRegex.hasSpecialCharacter(value)) {
        return LocaleKeys.validation_password_special.tr();
      }
      if (!AppRegex.hasMinLength(value)) {
        return LocaleKeys.validation_password_length.tr();
      }
      return null;
    };
  }

  static String? Function(String?) emailValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.validation_email_required.tr();
      }
      if (!AppRegex.isEmailValid(value)) {
        return LocaleKeys.validation_email_invalid.tr();
      }
      return null;
    };
  }

  static String? Function(String?) phoneValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.validation_phone_required.tr();
      }
      if (!AppRegex.isPhoneNumberValid(value)) {
        return LocaleKeys.validation_phone_invalid.tr();
      }
      return null;
    };
  }

  static String? Function(String?) nameValidator() {
    return (value) {
      if (value == null || value.isEmpty) {
        return LocaleKeys.validation_name_required.tr();
      }
      if (value.length < 3) {
        return LocaleKeys.validation_name_length.tr();
      }
      return null;
    };
  }
}
